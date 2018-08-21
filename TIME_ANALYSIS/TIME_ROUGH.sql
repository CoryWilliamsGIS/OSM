/*
TIME ANALYSIS 

FILES WORKING WITH INCLUDE:

eng2008_
eng_nairobi_
nairobi_
kenya_
kenya_nairobi (prior to running st_contains to only include Nairobi edits)... new files = nairobi2008_
*/

--TOTAL TABLE COUNT 
select count(*) from public.kenya2008_point

--TOTAL TABLE COUNT WITHIN NAIROBI (SANITY CHECK)
select count(*) from public.kenya2008_point, public.nairobi_consts
where st_contains(public.nairobi_consts.geom, public.kenya2008_point.way)

--CREATE A NEW TABLE ONLY INCLUDING NAIROBI EDITS 
create table nairobi2008_point as (
select * from public.kenya2008_point, public.nairobi_consts
where st_contains(public.nairobi_consts.geom, public.kenya2008_point.way)
)

create table nairobi2008_line as (
select * from public.kenya2008_line, public.nairobi_consts
where st_contains(public.nairobi_consts.geom, public.kenya2008_line.way)
)

create table nairobi2008_polygon as (
select * from public.kenya2008_polygon, public.nairobi_consts
where st_contains(public.nairobi_consts.geom, public.kenya2008_polygon.way)
)

--delete zeros whilst making a note of the number of records deleted 
delete from nairobi2008_point where osm_uid = '0' --0
delete from nairobi2008_line where osm_uid = '0' --0
delete from nairobi2008_polygon where osm_uid = '0' --0

--create POI table 
create table nairobi2008_poi as (
select * from nairobi2008_point where
"access" is not null or
"addr:housename" is not null or
"addr:housenumber" is not null or
"addr:place" is not null or
"addr:city" is not null or
"addr:country" is not null or
"addr:interpolation" is not null or
admin_level is not null or
aerialway is not null or
aeroway is not null or
amenity is not null or
area is not null or
barrier is not null or
bicycle is not null or
brand is not null or
bridge is not null or
boundary is not null or
building is not null or
capital is not null or
construction is not null or
covered is not null or
culvert is not null or
cutting is not null or
denomination is not null or
disused is not null or
ele is not null or
embankment is not null or
foot is not null or
"generator:source" is not null or
harbour is not null or
highway is not null or
historic is not null or
horse is not null or
intermittent is not null or
junction is not null or
landuse is not null or
layer is not null or
leisure is not null or
"lock" is not null or
man_made is not null or
military is not null or
motorcar is not null or
name is not null or
"natural" is not null or
office is not null or
oneway is not null or
"operator" is not null or
place is not null or
population is not null or
"power" is not null or
power_source is not null or
public_transport is not null or
railway is not null or
"ref" is not null or
religion is not null or
route is not null or
service is not null or
shop is not null or
sport is not null or
surface is not null or
toll is not null or
tourism is not null or
"tower:type" is not null or
tunnel is not null or
water is not null or
waterway is not null or
wetland is not null or
width is not null or
wood is not null
)




--REMOVE BULK IMPORTS

--check if any bulk imports exist prior to removing... this is to avoid unnecessary table creation in the earlier years
select osm_timestamp::date, osm_uid, count(*)
from public.nairobi2008_poi
group by osm_timestamp::date, osm_uid
order by count(*) desc

select osm_timestamp::date, osm_uid, count(*)
from public.nairobi2008_line
group by osm_timestamp::date, osm_uid
order by count(*) desc

select osm_timestamp::date, osm_uid, count(*)
from public.nairobi2008_polygon
group by osm_timestamp::date, osm_uid
order by count(*) desc

--nairobi2008_poi = 0 bulk edits to be removed
--nairobi2008_line = 0 bulk edits to be removed
--nairobi2008_polygon = 0 bulk edits to be removed


--INFERRING LOCALS

create table n_2008_local as (
select osm_uid, 
sum(coalesce(points_within, 0)) + sum(coalesce(line_within, 0)) + sum(coalesce(polygon_within, 0)) as total_within,
sum(coalesce(points_total, 0)) + sum(coalesce(line_total, 0)) + sum(coalesce(polygon_total, 0)) as total_total,
round(((select sum(coalesce(points_within, 0)) + sum(coalesce(line_within, 0)) + sum(coalesce(polygon_within, 0))) /
((select sum(coalesce(points_total, 0.0000000000000000000000001)) + sum(coalesce(line_total, 0.0000000000000000000001)) + sum(coalesce(polygon_total, 0.000000001)))) *100),2) as percent
	from (
	select * from (
select osm_uid from public.kenya2008_point
    union 
	select osm_uid from public.kenya2008_line
	union
	select osm_uid from public.kenya2008_polygon)
	as kosm_uid
) tbl0
inner join
(
	SELECT osm_uid as point_osm_uid, count(*) as points_within
FROM kenya2008_point, nairobi_consts
WHERE ST_within(kenya2008_point.way, nairobi_consts.geom)
	group by osm_uid
) tbl1
on tbl0.osm_uid = tbl1.point_osm_uid
inner join
(	SELECT osm_uid as osm_uid2, count(*) as points_total
FROM kenya2008_point
 group by osm_uid
) tbl2
on tbl0.osm_uid = tbl2.osm_uid2
full outer join
(
	SELECT osm_uid as line_osm_uid, count(*) as line_within
FROM kenya2008_line, nairobi_consts
WHERE ST_within(kenya2008_line.way, nairobi_consts.geom)
	group by osm_uid
) tbl3
on tbl0.osm_uid = tbl3.line_osm_uid
full outer join
(	SELECT osm_uid as osm_uid2, count(*) as line_total
FROM kenya2008_line
 group by osm_uid
) tbl4
on tbl0.osm_uid = tbl4.osm_uid2
full outer join
(
	SELECT osm_uid as polygon_osm_uid, count(*) as polygon_within
FROM kenya2008_polygon, nairobi_consts
WHERE ST_within(kenya2008_polygon.way, nairobi_consts.geom)
	group by osm_uid
) tbl5
on tbl0.osm_uid = tbl5.polygon_osm_uid
full outer join 
(	SELECT osm_uid as osm_uid2, count(*) as polygon_total
FROM kenya2008_polygon
 group by osm_uid
) tbl6
on tbl0.osm_uid = tbl6.osm_uid2
group by tbl0.osm_uid, tbl1.point_osm_uid, tbl1.points_within, tbl2.osm_uid2, tbl2.points_total,
tbl3.line_osm_uid, tbl3.line_within, tbl4.osm_uid2, tbl4.line_total, tbl5.polygon_osm_uid, tbl5.polygon_within,  tbl6.osm_uid2, tbl6.polygon_total
order by percent desc 
)



select osm_uid, percent from n_2008_local
where osm_uid is not null and 
percent between 70 and 100
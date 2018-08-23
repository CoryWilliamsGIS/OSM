/*
Time Analysis - Nairobi 

This is an example script once the OpenStreetMap data is in PostgreSQL.

This will be focusing on one case study (Nairobi) and one year (2012).

Please note, every section of this analysis was re-run for each year (2012-2012) and the other case study (Greater Manchester).

Multiple other files hold the different stages of SQL analysis.

Original OSM data being used in this include:
kenya_2012 - snapshot extracted from full history dump using osmium
Nairobi data was extracted from this file.
*/

--Extract Nairobi data from the Kenya file using shapefiles
--NOTE: OSM data which extends constituency boundary (is not fully contained within a single constituency) is automatically removed at this stages
--CREATE A NEW TABLE ONLY INCLUDING NAIROBI EDITS 
create table nairobi2012_point as (
select * from public.kenya2012_point, public.nairobi_consts
where st_contains(public.nairobi_consts.geom, public.kenya2012_point.way)
);

create table nairobi2012_line as (
select * from public.kenya2012_line, public.nairobi_consts
where st_contains(public.nairobi_consts.geom, public.kenya2012_line.way)
);

create table nairobi2012_polygon as (
select * from public.kenya2012_polygon, public.nairobi_consts
where st_contains(public.nairobi_consts.geom, public.kenya2012_polygon.way)
);

--Delete anonymous imports
--NOTE: None were present
delete from nairobi2012_point where osm_uid = '0'; 
delete from nairobi2012_line where osm_uid = '0'; 
delete from nairobi2012_polygon where osm_uid = '0'; 


--BULK IMPORTS

--Check if bulk imports are present in each table 
--Results extracted to CSV file to formulate SQL scripts which will delete the necessary data 
select osm_timestamp::date, osm_uid, count(*)
from public.nairobi2012_point
group by osm_timestamp::date, osm_uid
order by count(*) desc;

select osm_timestamp::date, osm_uid, count(*)
from public.nairobi2012_line
group by osm_timestamp::date, osm_uid
order by count(*) desc;

select osm_timestamp::date, osm_uid, count(*)
from public.nairobi2012_polygon
group by osm_timestamp::date, osm_uid
order by count(*) desc;


--Deleting the data associated with bulk imports
--Only necessary to remove imports from one table
delete from nairobi2012_point where
osm_uid ='215343' and osm_timestamp::date ='2010-01-12' or
osm_uid ='408968' and osm_timestamp::date ='2011-09-15' or
osm_uid ='408968' and osm_timestamp::date ='2011-09-08' or
osm_uid ='408968' and osm_timestamp::date ='2011-07-29' or
osm_uid ='408968' and osm_timestamp::date ='2011-08-11' or
osm_uid ='408968' and osm_timestamp::date ='2011-09-17' or
osm_uid ='408968' and osm_timestamp::date ='2011-07-28' or
osm_uid ='408968' and osm_timestamp::date ='2011-08-16' or
osm_uid ='408968' and osm_timestamp::date ='2011-07-26' or
osm_uid ='408968' and osm_timestamp::date ='2011-10-13' or
osm_uid ='408968' and osm_timestamp::date ='2011-08-09' or
osm_uid ='18236' and osm_timestamp::date ='2009-04-13' or
osm_uid ='408968' and osm_timestamp::date ='2011-07-30' or
osm_uid ='408968' and osm_timestamp::date ='2011-09-05' or
osm_uid ='232642' and osm_timestamp::date ='2011-11-22' or
osm_uid ='18236' and osm_timestamp::date ='2012-07-26' or
osm_uid ='408968' and osm_timestamp::date ='2011-09-11' or
osm_uid ='18236' and osm_timestamp::date ='2012-07-25' or
osm_uid ='408968' and osm_timestamp::date ='2011-08-18' or
osm_uid ='18236' and osm_timestamp::date ='2012-07-24' or
osm_uid ='408968' and osm_timestamp::date ='2011-08-28' or
osm_uid ='408968' and osm_timestamp::date ='2011-08-08';


--INFERRING LOCALS

--obtain the percentage of edits which are within Nairobi per user (out of all edits in Kenya)
create table n_2012_local as (
select osm_uid, 
sum(coalesce(points_within, 0)) + sum(coalesce(line_within, 0)) + sum(coalesce(polygon_within, 0)) as total_within,
sum(coalesce(points_total, 0)) + sum(coalesce(line_total, 0)) + sum(coalesce(polygon_total, 0)) as total_total,
round(((select sum(coalesce(points_within, 0)) + sum(coalesce(line_within, 0)) + sum(coalesce(polygon_within, 0))) /
((select sum(coalesce(points_total, 0.0000000000000000000000001)) + sum(coalesce(line_total, 0.0000000000000000000001)) + sum(coalesce(polygon_total, 0.000000001)))) *100),2) as percent
	from (
	select * from (
select osm_uid from public.kenya2012_point
    union 
	select osm_uid from public.kenya2012_line
	union
	select osm_uid from public.kenya2012_polygon)
	as kosm_uid
) tbl0
inner join
(
	SELECT osm_uid as point_osm_uid, count(*) as points_within
FROM kenya2012_point, nairobi_consts
WHERE ST_within(kenya2012_point.way, nairobi_consts.geom)
	group by osm_uid
) tbl1
on tbl0.osm_uid = tbl1.point_osm_uid
inner join
(	SELECT osm_uid as osm_uid2, count(*) as points_total
FROM kenya2012_point
 group by osm_uid
) tbl2
on tbl0.osm_uid = tbl2.osm_uid2
full outer join
(
	SELECT osm_uid as line_osm_uid, count(*) as line_within
FROM kenya2012_line, nairobi_consts
WHERE ST_within(kenya2012_line.way, nairobi_consts.geom)
	group by osm_uid
) tbl3
on tbl0.osm_uid = tbl3.line_osm_uid
full outer join
(	SELECT osm_uid as osm_uid2, count(*) as line_total
FROM kenya2012_line
 group by osm_uid
) tbl4
on tbl0.osm_uid = tbl4.osm_uid2
full outer join
(
	SELECT osm_uid as polygon_osm_uid, count(*) as polygon_within
FROM kenya2012_polygon, nairobi_consts
WHERE ST_within(kenya2012_polygon.way, nairobi_consts.geom)
	group by osm_uid
) tbl5
on tbl0.osm_uid = tbl5.polygon_osm_uid
full outer join 
(	SELECT osm_uid as osm_uid2, count(*) as polygon_total
FROM kenya2012_polygon
 group by osm_uid
) tbl6
on tbl0.osm_uid = tbl6.osm_uid2
group by tbl0.osm_uid, tbl1.point_osm_uid, tbl1.points_within, tbl2.osm_uid2, tbl2.points_total,
tbl3.line_osm_uid, tbl3.line_within, tbl4.osm_uid2, tbl4.line_total, tbl5.polygon_osm_uid, tbl5.polygon_within,  tbl6.osm_uid2, tbl6.polygon_total
order by percent desc 
);

--Obtain inferred local UID's from the resulting table (>=70% edits in Nairobi)
--Data extracted to CSV to create scripts to create final tables for analysis
select osm_uid, percent from n_2012_local
where osm_uid is not null and 
percent between 70 and 100;


--Create a POI table from the point table
--This removes the nodes (point data) associated with the vertices of the line & polygon features
--create POI table 
create table nairobi2012_poi as (
select * from nairobi2012_point where
"access" is not null or
"addr:houseconstituen" is not null or
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
constituen is not null or
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
);


--Creating the final tables for analysis
--This extracts only the edits created by the inferred locals (see above)
create table n2012_final_poi as (
select * from nairobi2012_poi where
osm_uid ='152289' or
osm_uid ='16315' or
osm_uid ='338611' or
osm_uid ='109852' or
osm_uid ='114161' or
osm_uid ='116004' or
osm_uid ='121415' or
osm_uid ='123574' or
osm_uid ='12614' or
osm_uid ='129447' or
osm_uid ='1295' or
osm_uid ='131735' or
osm_uid ='151957' or
osm_uid ='170672' or
osm_uid ='18069' or
osm_uid ='191112' or
osm_uid ='192021' or
osm_uid ='19239' or
osm_uid ='193865' or
osm_uid ='19862' or
osm_uid ='20163' or
osm_uid ='202858' or
osm_uid ='207249' or
osm_uid ='215343' or
osm_uid ='216549' or
osm_uid ='22108' or
osm_uid ='227137' or
osm_uid ='230870' or
osm_uid ='232312' or
osm_uid ='243041' or
osm_uid ='252326' or
osm_uid ='25504' or
osm_uid ='261003' or
osm_uid ='261018' or
osm_uid ='261052' or
osm_uid ='265690' or
osm_uid ='28052' or
osm_uid ='283266' or
osm_uid ='286581' or
osm_uid ='297047' or
osm_uid ='297215' or
osm_uid ='301356' or
osm_uid ='310392' or
osm_uid ='31075' or
osm_uid ='324047' or
osm_uid ='33073' or
osm_uid ='336481' or
osm_uid ='344031' or
osm_uid ='346151' or
osm_uid ='352832' or
osm_uid ='355242' or
osm_uid ='355617' or
osm_uid ='3585' or
osm_uid ='383494' or
osm_uid ='383550' or
osm_uid ='384773' or
osm_uid ='398864' or
osm_uid ='400795' or
osm_uid ='413785' or
osm_uid ='415989' or
osm_uid ='42429' or
osm_uid ='425742' or
osm_uid ='42619' or
osm_uid ='429923' or
osm_uid ='429943' or
osm_uid ='429994' or
osm_uid ='433827' or
osm_uid ='435017' or
osm_uid ='43972' or
osm_uid ='440940' or
osm_uid ='44659' or
osm_uid ='451142' or
osm_uid ='474505' or
osm_uid ='474570' or
osm_uid ='474572' or
osm_uid ='474574' or
osm_uid ='474600' or
osm_uid ='477692' or
osm_uid ='488491' or
osm_uid ='488646' or
osm_uid ='494109' or
osm_uid ='508796' or
osm_uid ='51045' or
osm_uid ='513716' or
osm_uid ='513730' or
osm_uid ='514275' or
osm_uid ='514279' or
osm_uid ='514285' or
osm_uid ='514287' or
osm_uid ='514329' or
osm_uid ='5211' or
osm_uid ='521191' or
osm_uid ='521872' or
osm_uid ='530154' or
osm_uid ='531109' or
osm_uid ='535126' or
osm_uid ='5359' or
osm_uid ='547959' or
osm_uid ='564222' or
osm_uid ='564773' or
osm_uid ='56597' or
osm_uid ='5735' or
osm_uid ='64805' or
osm_uid ='67244' or
osm_uid ='68842' or
osm_uid ='69102' or
osm_uid ='76114' or
osm_uid ='76471' or
osm_uid ='9112' or
osm_uid ='95383' or
osm_uid ='6494' or
osm_uid ='562199' or
osm_uid ='393385' or
osm_uid ='4902' or
osm_uid ='513735' or
osm_uid ='261009' or
osm_uid ='22726' or
osm_uid ='5891' or
osm_uid ='21640' or
osm_uid ='408968' or
osm_uid ='261053' or
osm_uid ='18675' or
osm_uid ='261050' or
osm_uid ='527748' or
osm_uid ='261848' or
osm_uid ='345885' or
osm_uid ='540100' or
osm_uid ='9839' or
osm_uid ='347165' or
osm_uid ='429920' or
osm_uid ='7079' or
osm_uid ='22301' or
osm_uid ='30587' or
osm_uid ='51324' or
osm_uid ='70260' or
osm_uid ='559500' or
osm_uid ='514293' or
osm_uid ='44221' or
osm_uid ='385790' or
osm_uid ='540114' or
osm_uid ='236134' or
osm_uid ='64578' or
osm_uid ='513724' or
osm_uid ='165869' or
osm_uid ='514291' or
osm_uid ='236381' or
osm_uid ='293774' or
osm_uid ='110263' or
osm_uid ='999' or
osm_uid ='67862' or
osm_uid ='261043' or
osm_uid ='392442' or
osm_uid ='92274' or
osm_uid ='314635' or
osm_uid ='229494' or
osm_uid ='438201'
);

create table n2012_final_line as (
select * from nairobi2012_line where
osm_uid ='152289' or
osm_uid ='16315' or
osm_uid ='338611' or
osm_uid ='109852' or
osm_uid ='114161' or
osm_uid ='116004' or
osm_uid ='121415' or
osm_uid ='123574' or
osm_uid ='12614' or
osm_uid ='129447' or
osm_uid ='1295' or
osm_uid ='131735' or
osm_uid ='151957' or
osm_uid ='170672' or
osm_uid ='18069' or
osm_uid ='191112' or
osm_uid ='192021' or
osm_uid ='19239' or
osm_uid ='193865' or
osm_uid ='19862' or
osm_uid ='20163' or
osm_uid ='202858' or
osm_uid ='207249' or
osm_uid ='215343' or
osm_uid ='216549' or
osm_uid ='22108' or
osm_uid ='227137' or
osm_uid ='230870' or
osm_uid ='232312' or
osm_uid ='243041' or
osm_uid ='252326' or
osm_uid ='25504' or
osm_uid ='261003' or
osm_uid ='261018' or
osm_uid ='261052' or
osm_uid ='265690' or
osm_uid ='28052' or
osm_uid ='283266' or
osm_uid ='286581' or
osm_uid ='297047' or
osm_uid ='297215' or
osm_uid ='301356' or
osm_uid ='310392' or
osm_uid ='31075' or
osm_uid ='324047' or
osm_uid ='33073' or
osm_uid ='336481' or
osm_uid ='344031' or
osm_uid ='346151' or
osm_uid ='352832' or
osm_uid ='355242' or
osm_uid ='355617' or
osm_uid ='3585' or
osm_uid ='383494' or
osm_uid ='383550' or
osm_uid ='384773' or
osm_uid ='398864' or
osm_uid ='400795' or
osm_uid ='413785' or
osm_uid ='415989' or
osm_uid ='42429' or
osm_uid ='425742' or
osm_uid ='42619' or
osm_uid ='429923' or
osm_uid ='429943' or
osm_uid ='429994' or
osm_uid ='433827' or
osm_uid ='435017' or
osm_uid ='43972' or
osm_uid ='440940' or
osm_uid ='44659' or
osm_uid ='451142' or
osm_uid ='474505' or
osm_uid ='474570' or
osm_uid ='474572' or
osm_uid ='474574' or
osm_uid ='474600' or
osm_uid ='477692' or
osm_uid ='488491' or
osm_uid ='488646' or
osm_uid ='494109' or
osm_uid ='508796' or
osm_uid ='51045' or
osm_uid ='513716' or
osm_uid ='513730' or
osm_uid ='514275' or
osm_uid ='514279' or
osm_uid ='514285' or
osm_uid ='514287' or
osm_uid ='514329' or
osm_uid ='5211' or
osm_uid ='521191' or
osm_uid ='521872' or
osm_uid ='530154' or
osm_uid ='531109' or
osm_uid ='535126' or
osm_uid ='5359' or
osm_uid ='547959' or
osm_uid ='564222' or
osm_uid ='564773' or
osm_uid ='56597' or
osm_uid ='5735' or
osm_uid ='64805' or
osm_uid ='67244' or
osm_uid ='68842' or
osm_uid ='69102' or
osm_uid ='76114' or
osm_uid ='76471' or
osm_uid ='9112' or
osm_uid ='95383' or
osm_uid ='6494' or
osm_uid ='562199' or
osm_uid ='393385' or
osm_uid ='4902' or
osm_uid ='513735' or
osm_uid ='261009' or
osm_uid ='22726' or
osm_uid ='5891' or
osm_uid ='21640' or
osm_uid ='408968' or
osm_uid ='261053' or
osm_uid ='18675' or
osm_uid ='261050' or
osm_uid ='527748' or
osm_uid ='261848' or
osm_uid ='345885' or
osm_uid ='540100' or
osm_uid ='9839' or
osm_uid ='347165' or
osm_uid ='429920' or
osm_uid ='7079' or
osm_uid ='22301' or
osm_uid ='30587' or
osm_uid ='51324' or
osm_uid ='70260' or
osm_uid ='559500' or
osm_uid ='514293' or
osm_uid ='44221' or
osm_uid ='385790' or
osm_uid ='540114' or
osm_uid ='236134' or
osm_uid ='64578' or
osm_uid ='513724' or
osm_uid ='165869' or
osm_uid ='514291' or
osm_uid ='236381' or
osm_uid ='293774' or
osm_uid ='110263' or
osm_uid ='999' or
osm_uid ='67862' or
osm_uid ='261043' or
osm_uid ='392442' or
osm_uid ='92274' or
osm_uid ='314635' or
osm_uid ='229494' or
osm_uid ='438201'
);

create table n2012_final_polygon as (
select * from nairobi2012_polygon where
osm_uid ='152289' or
osm_uid ='16315' or
osm_uid ='338611' or
osm_uid ='109852' or
osm_uid ='114161' or
osm_uid ='116004' or
osm_uid ='121415' or
osm_uid ='123574' or
osm_uid ='12614' or
osm_uid ='129447' or
osm_uid ='1295' or
osm_uid ='131735' or
osm_uid ='151957' or
osm_uid ='170672' or
osm_uid ='18069' or
osm_uid ='191112' or
osm_uid ='192021' or
osm_uid ='19239' or
osm_uid ='193865' or
osm_uid ='19862' or
osm_uid ='20163' or
osm_uid ='202858' or
osm_uid ='207249' or
osm_uid ='215343' or
osm_uid ='216549' or
osm_uid ='22108' or
osm_uid ='227137' or
osm_uid ='230870' or
osm_uid ='232312' or
osm_uid ='243041' or
osm_uid ='252326' or
osm_uid ='25504' or
osm_uid ='261003' or
osm_uid ='261018' or
osm_uid ='261052' or
osm_uid ='265690' or
osm_uid ='28052' or
osm_uid ='283266' or
osm_uid ='286581' or
osm_uid ='297047' or
osm_uid ='297215' or
osm_uid ='301356' or
osm_uid ='310392' or
osm_uid ='31075' or
osm_uid ='324047' or
osm_uid ='33073' or
osm_uid ='336481' or
osm_uid ='344031' or
osm_uid ='346151' or
osm_uid ='352832' or
osm_uid ='355242' or
osm_uid ='355617' or
osm_uid ='3585' or
osm_uid ='383494' or
osm_uid ='383550' or
osm_uid ='384773' or
osm_uid ='398864' or
osm_uid ='400795' or
osm_uid ='413785' or
osm_uid ='415989' or
osm_uid ='42429' or
osm_uid ='425742' or
osm_uid ='42619' or
osm_uid ='429923' or
osm_uid ='429943' or
osm_uid ='429994' or
osm_uid ='433827' or
osm_uid ='435017' or
osm_uid ='43972' or
osm_uid ='440940' or
osm_uid ='44659' or
osm_uid ='451142' or
osm_uid ='474505' or
osm_uid ='474570' or
osm_uid ='474572' or
osm_uid ='474574' or
osm_uid ='474600' or
osm_uid ='477692' or
osm_uid ='488491' or
osm_uid ='488646' or
osm_uid ='494109' or
osm_uid ='508796' or
osm_uid ='51045' or
osm_uid ='513716' or
osm_uid ='513730' or
osm_uid ='514275' or
osm_uid ='514279' or
osm_uid ='514285' or
osm_uid ='514287' or
osm_uid ='514329' or
osm_uid ='5211' or
osm_uid ='521191' or
osm_uid ='521872' or
osm_uid ='530154' or
osm_uid ='531109' or
osm_uid ='535126' or
osm_uid ='5359' or
osm_uid ='547959' or
osm_uid ='564222' or
osm_uid ='564773' or
osm_uid ='56597' or
osm_uid ='5735' or
osm_uid ='64805' or
osm_uid ='67244' or
osm_uid ='68842' or
osm_uid ='69102' or
osm_uid ='76114' or
osm_uid ='76471' or
osm_uid ='9112' or
osm_uid ='95383' or
osm_uid ='6494' or
osm_uid ='562199' or
osm_uid ='393385' or
osm_uid ='4902' or
osm_uid ='513735' or
osm_uid ='261009' or
osm_uid ='22726' or
osm_uid ='5891' or
osm_uid ='21640' or
osm_uid ='408968' or
osm_uid ='261053' or
osm_uid ='18675' or
osm_uid ='261050' or
osm_uid ='527748' or
osm_uid ='261848' or
osm_uid ='345885' or
osm_uid ='540100' or
osm_uid ='9839' or
osm_uid ='347165' or
osm_uid ='429920' or
osm_uid ='7079' or
osm_uid ='22301' or
osm_uid ='30587' or
osm_uid ='51324' or
osm_uid ='70260' or
osm_uid ='559500' or
osm_uid ='514293' or
osm_uid ='44221' or
osm_uid ='385790' or
osm_uid ='540114' or
osm_uid ='236134' or
osm_uid ='64578' or
osm_uid ='513724' or
osm_uid ='165869' or
osm_uid ='514291' or
osm_uid ='236381' or
osm_uid ='293774' or
osm_uid ='110263' or
osm_uid ='999' or
osm_uid ='67862' or
osm_uid ='261043' or
osm_uid ='392442' or
osm_uid ='92274' or
osm_uid ='314635' or
osm_uid ='229494' or
osm_uid ='438201'
);




--OpenStreetMap Statistics 
--The same statistics used as dependent variables in the non-spatial and spatial analysis of this dissertation

SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS school
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'school'
GROUP BY public.nairobi_consts.constituen;

SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS college
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'college'
GROUP BY public.nairobi_consts.constituen;

SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS pub
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'pub'
GROUP BY public.nairobi_consts.constituen;

SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS bar
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'bar'
GROUP BY public.nairobi_consts.constituen;

SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS pharmacy
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'pharmacy'
GROUP BY public.nairobi_consts.constituen;

SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS hospital
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'hospital'
GROUP BY public.nairobi_consts.constituen;

SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS dentist
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'dentist'
GROUP BY public.nairobi_consts.constituen;

SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS clinic
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'clinic'
GROUP BY public.nairobi_consts.constituen;

SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS police
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'police'
GROUP BY public.nairobi_consts.constituen;

SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS bank
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'bank'
GROUP BY public.nairobi_consts.constituen;

SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS atm
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'atm'
GROUP BY public.nairobi_consts.constituen;

SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS restaurant
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'restaurant'
GROUP BY public.nairobi_consts.constituen;

SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS fast_food
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'fast_food'
GROUP BY public.nairobi_consts.constituen;

SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS toilets
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'toilets'
GROUP BY public.nairobi_consts.constituen;

SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS drinking_water
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'drinking_water'
GROUP BY public.nairobi_consts.constituen;

SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS place_of_worship
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'place_of_worship'
GROUP BY public.nairobi_consts.constituen;

SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS bus_stop
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.highway = 'bus_stop'
GROUP BY public.nairobi_consts.constituen;

SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS street_lamp
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.highway = 'street_lamp'
GROUP BY public.nairobi_consts.constituen;

SELECT public.nairobi_consts.constituen, count(public.n2012_final_polygon.way) AS hotel
FROM public.nairobi_consts LEFT JOIN public.n2012_final_polygon 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_polygon.way) 
WHERE public.n2012_final_polygon.tourism = 'hotel'
GROUP BY public.nairobi_consts.constituen;

SELECT public.nairobi_consts.constituen, count(public.n2012_final_polygon.way) AS industrial
FROM public.nairobi_consts LEFT JOIN public.n2012_final_polygon 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_polygon.way) 
WHERE public.n2012_final_polygon.building = 'industrial'
GROUP BY public.nairobi_consts.constituen;

SELECT public.nairobi_consts.constituen, count(public.n2012_final_polygon.way) AS apartment
FROM public.nairobi_consts LEFT JOIN public.n2012_final_polygon 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_polygon.way) 
WHERE public.n2012_final_polygon.building = 'apartments'
GROUP BY public.nairobi_consts.constituen;

SELECT public.nairobi_consts.constituen, count(public.n2012_final_polygon.way) AS house
FROM public.nairobi_consts LEFT JOIN public.n2012_final_polygon 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_polygon.way) 
WHERE public.n2012_final_polygon.building = 'house'
GROUP BY public.nairobi_consts.constituen;

SELECT public.nairobi_consts.constituen, count(public.n2012_final_polygon.way) AS church
FROM public.nairobi_consts LEFT JOIN public.n2012_final_polygon 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_polygon.way) 
WHERE public.n2012_final_polygon.building = 'church'
GROUP BY public.nairobi_consts.constituen;

SELECT public.nairobi_consts.constituen, count(public.n2012_final_polygon.way) AS mosque
FROM public.nairobi_consts LEFT JOIN public.n2012_final_polygon 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_polygon.way) 
WHERE public.n2012_final_polygon.building = 'mosque'
GROUP BY public.nairobi_consts.constituen;

SELECT public.nairobi_consts.constituen, count(public.n2012_final_line.way) AS footway
FROM public.nairobi_consts LEFT JOIN public.n2012_final_line
ON st_contains(public.nairobi_consts.geom, public.n2012_final_line.way) 
WHERE public.n2012_final_line.highway = 'footway'
GROUP BY public.nairobi_consts.constituen;

SELECT public.nairobi_consts.constituen, count(public.n2012_final_line.way) AS primary_road
FROM public.nairobi_consts LEFT JOIN public.n2012_final_line
ON st_contains(public.nairobi_consts.geom, public.n2012_final_line.way) 
WHERE public.n2012_final_line.highway = 'primary'
GROUP BY public.nairobi_consts.constituen;

SELECT public.nairobi_consts.constituen, count(public.n2012_final_line.way) AS residential
FROM public.nairobi_consts LEFT JOIN public.n2012_final_line
ON st_contains(public.nairobi_consts.geom, public.n2012_final_line.way) 
WHERE public.n2012_final_line.highway = 'residential'
GROUP BY public.nairobi_consts.constituen;

SELECT public.nairobi_consts.constituen, count(public.n2012_final_line.way) AS unclassified
FROM public.nairobi_consts LEFT JOIN public.n2012_final_line
ON st_contains(public.nairobi_consts.geom, public.n2012_final_line.way) 
WHERE public.n2012_final_line.highway = 'unclassified'
GROUP BY public.nairobi_consts.constituen;


--Additional statistics

--Total poi, line and polygon counts
--Total edit count was calculated by summing the totals for poi, line and polygon per constituency 
SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS poi_total
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
GROUP BY public.nairobi_consts.constituen;

SELECT public.nairobi_consts.constituen, count(public.n2012_final_line.way) AS line_total
FROM public.nairobi_consts LEFT JOIN public.n2012_final_line
ON st_contains(public.nairobi_consts.geom, public.n2012_final_line.way) 
GROUP BY public.nairobi_consts.constituen;

SELECT public.nairobi_consts.constituen, count(public.n2012_final_polygon.way) AS polygon_total
FROM public.nairobi_consts LEFT JOIN public.n2012_final_polygon 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_polygon.way) 
GROUP BY public.nairobi_consts.constituen;

--Calculate the area per constituency (km2)
--Feature density per km2 was manually calculated for each constituency using: total edits/area(km2) 
select constituen, st_area(geom)/1000000 as Area from nairobi_consts;

--Calculate the number of 'new' (version 1) edits
--version 1
select tbl0.constituen, tbl1.poi_total, tbl2.line_total, tbl3.poly_total,
sum(coalesce(tbl1.poi_total,0)) + sum(coalesce(tbl2.line_total,0)) + sum(coalesce(tbl3.poly_total,0))
as overall_v1_count
from (
(select constituen from nairobi_consts)tbl0
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS poi_total
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.osm_version = '1'
GROUP BY public.nairobi_consts.constituen
)tbl1
on tbl0.constituen = tbl1.constituen
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2012_final_line.way) AS line_total
FROM public.nairobi_consts LEFT JOIN public.n2012_final_line
ON st_contains(public.nairobi_consts.geom, public.n2012_final_line.way) 
WHERE public.n2012_final_line.osm_version = '1'
GROUP BY public.nairobi_consts.constituen
)tbl2
on tbl0.constituen = tbl2.constituen
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2012_final_polygon.way) AS poly_total
FROM public.nairobi_consts LEFT JOIN public.n2012_final_polygon
ON st_contains(public.nairobi_consts.geom, public.n2012_final_polygon.way) 
WHERE public.n2012_final_polygon.osm_version = '1'
GROUP BY public.nairobi_consts.constituen
)tbl3
on tbl0.constituen = tbl3.constituen)
group by tbl0.constituen, tbl1.poi_total, tbl2.line_total, tbl3.poly_total;


--Number of distinct users per constituency 

--Create a table to store the results of the intermediate queries
create table n_uid_2012 (
osm_uid varchar(80),
constituen varchar(80));

--Insert the osm_uid's per edit and the constituency in which that edit is contained into the previously created table
--Repeat for poi, line and polygon 
INSERT INTO n_uid_2012(osm_uid, constituen)
SELECT public.n2012_final_poi.osm_uid, nairobi_consts.constituen
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way);  

INSERT INTO n_uid_2012(osm_uid, constituen)
SELECT public.n2012_final_line.osm_uid, nairobi_consts.constituen
FROM public.nairobi_consts LEFT JOIN public.n2012_final_line
ON st_contains(public.nairobi_consts.geom, public.n2012_final_line.way);  

INSERT INTO n_uid_2012(osm_uid, constituen)
SELECT public.n2012_final_polygon.osm_uid, nairobi_consts.constituen
FROM public.nairobi_consts LEFT JOIN public.n2012_final_polygon
ON st_contains(public.nairobi_consts.geom, public.n2012_final_polygon.way);  

--obtain distinct osm_uid's per constituency
select count(distinct osm_uid), constituen from n_uid_2012
group by constituen;

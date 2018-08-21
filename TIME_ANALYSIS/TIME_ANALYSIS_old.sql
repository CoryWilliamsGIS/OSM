--FILTER KENYA HISTORICAL IMPORTS AND LIMIT TO NAIROBI

--TO DO:
--SPLIT EVERY TABLE INTO NAIROBI AND KENYA 
--REMOVE BULK IMPORTS --> NOT YET DONE
--INFER LOCALS




--repeat for all the history tables
SELECT *
FROM kenya2008_point, nairobi_consts
WHERE ST_within(kenya2008_point.way, nairobi_consts.geom)


--create a table with edits within and total edits per user
create table percenttrial2 as (
select * from 
(
	SELECT osm_uid as osm_uid, count(*) as "edits_within"
FROM kenya2008_point, nairobi_consts
WHERE ST_within(kenya2008_point.way, nairobi_consts.geom)
	group by osm_uid
) tbl1
join
(	SELECT osm_uid as 'osm_uid2', count(*) as "total_edits"
FROM kenya2008_point, nairobi_consts
 group by osm_uid
) tbl2
on tbl1.osm_uid_within = tbl2.osm_uid
	);
	
alter table percenttrial
drop column osm_uid

--calculate percentage and create a table output
create table percent3 as (
select osm_uid_within, (edits_within::float / total_edits::float) *100 as percent2 from percenttrial2 
group by osm_uid_within, edits_within, total_edits
	)

--filter the results to 70% within the case study region
select * from percent3 where percent2 >=70

--manually write query to filter by osm_uid



create table percenttrial3 as (
select * from 
(
	SELECT osm_uid as osm_uid, count(*) as "edits_within"
FROM kenya2008_point, nairobi_consts
WHERE ST_within(kenya2008_point.way, nairobi_consts.geom)
	group by osm_uid
) tbl1
join
(	SELECT osm_uid as 'osm_uid2', count(*) as "total_edits"
FROM kenya2008_point, nairobi_consts
 group by osm_uid
) tbl2
on tbl1.osm_uid_within = tbl2.osm_uid
	);



select * from 
(
	SELECT osm_uid as poi_osm_uid, count(*) as poi_edits_within
FROM nairobi2008_poi, nairobi_consts
WHERE ST_within(nairobi2008_poi.way, nairobi_consts.geom)
	group by osm_uid
) tbl1
join 
(	SELECT osm_uid as line_osm_uid, count(*) as line_edits_within
FROM nairobi2008_line, nairobi_consts
 group by osm_uid
) tbl2 on tbl1.poi_edits_within = tbl2.line_edits_within
join
(	SELECT osm_uid as polygon_osm_uid, count(*) as polygon_edits_within
FROM nairobi2008_polygon, nairobi_consts
 group by osm_uid
) tbl3
on tbl1.poi_edits_within = tbl3.polygon_edits_within

	


	
	
	----
select * from 
(
	SELECT osm_uid as osm_uid, count(*) as "edits_within"
FROM kenya2008_point, nairobi_consts
WHERE ST_within(kenya2008_point.way, nairobi_consts.geom)
	group by osm_uid
) tbl1
join
(	SELECT osm_uid as osm_uid2, count(*) as "total_edits"
FROM kenya2008_point, nairobi_consts
 group by osm_uid
) tbl2
on tbl1.osm_uid = tbl2.osm_uid2





	----

select * from 
(
	SELECT osm_uid as osm_uid, count(*) as "edits_within"
FROM kenya2008_point, nairobi_consts
WHERE ST_within(kenya2008_point.way, nairobi_consts.geom)
	group by osm_uid
) tbl1
join
(	SELECT osm_uid as osm_uid2, count(*) as "total_edits"
FROM kenya2008_line, nairobi_consts
 group by osm_uid
) tbl2
on tbl1.osm_uid = tbl2.osm_uid2
join
(	SELECT osm_uid as osm_uid3, count(*) as "total_edits"
FROM kenya2008_polygon, nairobi_consts
 group by osm_uid
) tbl3
on tbl1.osm_uid = tbl3.osm_uid3






---working but needs editing
select * from 
(
	SELECT osm_uid as osm_uid, count(*) as "edits_within"
FROM kenya2008_point, nairobi_consts
WHERE ST_within(kenya2008_point.way, nairobi_consts.geom)
	group by osm_uid
) tbl1
join
(	SELECT osm_uid as osm_uid2, count(*) as "total_edits"
FROM kenya2008_line, nairobi_consts
 group by osm_uid
) tbl2
on tbl1.osm_uid = tbl2.osm_uid2
join
(	SELECT osm_uid as osm_uid3, count(*) as "total_edits"
FROM kenya2008_polygon, nairobi_consts
 group by osm_uid
) tbl3
on tbl1.osm_uid = tbl3.osm_uid3





--############ THIS WORKS GETTING TOTAL OF EACH POINT, LINE POLYGON IN NAIROBI 
select osm_uid, edits_within, tbl2.total_edits, tbl3.total_edits2 from 
(
	SELECT osm_uid as osm_uid, count(*) as edits_within
FROM kenya2008_point, nairobi_consts
WHERE ST_within(kenya2008_point.way, nairobi_consts.geom)
	group by osm_uid
) tbl1
join
(	SELECT osm_uid as osm_uid2, count(*) as total_edits
FROM kenya2008_line, nairobi_consts
WHERE ST_within(kenya2008_line.way, nairobi_consts.geom)
 group by osm_uid
) tbl2
on tbl1.osm_uid = tbl2.osm_uid2
join
(	SELECT osm_uid as osm_uid3, count(*) as total_edits2
FROM kenya2008_polygon, nairobi_consts
WHERE ST_within(kenya2008_point.way, nairobi_consts.geom)
 group by osm_uid
) tbl3
on tbl1.osm_uid = tbl3.osm_uid3




---works retrieving the osm_uid and sum of point, line, polygon edits within
select osm_uid, sum(edits_within) + sum(tbl2.total_edits) + sum(tbl3.total_edits2) as totaledits3 from 
(
	SELECT osm_uid as osm_uid, count(*) as edits_within
FROM kenya2008_point, nairobi_consts
WHERE ST_within(kenya2008_point.way, nairobi_consts.geom)
	group by osm_uid
) tbl1
join
(	SELECT osm_uid as osm_uid2, count(*) as total_edits
FROM kenya2008_line, nairobi_consts
 group by osm_uid
) tbl2
on tbl1.osm_uid = tbl2.osm_uid2
join
(	SELECT osm_uid as osm_uid3, count(*) as total_edits2
FROM kenya2008_polygon, nairobi_consts
 group by osm_uid
) tbl3
on tbl1.osm_uid = tbl3.osm_uid3
group by osm_uid
order by totaledits3 desc


--attempt to join to get the column total -- working
select osm_uid, sum(edits_within) + sum(tbl2.total_edits) + sum(tbl3.total_edits2) as totaledits3, sum(tbl4.real_total_edits) + sum(tbl5.real_total_edits2) + sum(tbl6.real_total_edits3) as totaleditstotoal from 
(
	SELECT osm_uid as osm_uid, count(*) as edits_within
FROM kenya2008_point, nairobi_consts
WHERE ST_within(kenya2008_point.way, nairobi_consts.geom)
	group by osm_uid
) tbl1
join
(	SELECT osm_uid as osm_uid2, count(*) as total_edits
FROM kenya2008_line, nairobi_consts
 group by osm_uid
) tbl2
on tbl1.osm_uid = tbl2.osm_uid2
join
(	SELECT osm_uid as osm_uid3, count(*) as total_edits2
FROM kenya2008_polygon, nairobi_consts
 group by osm_uid
) tbl3
on tbl1.osm_uid = tbl3.osm_uid3
join
(	SELECT osm_uid as osm_uid4, count(*) as real_total_edits
FROM kenya2008_point, nairobi_consts
 group by osm_uid
) tbl4
on tbl1.osm_uid = tbl4.osm_uid4
join
(	SELECT osm_uid as osm_uid5, count(*) as real_total_edits2
FROM kenya2008_line, nairobi_consts
 group by osm_uid
) tbl4
on tbl1.osm_uid = tbl5.osm_uid5
join
(	SELECT osm_uid as osm_uid6, count(*) as real_total_edits3
FROM kenya2008_polygon, nairobi_consts
 group by osm_uid
) tbl4
on tbl1.osm_uid = tbl6.osm_uid6
group by osm_uid

--CURRENTLY DELETING RECORDS

--attempt to add percentage
select tbl0.osm_uid, sum(edits_within) + sum(tbl2.total_edits) + sum(tbl3.total_edits2) as totaledits3, sum(tbl4.real_total_edits) + sum(tbl5.real_total_edits2) + sum(tbl6.real_total_edits3) as totaleditstotoal from 
(
select * from (
select osm_uid from public.kenya2008_point
    union 
	select osm_uid from public.kenya2008_line
	union
	select osm_uid from public.kenya2008_polygon)
	as kosm_uid
) tbl0
join
(
	SELECT osm_uid as osm_uid, count(*) as edits_within
FROM kenya2008_point, nairobi_consts
WHERE ST_within(kenya2008_point.way, nairobi_consts.geom)
	group by osm_uid
) tbl1
on tbl0.kosm_uid = tbl1.osm_uid
join
(	SELECT osm_uid as osm_uid2, count(*) as total_edits
FROM kenya2008_line, nairobi_consts
 group by osm_uid
) tbl2
on tbl0.kosm_uid = tbl2.osm_uid2
join
(	SELECT osm_uid as osm_uid3, count(*) as total_edits2
FROM kenya2008_polygon, nairobi_consts
 group by osm_uid
) tbl3
on tbl0.kosm_uid = tbl3.osm_uid3
join
(	SELECT osm_uid as osm_uid4, count(*) as real_total_edits
FROM kenya2008_point, nairobi_consts
 group by osm_uid
) tbl4
on tbl0.kosm_uid = tbl4.osm_uid4
join
(	SELECT osm_uid as osm_uid5, count(*) as real_total_edits2
FROM kenya2008_line, nairobi_consts
 group by osm_uid
) tbl5
on tbl0.kosm_uid = tbl5.osm_uid5
join
(	SELECT osm_uid as osm_uid6, count(*) as real_total_edits3
FROM kenya2008_polygon, nairobi_consts
 group by osm_uid
) tbl6
on tbl0.kosm_uid = tbl6.osm_uid6
group by osm_uid



--trial continues
select tbl0.osm_uid, 
sum(edits_within) + sum(tbl2.total_edits) + sum(tbl3.total_edits2) as totaledits3, 
sum(tbl4.real_total_edits) + sum(tbl5.real_total_edits2) + sum(tbl6.real_total_edits3) as totaleditstotoal from 
(
select * from (
select osm_uid from public.kenya2008_point
    union 
	select osm_uid from public.kenya2008_line
	union
	select osm_uid from public.kenya2008_polygon)
	as kosm_uid
) tbl0
full outer join
(
	SELECT osm_uid as osm_uid, count(*) as edits_within
FROM kenya2008_point, nairobi_consts
WHERE ST_within(kenya2008_point.way, nairobi_consts.geom)
	group by osm_uid
) tbl1
on tbl0.osm_uid = tbl1.osm_uid
full outer join
(	SELECT osm_uid as osm_uid2, count(*) as total_edits
FROM kenya2008_line, nairobi_consts
WHERE ST_within(kenya2008_line.way, nairobi_consts.geom)
 group by osm_uid
) tbl2
on tbl0.osm_uid = tbl2.osm_uid2
full outer join
(	SELECT osm_uid as osm_uid3, count(*) as total_edits2
FROM kenya2008_polygon, nairobi_consts
WHERE ST_within(kenya2008_polygon.way, nairobi_consts.geom)
 group by osm_uid
) tbl3
on tbl0.osm_uid = tbl3.osm_uid3
full outer join
(	SELECT osm_uid as osm_uid4, count(*) as real_total_edits
FROM kenya2008_point, nairobi_consts
 group by osm_uid
) tbl4
on tbl0.osm_uid = tbl4.osm_uid4
full outer join
(	SELECT osm_uid as osm_uid5, count(*) as real_total_edits2
FROM kenya2008_line, nairobi_consts
 group by osm_uid
) tbl5
on tbl0.osm_uid = tbl5.osm_uid5
full outer join
(	SELECT osm_uid as osm_uid6, count(*) as real_total_edits3
FROM kenya2008_polygon, nairobi_consts
 group by osm_uid
) tbl6
on tbl0.osm_uid = tbl6.osm_uid6
group by tbl0.osm_uid





--https://stackoverflow.com/questions/31737341/join-two-tables-to-get-matching-records-and-unmatched-records-from-table-1



--select distinct from country as a whole


select osm_uid from public.kenya2008_point
    union 
	select osm_uid from public.kenya2008_line
	union
	select osm_uid from public.kenya_polygon

	
	
	
select * from 
(	SELECT osm_uid as osm_uid2, count(*) as total_edits
FROM kenya2008_point, nairobi_consts
 group by osm_uid
) tbl2
join
(
	SELECT osm_uid as osm_uid, count(*) as edits_within
FROM kenya2008_point, nairobi_consts
WHERE ST_within(kenya2008_point.way, nairobi_consts.geom)
	group by osm_uid
) tbl2.osm_uid2 = tbl.osm_uid

















--select tbl0.osm_uid, sum(tbl1.point_edits_within) + sum(tbl2.line_edits_within) + sum(tbl3.polygon_edits_within) as totaleditswithin, sum(tbl4.real_total_edits) + sum(tbl5.real_total_edits2) + sum(tbl6.real_total_edits3) as totaleditstotoal from 
select * from
(
select * from (
select osm_uid from public.kenya2008_point
    union 
	select osm_uid from public.kenya2008_line
	union
	select osm_uid from public.kenya2008_polygon)
	as kosm_uid
) tbl0
full outer join
(
	SELECT osm_uid as point_osm_uid, count(*) as point_edits_within
FROM kenya2008_point, nairobi_consts
WHERE ST_within(kenya2008_point.way, nairobi_consts.geom)
	group by osm_uid
) tbl1
on tbl0.osm_uid = tbl1.point_osm_uid
full outer join
(	SELECT osm_uid as line_osm_uid, count(*) as line_edits_within
FROM kenya2008_line, nairobi_consts
 WHERE ST_within(kenya2008_line.way, nairobi_consts.geom)
 group by osm_uid
) tbl2
on tbl0.osm_uid = tbl2.line_osm_uid
full outer join
(	SELECT osm_uid as polygon_osm_uid, count(*) as polygon_edits_within
FROM kenya2008_polygon, nairobi_consts
 WHERE ST_within(kenya2008_polygon.way, nairobi_consts.geom)
 group by osm_uid
) tbl3
on tbl0.osm_uid = tbl3.polygon_osm_uid
full outer join
(	SELECT osm_uid as k_point_osm_uid, count(*) as point_total_edits
FROM kenya2008_point, nairobi_consts
 group by osm_uid
) tbl4
on tbl0.osm_uid = tbl4.k_point_osm_uid
full outer join
(	SELECT osm_uid as k_line_osm_uid, count(*) as line_total_edits
FROM kenya2008_line, nairobi_consts
 group by osm_uid
) tbl5
on tbl0.osm_uid = tbl5.k_line_osm_uid
full outer join
(	SELECT osm_uid as k_polygon_osm_uid, count(*) as polygon_total_edits
FROM kenya2008_polygon, nairobi_consts
 group by osm_uid
) tbl6
on tbl0.osm_uid = tbl6.k_polygon_osm_uid
--group by tbl0.osm_uid




--select tbl0.osm_uid, sum(tbl1.point_edits_within) + sum(tbl2.line_edits_within) + sum(tbl3.polygon_edits_within) as totaleditswithin, sum(tbl4.real_total_edits) + sum(tbl5.real_total_edits2) + sum(tbl6.real_total_edits3) as totaleditstotoal from 

select * from (
select osm_uid from public.kenya2008_point
    union 
	select osm_uid from public.kenya2008_line
	union
	select osm_uid from public.kenya2008_polygon)
	as kosm_uid
) tbl0
full outer join
(

	SELECT osm_uid as point_osm_uid, count(*) as point_edits_within
FROM kenya2008_point, nairobi_consts
WHERE ST_within(kenya2008_point.way, nairobi_consts.geom)
	group by osm_uid
) tbl1
on tbl0.osm_uid = tbl1.point_osm_uid
full outer join
(	SELECT osm_uid as line_osm_uid, count(*) as line_edits_within
FROM kenya2008_line, nairobi_consts
 WHERE ST_within(kenya2008_line.way, nairobi_consts.geom)
 group by osm_uid
) tbl2
on tbl0.osm_uid = tbl2.line_osm_uid
full outer join
(	SELECT osm_uid as polygon_osm_uid, count(*) as polygon_edits_within
FROM kenya2008_polygon, nairobi_consts
 WHERE ST_within(kenya2008_polygon.way, nairobi_consts.geom)
 group by osm_uid
) tbl3
on tbl0.osm_uid = tbl3.polygon_osm_uid
full outer join
(	SELECT osm_uid as k_point_osm_uid, count(*) as point_total_edits
FROM kenya2008_point, nairobi_consts
 group by osm_uid
) tbl4
on tbl0.osm_uid = tbl4.k_point_osm_uid
full outer join
(	SELECT osm_uid as k_line_osm_uid, count(*) as line_total_edits
FROM kenya2008_line, nairobi_consts
 group by osm_uid
) tbl5
on tbl0.osm_uid = tbl5.k_line_osm_uid
full outer join
(	SELECT osm_uid as k_polygon_osm_uid, count(*) as polygon_total_edits
FROM kenya2008_polygon, nairobi_consts
 group by osm_uid
) tbl6
on tbl0.osm_uid = tbl6.k_polygon_osm_uid
--group by tbl0.osm_uid



--last resort
select distinct(osm_uid), sum(edits) from (
SELECT osm_uid, count(*) as edits
FROM kenya2008_point, nairobi_consts
WHERE ST_within(kenya2008_point.way, nairobi_consts.geom)
group by osm_uid
union
SELECT osm_uid, count(*)as edits2
FROM kenya2008_line, nairobi_consts
 WHERE ST_within(kenya2008_line.way, nairobi_consts.geom)
 group by osm_uid
	union
	SELECT osm_uid, count(*) as edits3
FROM kenya2008_polygon, nairobi_consts
	 WHERE ST_within(kenya2008_polygon.way, nairobi_consts.geom)
 group by osm_uid
	) as xc 
	group by osm_uid, edits

	
	
	
		SELECT osm_uid as point_osm_uid, count(*) as point_edits_within
FROM kenya2008_point, nairobi_consts
WHERE ST_within(kenya2008_point.way, nairobi_consts.geom)
	group by osm_uid
) tbl1
on tbl0.osm_uid = tbl1.point_osm_uid
full outer join
(	SELECT osm_uid as line_osm_uid, count(*) as line_edits_within
FROM kenya2008_line, nairobi_consts
 WHERE ST_within(kenya2008_line.way, nairobi_consts.geom)
 group by osm_uid
) tbl2
on tbl0.osm_uid = tbl2.line_osm_uid
full outer join
(	SELECT osm_uid as polygon_osm_uid, count(*) as polygon_edits_within
FROM kenya2008_polygon, nairobi_consts
 WHERE ST_within(kenya2008_polygon.way, nairobi_consts.geom)
 group by osm_uid
) tbl3
on tbl0.osm_uid = tbl3.polygon_osm_uid






	select * from (
	select * from (
select osm_uid from public.kenya2008_point
    union 
	select osm_uid from public.kenya2008_line
	union
	select osm_uid from public.kenya2008_polygon)
	as kosm_uid
) tbl0
full outer join
(
	SELECT osm_uid as point_osm_uid, count(*) as point_edits_within
FROM kenya2008_point, nairobi_consts
WHERE ST_within(kenya2008_point.way, nairobi_consts.geom)
	group by osm_uid
) tbl1
on tbl0.osm_uid = tbl1.point_osm_uid
full outer join
(	SELECT osm_uid as osm_uid2, count(*) as "total_edits"
FROM kenya2008_point, nairobi_consts
 group by osm_uid
) tbl2
on tbl0.osm_uid = tbl2.osm_uid2






--this is returning what i want small scale
	select osm_uid, point_edits_within from (
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
	SELECT osm_uid as point_osm_uid, count(*) as point_edits_within
FROM kenya2008_point, nairobi_consts
WHERE ST_within(kenya2008_point.way, nairobi_consts.geom)
	group by osm_uid
) tbl1
on tbl0.osm_uid = tbl1.point_osm_uid
inner join
(	SELECT osm_uid as osm_uid2, count(*) as "total_edits"
FROM kenya2008_point, nairobi_consts
 group by osm_uid
) tbl2
on tbl0.osm_uid = tbl2.osm_uid2
	
	
	
	
	
---this code does what i want small scale and calculates percentage
select tbl0.osm_uid, tbl1.point_edits_within, tbl2.total_edits, 
	((select tbl1.point_edits_within::float) / (select tbl2.total_Edits::float) *100.0) as percentage
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
	SELECT osm_uid as point_osm_uid, count(*) as point_edits_within
FROM kenya2008_point, nairobi_consts
WHERE ST_within(kenya2008_point.way, nairobi_consts.geom)
	group by osm_uid
) tbl1
on tbl0.osm_uid = tbl1.point_osm_uid
inner join
(	SELECT osm_uid as osm_uid2, count(*) as "total_edits"
FROM kenya2008_point, nairobi_consts
 group by osm_uid
) tbl2
on tbl0.osm_uid = tbl2.osm_uid2
group by tbl0.osm_uid, tbl1.point_edits_within, tbl2.total_edits




--attempt to add line in 
select *  
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
FROM kenya2008_point, nairobi_consts
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
inner join
(	SELECT osm_uid as osm_uid2, count(*) as line_total
FROM kenya2008_line, nairobi_consts
 group by osm_uid
) tbl4
on tbl0.osm_uid = tbl4.osm_uid2
group by tbl0.osm_uid, tbl1.point_osm_uid, tbl1.points_within, tbl2.osm_uid2, tbl2.points_total,
tbl3.line_osm_uid, tbl3.line_within, tbl4.osm_uid2, tbl4.line_total




--this works with line and calc total edits
select osm_uid, sum(coalesce(points_within, 0)) + sum(coalesce(line_within, 0)) as totwithin
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
FROM kenya2008_point, nairobi_consts
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
FROM kenya2008_line, nairobi_consts
 group by osm_uid
) tbl4
on tbl0.osm_uid = tbl4.osm_uid2
group by tbl0.osm_uid, tbl1.point_osm_uid, tbl1.points_within, tbl2.osm_uid2, tbl2.points_total,
tbl3.line_osm_uid, tbl3.line_within, tbl4.osm_uid2, tbl4.line_total

























--select osm_uid, sum(coalesce(points_within, 0)) + sum(coalesce(line_within, 0)) as totwithin
select *	
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
FROM kenya2008_point, nairobi_consts
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
inner join
(	SELECT osm_uid as osm_uid2, count(*) as line_total
FROM kenya2008_line, nairobi_consts
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
FROM kenya2008_polygon, nairobi_consts
 group by osm_uid
) tbl6
on tbl0.osm_uid = tbl6.osm_uid2


group by tbl0.osm_uid, tbl1.point_osm_uid, tbl1.points_within, tbl2.osm_uid2, tbl2.points_total,
tbl3.line_osm_uid, tbl3.line_within, tbl4.osm_uid2, tbl4.line_total



----------------- ALMOST OMG
select *	
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
FROM kenya2008_point, nairobi_consts
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
FROM kenya2008_line, nairobi_consts
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
FROM kenya2008_polygon, nairobi_consts
 group by osm_uid
) tbl6
on tbl0.osm_uid = tbl6.osm_uid2



--select *
select osm_uid, sum(coalesce(points_within, 0)) + sum(coalesce(line_within, 0)) + sum(coalesce(polygon_within, 0))v as totwithin	
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
FROM kenya2008_point, nairobi_consts
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
FROM kenya2008_line, nairobi_consts
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
FROM kenya2008_polygon, nairobi_consts
 group by osm_uid
) tbl6
on tbl0.osm_uid = tbl6.osm_uid2
group by tbl0.osm_uid, tbl1.point_osm_uid, tbl1.points_within, tbl2.osm_uid2, tbl2.points_total,
tbl3.line_osm_uid, tbl3.line_within, tbl4.osm_uid2, tbl4.line_total, tbl5.polygon_osm_uid, tbl5.polygon_within,  tbl6.osm_uid2, tbl6.polygon_total

















--working
select osm_uid, sum(coalesce(points_within, 0)) + sum(coalesce(line_within, 0)) + sum(coalesce(polygon_within, 0)) as totwithin	
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
FROM kenya2008_point, nairobi_consts
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
FROM kenya2008_line, nairobi_consts
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
FROM kenya2008_polygon, nairobi_consts
 group by osm_uid
) tbl6
on tbl0.osm_uid = tbl6.osm_uid2
group by tbl0.osm_uid, tbl1.point_osm_uid, tbl1.points_within, tbl2.osm_uid2, tbl2.points_total,
tbl3.line_osm_uid, tbl3.line_within, tbl4.osm_uid2, tbl4.line_total, tbl5.polygon_osm_uid, tbl5.polygon_within,  tbl6.osm_uid2, tbl6.polygon_total


((select tbl1.point_edits_within::float) / (select tbl2.total_Edits::float) *100.0) as percentage

--now to try percentage
select osm_uid, ((select sum(coalesce(points_within, 0)) + sum(coalesce(line_within, 0)) + sum(coalesce(polygon_within, 0))) /
((select sum(coalesce(points_total, 0)) + sum(coalesce(line_total, 0)) + sum(coalesce(polygon_total, 0)))) *100) as percent,
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
FROM kenya2008_point, nairobi_consts
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
FROM kenya2008_line, nairobi_consts
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
FROM kenya2008_polygon, nairobi_consts
 group by osm_uid
) tbl6
on tbl0.osm_uid = tbl6.osm_uid2
group by tbl0.osm_uid, tbl1.point_osm_uid, tbl1.points_within, tbl2.osm_uid2, tbl2.points_total,
tbl3.line_osm_uid, tbl3.line_within, tbl4.osm_uid2, tbl4.line_total, tbl5.polygon_osm_uid, tbl5.polygon_within,  tbl6.osm_uid2, tbl6.polygon_total








--i think i done it 
select osm_uid, ((select sum(coalesce(points_within, 0)) + sum(coalesce(line_within, 0)) + sum(coalesce(polygon_within, 0))) /
((select sum(coalesce(points_total, 1)) + sum(coalesce(line_total, 1)) + sum(coalesce(polygon_total, 1)))) *100) as percent
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
FROM kenya2008_point, nairobi_consts
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
FROM kenya2008_line, nairobi_consts
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
FROM kenya2008_polygon, nairobi_consts
 group by osm_uid
) tbl6
on tbl0.osm_uid = tbl6.osm_uid2
group by tbl0.osm_uid, tbl1.point_osm_uid, tbl1.points_within, tbl2.osm_uid2, tbl2.points_total,
tbl3.line_osm_uid, tbl3.line_within, tbl4.osm_uid2, tbl4.line_total, tbl5.polygon_osm_uid, tbl5.polygon_within,  tbl6.osm_uid2, tbl6.polygon_total




--try agen
select osm_uid, ((select sum(coalesce(points_within, 0)) + sum(coalesce(line_within, 0)) + sum(coalesce(polygon_within, 0))) /
((select sum(coalesce(points_total, 1)) + sum(coalesce(line_total, 1)) + sum(coalesce(polygon_total, 1)))) *100) as percent
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






--working just add group by and %
SELECT * 
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


--adding
select osm_uid, ((select sum(coalesce(points_within, 0)) + sum(coalesce(line_within, 0)) + sum(coalesce(polygon_within, 0))) /
((select sum(coalesce(points_total, 1)) + sum(coalesce(line_total, 1)) + sum(coalesce(polygon_total, 1)))) *100) as percent

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


sum(coalesce(points_within, 0)) + sum(coalesce(line_within, 0)) + sum(coalesce(polygon_within, 0)) as total_within,
sum(coalesce(points_total, 0)) + sum(coalesce(line_total, 0)) + sum(coalesce(polygon_total, 0)) as total_total,

--adding
select osm_uid, sum(coalesce(points_within, 0)) + sum(coalesce(line_within, 0)) + sum(coalesce(polygon_within, 0)) as total_within,
sum(coalesce(points_total, 0)) + sum(coalesce(line_total, 0)) + sum(coalesce(polygon_total, 0)) as total_total,
((select sum(coalesce(points_within, 0)) + sum(coalesce(line_within, 0)) + sum(coalesce(polygon_within, 0))) /
((select sum(coalesce(points_total, 1)) + sum(coalesce(line_total, 1)) + sum(coalesce(polygon_total, 1)))) *100) as percent

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





















--GOT IT WORKING 
--adding
select osm_uid, sum(coalesce(points_within, 0)) + sum(coalesce(line_within, 0)) + sum(coalesce(polygon_within, 0)) as total_within,
sum(coalesce(points_total, 0)) + sum(coalesce(line_total, 0)) + sum(coalesce(polygon_total, 0)) as total_total,
((select sum(coalesce(points_within, 0)) + sum(coalesce(line_within, 0)) + sum(coalesce(polygon_within, 0))) /
((select sum(coalesce(points_total, 0.0000000000000000000000001)) + sum(coalesce(line_total, 0.0000000000000000000001)) + sum(coalesce(polygon_total, 0.000000001)))) *100) as percent

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




--formatting 
--adding
select osm_uid, sum(coalesce(points_within, 0)) + sum(coalesce(line_within, 0)) + sum(coalesce(polygon_within, 0)) as total_within,
sum(coalesce(points_total, 0)) + sum(coalesce(line_total, 0)) + sum(coalesce(polygon_total, 0)) as total_total,
((select sum(coalesce(points_within, 0)) + sum(coalesce(line_within, 0)) + sum(coalesce(polygon_within, 0))) /
((select sum(coalesce(points_total, 0.0000000000000000000000001)) + sum(coalesce(line_total, 0.0000000000000000000001)) + sum(coalesce(polygon_total, 0.000000001)))) *100) as percent

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







--formatting
select osm_uid, 
sum(coalesce(points_within, 0)) + sum(coalesce(line_within, 0)) + sum(coalesce(polygon_within, 0)) as total_within,
sum(coalesce(points_total, 0)) + sum(coalesce(line_total, 0)) + sum(coalesce(polygon_total, 0)) as total_total,
((select sum(coalesce(points_within, 0)) + sum(coalesce(line_within, 0)) + sum(coalesce(polygon_within, 0))) /
((select sum(coalesce(points_total, 0.0000000000000000000000001)) + sum(coalesce(line_total, 0.0000000000000000000001)) + sum(coalesce(polygon_total, 0.000000001)))) *100) as percent
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





--final
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



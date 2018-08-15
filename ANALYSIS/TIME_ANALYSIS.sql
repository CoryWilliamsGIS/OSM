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
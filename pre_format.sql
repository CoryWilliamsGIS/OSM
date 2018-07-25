/*
SOURCE - INDY - QUERIES

https://github.com/baditaflorin/osm-postgis-scripts



================================================================================================================================================================================
																					CORY CODE - ADAPTED FROM MOST IMPORTANT INDY CODE
================================================================================================================================================================================
*/

--THE LENGTH OF ROADS ETC QUERIES IN THE INDY SECTION BELOW COULD BE USED TO CALCULATE PERCENTAGEES OF DIFFERENT THINGS....
--FOR EXAMPLE, BY GETTING THE TOTAL LENGTH OF ROAD IN KENYA EITHER ACCORDING TO OSM TOTAL OR JUST GENERAL STATISTIC
--PRETTY SURE THERE IS A WEBSITE WHICH CALCULATES TOTAL LENGTH OF ROAD FOR A COUNTRY...
--ALTERNATIVELY POSTGRES QUERY FOR IT


--Number of nodes
SELECT COUNT(*) FROM public.nairobi_final_poi3;

--Number of ways
SELECT COUNT(*) FROM public.nairobi_final_line3;

--Number of polygons 
SELECT COUNT(*) FROM public.nairobi_final_polygon3

--count of total users
select count(distinct osm_uid)
from (
    select osm_uid from public.nairobi_final_poi3
    union 
	select osm_uid from public.nairobi_final_line3
	union
	select osm_uid from public.nairobi_final_polygon3
) as userid

--top 10 unique users
select a.osm_user, a.osm_uid, count(*) as num
FROM (SELECT osm_user, osm_uid FROM public.nairobi_final_poi3 UNION SELECT osm_user FROM public.nairobi_final_line3) AS a
GROUP BY a.osm_user, a.osm_uid
ORDER BY num DESC
LIMIT 10

--top 10 amenities
SELECT value, COUNT(*) as num
FROM nodes_tags
WHERE key='amenity'
GROUP BY value
ORDER BY num DESC
LIMIT 10
;
--top 10 cuisines 
SELECT nodes_tags.value, COUNT(*) as num
FROM nodes_tags 
    JOIN (SELECT DISTINCT(id) FROM nodes_tags WHERE value='restaurant') i
    ON nodes_tags.id=i.id
WHERE nodes_tags.key='cuisine'
GROUP BY nodes_tags.value
ORDER BY num DESC;

--top 5 religions
SELECT nodes_tags.value, COUNT(*) as num
FROM nodes_tags
JOIN (SELECT DISTINCT(id) FROM nodes_tags WHERE value='place_of_worship') i
ON nodes_tags.id=i.id
WHERE nodes_tags.key='religion'
GROUP BY nodes_tags.value
ORDER BY num DESC
LIMIT 5;


SELECT
(SELECT COUNT(*) FROM PUBLIC.nairobi_final_poi3)+
(SELECT COUNT(*) FROM PUBLIC.nairobi_final_line3)+
(SELECT COUNT(*) FROM PUBLIC.nairobi_final_polygon3)
as total_edits

--Number of 'new' edits (version 1)
--also get combined total either sql or manual math
SELECT
(SELECT COUNT(*) FROM PUBLIC.nairobi_final_poi3 where osm_version = '1')+
(SELECT COUNT(*) FROM PUBLIC.nairobi_final_line3 where osm_version = '1')+
(SELECT COUNT(*) FROM PUBLIC.nairobi_final_polygon3 where osm_version = '1')
as new_edits

SELECT(
(SELECT
(SELECT COUNT(*)::FLOAT FROM public.nairobi_final_poi3 WHERE osm_version = '1')+
(SELECT COUNT(*)::FLOAT FROM public.nairobi_final_line3 WHERE osm_version = '1')+
(SELECT COUNT(*)::FLOAT FROM public.nairobi_final_polygon3 WHERE osm_version = '1')
as new_total) /
(SELECT		
(SELECT COUNT(*)::FLOAT FROM public.nairobi_final_poi3)+
(SELECT COUNT(*)::FLOAT FROM public.nairobi_final_line3)+
(SELECT COUNT(*)::FLOAT FROM public.nairobi_final_polygon3)) 
*100)
as percent_new

--Count of buildings  
SELECT COUNT (*) FROM nairobi_final_polygon3 where building is not null and building != 'no';

--Count of buildings with addresses (completeness)
--must also count address points that intersect buildings and add to the result below
--filter for points in QGIS:  "addr:housename"is not null or "addr:housenumber" is not null or "addr:street" is not null and "osm_id" > 0
--filter for polygons in QGIS:  "building" is not null and "building" != 'no' and "osm_id" > 0
SELECT COUNT (*) FROM nairobi_final_polygon3 where building is not null and building != 'no' and osm_id > 0 and ("addr:housenumber" is not null or "addr:housename" is not null or "addr:street" is not null);



--some percentages could be worked out for the below...
--Count of buildings  
select * from nairobi_final_polygon3 where building is not null and building != 'no';
SELECT COUNT (*) FROM nairobi_finalfilt_polygon where building is not null and building != 'no';

--Building Area
SELECT sum(ST_Area(way)/1000) as buildingAreaSqKm from nairobi_final_polygon3 where building is not null and building != 'no';

-- Count of building editors
select osm_user, count(osm_user) as Buildings_Edited from nairobi_final_polygon3 where building is not null and building != 'no'
group by osm_user order by Buildings_Edited desc;


--Count of all edits for POIs by editor
--Compare these to the columns in your table...
select osm_user, count(osm_user) as POIs from nairobi_final_poi3 where (aerialway is not null) or (aeroway is not null) or (amenity is not null) or (barrier is not null) or (highway is not null) or (historic is not null) or (leisure is not null) or (lock is not null) or (man_made is not null) or ("natural" is not null) or (power is not null) or (railway is not null) or (shop is not null) or (tourism is not null) or (waterway is not null) group by osm_user order by POIs desc;


-- Road length for new roads with names and road length for edits to existing road segments with names
SELECT sum(ST_Length(way))/1000 AS km_edits_to_existing_named_roads FROM nairobi_final_line3 where highway in ('motorway', 'motorway_link', 'trunk', 'trunk_link', 'primary', 'primary_link', 'secondary', 'secondary_link', 'residential', 'residential_link', 'service', 'tertiary', 'tertiary_link', 'road', 'track', 'unclassified', 'living_street') and name is not null and osm_version > '1'; 


--Count of new road segments and edits to existing road segments
select osm_version, count(osm_version) as NewRoad_Segments from nairobi_final_line3 where highway in ('motorway', 'motorway_link', 'trunk', 'trunk_link', 'primary', 'primary_link', 'secondary', 'secondary_link', 'residential', 'residential_link', 'service', 'tertiary', 'tertiary_link', 'road', 'track', 'unclassified', 'living_street') and osm_version = '1'group by osm_version;

select (
(SELECT Sum(St_length(way)) / 1000 
FROM   nairobi_final_line3 
WHERE  highway IN (
'motorway', 'motorway_link', 'trunk', 'trunk_link', 
'primary', 'primary_link', 'secondary','secondary_link',
'residential', 'residential_link', 'service', 'tertiary',
'tertiary_link', 'road', 'track','unclassified', 'living_street' 
) 
AND ( name IS NULL 
AND ref IS NULL )) / 
(SELECT Sum(St_length(way)) / 1000 
FROM   nairobi_final_line3 
WHERE  highway IN (
'motorway', 'motorway_link', 'trunk', 'trunk_link', 
'primary', 'primary_link', 'secondary','secondary_link',
'residential', 'residential_link', 'service', 'tertiary',
'tertiary_link', 'road', 'track','unclassified', 'living_street' 
)) *100)



--Length of unclassified roads intersected by buildings
--CAN ALSO DO COUNT INSTEAD OF LENGTH 
--OR CALCULATE PERCENTAGE OF LENGTH = UNCLASSIFIED
--IS UNCLASSIFIED THE SAME AS = NO TAGS ETC?
select nairobi_finalfilt_polygon.osm_id, (ST_LENGTH(ST_Intersection(nairobi_finalfilt_polygon.way, nairobi_finalfilt_line.way))/1000) 
from nairobi_finalfilt_polygon, nairobi_finalfilt_line 
where ST_Intersects(nairobi_finalfilt_polygon.way, nairobi_finalfilt_line.way) and nairobi_finalfilt_polygon.building is not null and nairobi_finalfilt_polygon.building != 'no' and nairobi_finalfilt_polygon.osm_id > 0 and nairobi_finalfilt_line.highway in ('unclassified') and nairobi_finalfilt_line.osm_id > 0;



--Count of edits by editors for specific POI types (may not be mutually exclusive)
--****Cross reference this with the column headers of the database tables
--example code to just get the counts is commented below:
select osm_uid, count(osm_uid) as aerialwayEdits from nairobi_final_poi3 where aerialway is not null group by osm_uid order by aerialwayEdits desc;
select osm_uid, count(osm_uid) as aerowayEdits from nairobi_final_poi3 where aeroway is not null group by osm_uid order by aerowayEdits desc;
select osm_uid, count(osm_uid) as amenityEdits from nairobi_final_poi3 where amenity is not null group by osm_uid order by amenityEdits desc;
select osm_uid, count(osm_uid) as barrierEdits from nairobi_final_poi3 where barrier is not null group by osm_uid order by barrierEdits desc;
select osm_uid, count(osm_uid) as highwayEdits from nairobi_final_poi3 where highway is not null group by osm_uid order by highwayEdits desc;
select osm_uid, count(osm_uid) as historicEdits from nairobi_final_poi3 where historic is not null group by osm_uid order by historicEdits desc;
select osm_uid, count(osm_uid) as leisureEdits from nairobi_final_poi3 where leisure is not null group by osm_uid order by leisureEdits desc;
select osm_uid, count(osm_uid) as lockEdits from nairobi_final_poi3 where "lock" is not null group by osm_uid order by lockEdits desc;
select osm_uid, count(osm_uid) as man_madeEdits from nairobi_final_poi3 where man_made is not null group by osm_uid order by man_madeEdits desc;
select osm_uid, count(osm_uid) as naturalEdits from nairobi_final_poi3 where "natural" is not null group by osm_uid order by naturalEdits desc;
select osm_uid, count(osm_uid) as powerEdits from nairobi_final_poi3 where power is not null group by osm_uid order by powerEdits desc;
select osm_uid, count(osm_uid) as railwayEdits from nairobi_final_poi3 where railway is not null group by osm_uid order by railwayEdits desc;
select osm_uid, count(osm_uid) as shopEdits from nairobi_final_poi3 where shop is not null group by osm_uid order by shopEdits desc;
select osm_uid, count(osm_uid) as tourismEdits from nairobi_final_poi3 where tourism is not null group by osm_uid order by tourismEdits desc;
select osm_uid, count(osm_uid) as waterwayEdits from nairobi_final_poi3 where waterway is not null group by osm_uid order by waterwayEdits desc;


-- Count of POIs by type
--cross ref with column headers 
select 
(select count(*) as aerialway from nairobi_final_poi32 where aerialway is not null),
(select count(*) as aeroway from nairobi_final_poi3 where aeroway is not null),
(select count(*) as amenity from nairobi_final_poi32 where amenity is not null),
(select count(*) as barrier from nairobi_final_poi32 where barrier is not null),
(select count(*) as bicycle from nairobi_final_poi32 where bicycle is not null),
(select count(*) as brand from nairobi_final_poi32 where brand is not null),
(select count(*) as bridge from nairobi_final_poi32 where bridge is not null),
(select count(*) as building from nairobi_final_poi32 where building is not null),
(select count(*) as harbour from nairobi_final_poi32 where harbour is not null),
(select count(*) as highway from nairobi_final_poi32 where highway is not null),
(select count(*) as historic from nairobi_final_poi32 where historic is not null),
(select count(*) as leisure from nairobi_final_poi32 where leisure is not null),
(select count(*) as "lock" from nairobi_final_poi32 where "lock" is not null),
(select count(*) as man_made from nairobi_final_poi32 where man_made is not null),
(select count(*) as military from nairobi_final_poi32 where military is not null),
(select count(*) as public_transport from nairobi_final_poi32 where public_transport is not null),
(select count(*) as power_source from nairobi_final_poi32 where power_source is not null),
(select count(*) as "natural" from nairobi_final_poi32 where "natural" is not null),
(select count(*) as railway from nairobi_final_poi32 where railway is not null),
(select count(*) as religion from nairobi_final_poi32 where religion is not null),
(select count(*) as shop from nairobi_final_poi32 where shop is not null),
(select count(*) as sport from nairobi_final_poi32 where sport is not null),
(select count(*) as tourism from nairobi_final_poi32 where tourism is not null),
(select count(*) as tunnel from nairobi_final_poi32 where tunnel is not null),
(select count(*) as waterway from nairobi_final_poi32 where waterway is not null),
(select count(*) as water from nairobi_final_poi32 where water is not null),
(select count(*) as wood from nairobi_final_poi32 where wood is not null);


--accounting for 'duplicate data' a.k.a polygons and points
--How many points have a corresponding polygon?
--this can be extrapolated
select count(distinct nairobi_point.osm_id) from nairobi_point, nairobi_polygon where st_within(nairobi_point.way, nairobi_polygon.way)

--How many airport points are new since the targeted editing post on December 14th (tweet time was 2:45pm PST)?*
--This can be changed to any feature of interest based on the project / tweet suggestion
--also the 'new_airports_sql.sql' file contains the method to calculate the % increase 
select count (*) from nairobi_finalfilt_point where aeroway = 'aerodrome' and osm_timestamp > '2015-12-14 18:13:00-08'));

--can be used to assess how detailed features are.... 
--asuming nairobi would be more detailed than nairobi_final_line3
--can be changed for the top 5 most common ammenities etc (also need to be common between datasets)
--examples below are for determining if banks havee a website
--on second thoughts.. dont think it can be used with the structure of my db (no hstore) and therefore no website tags etc
select count(*) from nairobi_finalfilt_polygon where (amenity = 'bank' or building = 'bank') and osm_id > 0 and (tags ? 'website' or tags ? 'url')));
select count(*) from nairobi_finalfilt_point where (amenity = 'bank' or building = 'bank') and (tags ? 'opening_hours' or tags ? 'operating_hours');
--however... could do something like this.... using the completenes of the address
select count(*) from nairobi_finalfilt_point where (amenity = 'bank' or building = 'bank') and "addr:housenumber" is not null));
select count(*) from nairobi_finalfilt_polygon where (amenity = 'bank' or building = 'bank') and "addr:housenumber" is not null);


--IDENTIFYING INCONSISTENT NAMING AND SPELLING
--RUN A SET OF QUERIES LIKE BELOW....
-- Calculate the number of unique names for funiculars, light rails, monorails, rails, subways and trams associated with the railway key for all ways.  Do the counts seem reasonable?  Extremely high numbers could mean inconsistant naming and spelling.

insert into transit (query_name, value) values ('railway_funicular_way_names', (select count (distinct name) from nairobi_finalfilt_line where railway = 'funicular' and name is not null and osm_id > 0));

insert into transit (query_name, value) values ('railway_light_rail_way_names', (select count (distinct name) from nairobi_finalfilt_line where railway = 'light_rail' and name is not null and osm_id > 0));

insert into transit (query_name, value) values ('railway_monorail_way_names', (select count (distinct name) from nairobi_finalfilt_line where railway = 'monorail' and name is not null and osm_id > 0));

insert into transit (query_name, value) values ('railway_rail_way_names', (select count (distinct name) from nairobi_finalfilt_line where railway = 'rail' and name is not null and osm_id > 0));

insert into transit (query_name, value) values ('railway_subway_way_names', (select count (distinct name) from nairobi_finalfilt_line where railway = 'subway' and name is not null and osm_id > 0));

insert into transit (query_name, value) values ('railway_tram_way_names', (select count (distinct name) from nairobi_finalfilt_line where railway = 'tram' and name is not null and osm_id > 0));	

insert into transit (query_name, value) values ('railway_all_way_names', (select count (distinct name) from nairobi_finalfilt_line where railway in ('funicular', 'light_rail', 'monorail', 'rail', 'subway', 'tram') and name is not null and osm_id > 0));
-----------------------------------------------------------------------------------

--This is a good one.....
--first, select distinct names of 'highway' column for each case study...
--add these distinct names into the following query 
 
-- km of commonly routable roads with names
SELECT Sum(St_length(way)) / 1000 
FROM   nairobi_final_polygon3 
WHERE  highway IN (
'motorway', 'motorway_link', 'trunk', 'trunk_link', 
'primary', 'primary_link', 'secondary','secondary_link',
'residential', 'residential_link', 'service', 'tertiary',
'tertiary_link', 'road', 'track','unclassified', 'living_street' 
) 
AND ( name IS NOT NULL 
OR ref IS NOT NULL ); 

-- km of commonly routable roads without names
SELECT Sum(St_length(way)) / 1000 
FROM   nairobi_final_polygon3 
WHERE  highway IN (
'motorway', 'motorway_link', 'trunk', 'trunk_link', 
'primary', 'primary_link', 'secondary','secondary_link',
'residential', 'residential_link', 'service', 'tertiary',
'tertiary_link', 'road', 'track','unclassified', 'living_street' 
) 
AND ( name IS NULL 
OR ref IS NULL );





-- km of motorways
ELECT Sum(St_length(way)) / 1000 
FROM   nairobi_finalfilt_line 
WHERE  highway = 'motorway'; 

-- km of motorways without names
SELECT Sum(St_length(way)) / 1000 
FROM   nairobi_finalfilt_line 
WHERE  highway = 'motorway' 
AND ( name IS NULL 
AND ref IS NULL 
                  

--manually calc the % from the result of the above 2 queries 
--% of motorways with/without names (as a % of motorways)
--% of motorways with/without names (as a % of total roads) ='commonly routable roads)
--REPEAT  FOR ROAD TYPES


--compare number of polygons with addresses to the points with addresses? 
--after seeing the points intersecting polygon results from the scripts above (somewhere)
SELECT COUNT (*) FROM nairobi_final_polygon3 where building is not null and building != 'no' and ("addr:housenumber" is not null or "addr:housename" is not null or "addr:place" is not null);

--number of religion tags
SELECT count(*) FROM nairobi_final_polygon3 where religion is not null 
SELECT count(*) FROM nairobi_final_poi3 where religion is not null

--calc kmsq of building polygons
SELECT sum(ST_Area(way)/1000) as buildingAreaSqKm from nairobi_finalfilt_polygon where building is not null and building != 'no';

--number of POI's...repeat for each column..
select count(*) from nairobi_finalfilt_point where aerialway is not null;
select count(*) from nairobi_finalfilt_point where aeroway is not null)
select count(*) from nairobi_finalfilt_point where amenity is not null;



select count(*) from nairobi_finalfilt_polygon where amenity is not null

--amenity null ratio - calculate amenities = null for point, line, poly.. repeat for not null... add together = total, calc % of not null
select count(*) from nairobi_final_poi3 where amenity is null --737104
select count(*) from nairobi_final_line3 where amenity is null --"38897"
select count(*) from nairobi_final_polygon3 where amenity is null --"70300"

select count(*) from nairobi_final_poi3 --740681
select count(*) from nairobi_final_line3  --39135
select count(*) from nairobi_final_polygon3  --73503


SELECT(
(SELECT
(SELECT COUNT(*)::FLOAT FROM public.nairobi_final_poi3 WHERE amenity is null)+
(SELECT COUNT(*)::FLOAT FROM public.nairobi_final_line3 WHERE amenity is null)+
(SELECT COUNT(*)::FLOAT FROM public.nairobi_final_polygon3 WHERE amenity is null)
as null_total) /
(SELECT		
(SELECT COUNT(*)::FLOAT FROM public.nairobi_final_poi3)+
(SELECT COUNT(*)::FLOAT FROM public.nairobi_final_line3)+
(SELECT COUNT(*)::FLOAT FROM public.nairobi_final_polygon3)) 
*100)
as percent_null

--null amenity for just pointsSELECT(
(SELECT
(SELECT COUNT(*)::FLOAT FROM public.nairobi_final_poi3 WHERE amenity is null)
as null_total) /		
(SELECT COUNT(*)::FLOAT FROM public.nairobi_final_poi3)
*100)
as percent_null
 
/* Quattrone - mind the map: Parameters used to compare to cultural/economic 

WHO ARE THE OSM USERS:
number of osm users 
osm users per million internet users 
OSM power users 
osm power users per million internet users 

HOW MUCH:
Geometric mean edits per user 
Geometric mean edits per power user

HOW LONG:
Geometric mean user lifetime (days)
Geometric mean power user lifetime (days)

HOW:
null amenity ratio
overwrite ratio

WHEN:
Speed of adoption (active users per month)
Normalised temporal diversity

Where:
Normalised spatial diversity
*/



--works for 1
SELECT * FROM nairobihot_nodes
WHERE tags::text like '%385027%'

LIKE ANY(ARRAY['AAA%', 'BBB%', 'CCC%'])

--works for many
SELECT * FROM nairobihot_nodes
WHERE tags::text like any (array['%385027%', '%18236%', '%7203'])





-------------


what is mapped 














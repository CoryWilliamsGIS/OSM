--ward analysis
--Manchester

--total points in each ward, group by ward name
SELECT public.manchester_ward_polys.name, count(public.manchester_final_poi3.way) AS total
FROM public.manchester_ward_polys LEFT JOIN public.manchester_final_poi3 
ON st_contains(public.manchester_ward_polys.geom, public.manchester_final_poi3.way) 
GROUP BY public.manchester_ward_polys.name;

--total line in each ward, group by ward name
SELECT public.manchester_ward_polys.name, count(public.manc_final_line3.way) AS total
FROM public.manchester_ward_polys LEFT JOIN public.manc_final_line3
ON st_contains(public.manchester_ward_polys.geom, public.manc_final_line3.way) 
GROUP BY public.manchester_ward_polys.name;

--total polygon in each ward, group by ward name
SELECT public.manchester_ward_polys.name, count(public.manc_final_polygon3.way) AS total
FROM public.manchester_ward_polys LEFT JOIN public.manc_final_polygon3
ON st_contains(public.manchester_ward_polys.geom, public.manc_final_polygon3.way) 
GROUP BY public.manchester_ward_polys.name;

--exactly which points are within each ward
--repeat for line, poly
SELECT
t1.osm_id as "id",
t2.name as "Ward Name"
FROM public.manchester_final_poi3 t1
JOIN public.manchester_ward_polys t2 ON (ST_Within(t1.way, t2.geom))
WHERE t1.type = 1
AND t2.type = 3;

--select count of version 1 point edits, group by ward
SELECT public.manchester_ward_polys.name, count(public.manchester_final_poi3.way) AS total
FROM public.manchester_ward_polys LEFT JOIN public.manchester_final_poi3 
ON st_contains(public.manchester_ward_polys.geom, public.manchester_final_poi3.way) 
WHERE public.manchester_final_poi3.osm_version = '1'
GROUP BY public.manchester_ward_polys.name;	

--alternative of above
--select count of version 1 point edits, group by ward
--this can be repeated for which ever column
SELECT manchester_ward_polys.name AS name, count(public.manchester_final_poi3.way) AS total 
FROM manchester_ward_polys, public.manchester_final_poi3 WHERE public.manchester_final_poi3.osm_version = '1' AND ST_Contains(public.manchester_ward_polys.geom, public.manchester_final_poi3.way) 
GROUP BY public.manchester_ward_polys.name;

--select count of version 1 line edits, group by ward
SELECT manchester_ward_polys.name AS name, count(public.manc_final_line3.way) AS total 
FROM manchester_ward_polys, public.manc_final_line3 WHERE public.manc_final_line3.osm_version = '1' AND ST_Contains(public.manchester_ward_polys.geom, public.manc_final_line3.way) 
GROUP BY public.manchester_ward_polys.name;	

--select count of version 1 polygon edits, group by ward
SELECT manchester_ward_polys.name AS name, count(public.manc_final_polygon3.way) AS total 
FROM manchester_ward_polys, public.manc_final_polygon3 WHERE public.manc_final_polygon3.osm_version = '1' AND ST_Contains(public.manchester_ward_polys.geom, public.manc_final_polygon3.way) 
GROUP BY public.manchester_ward_polys.name;	


--select count of distinct osm_uids
SELECT public.manchester_ward_polys.name, count(distinct public.manc_final_polygon3.osm_uid) AS total
FROM public.manchester_ward_polys LEFT JOIN public.manc_final_polygon3 
ON st_contains(public.manchester_ward_polys.geom, public.manc_final_polygon3.way)  
GROUP BY public.manchester_ward_polys.name;

--building count
SELECT manchester_ward_polys.name AS name, count(public.manc_final_polygon3.*) AS total 
FROM manchester_ward_polys, public.manc_final_polygon3 
WHERE public.manc_final_polygon3.building is not null and building != 'no' AND ST_Contains(public.manchester_ward_polys.geom, public.manc_final_polygon3.way) 
GROUP BY public.manchester_ward_polys.name;

--building editor count
SELECT manchester_ward_polys.name AS name, count(distinct public.manc_final_polygon3.osm_uid) AS total 
FROM manchester_ward_polys, public.manc_final_polygon3 
WHERE public.manc_final_polygon3.building is not null and building != 'no' AND ST_Contains(public.manchester_ward_polys.geom, public.manc_final_polygon3.way) 
GROUP BY public.manchester_ward_polys.name;

--poi with corresponding polygon 
SELECT manchester_ward_polys.name AS name, count(distinct public.manchester_final_poi3.osm_id)   
FROM manchester_ward_polys, public.manchester_final_poi3, public.manc_final_polygon3 
WHERE st_within(manchester_final_poi3.way, manc_final_polygon3.way) AND ST_Contains(public.manchester_ward_polys.geom, public.manc_final_polygon3.way) 
GROUP BY public.manchester_ward_polys.name;

--count of null amenities
--divide by total number of poi's and * 100 to get % null
SELECT manchester_ward_polys.name AS name, count(public.manchester_final_poi3.*) AS total 
FROM manchester_ward_polys, public.manchester_final_poi3 
WHERE public.manchester_final_poi3.amenity is null AND ST_Contains(public.manchester_ward_polys.geom, public.manchester_final_poi3.way) 
GROUP BY public.manchester_ward_polys.name;

--building count with low level addresses
SELECT manchester_ward_polys.name AS name, count(public.manc_final_polygon3.*) AS total 
FROM manchester_ward_polys, public.manc_final_polygon3 
WHERE public.manc_final_polygon3.building is not null and building != 'no' and ("addr:housenumber" is not null or "addr:housename" is not null or "addr:place" is not null) AND ST_Contains(public.manchester_ward_polys.geom, public.manc_final_polygon3.way) 
GROUP BY public.manchester_ward_polys.name;

--feature count = Number of features/Land Area
--area already calculated 
--number of edits already calculated
--srid:3857 units = meters
--m2 to km2 = m2 / 1,000,000 
--name, shape_area
--calculated in excel
select name, st_area(geom) from manchester_ward_polys

----
--calculating the frequency of amenities which become most frequent
create table test as (
SELECT manchester_ward_polys.name AS name, public.manc_final_polygon3.amenity, count(public.manc_final_polygon3.amenity)
AS total 
FROM manchester_ward_polys, public.manc_final_polygon3 
WHERE ST_Contains(public.manchester_ward_polys.geom, public.manc_final_polygon3.way) 
GROUP BY public.manchester_ward_polys.name, public.manc_final_polygon3.amenity
);

create table test1 as (
SELECT
  * 
FROM (
  SELECT
    ROW_NUMBER() OVER (PARTITION BY name ORDER BY total desc) AS r,
    t.*
  FROM
    test t) x
WHERE
  x.r <= 1
	);

select amenity, count(amenity) from test1
group by test1.amenity
order by count(amenity) desc;
----
----









-----------------

--somewhat near to what i wanted....
SELECT public.manchester_ward_polys.name, public.manchester_final_poi3."access", count(*) AS total
FROM public.manchester_ward_polys LEFT JOIN public.manchester_final_poi3 
ON st_contains(public.manchester_ward_polys.geom, public.manchester_final_poi3.way) 
WHERE public.manchester_final_poi3."access" is not null
GROUP BY public.manchester_ward_polys.name, public.manchester_final_poi3."access"
order by count(*) desc
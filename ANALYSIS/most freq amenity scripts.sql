create table n_test as (
SELECT nairobi_wards_polys.name AS name, public.nairobi_final_poi3.amenity, count(public.nairobi_final_poi3.amenity)
AS total 
FROM nairobi_wards_polys, public.nairobi_final_poi3 
WHERE ST_Contains(public.nairobi_wards_polys.geom, public.nairobi_final_poi3.way) 
GROUP BY public.nairobi_wards_polys.name, public.nairobi_final_poi3.amenity
);


--select * from n_test

create table n_test1 as (
SELECT
  * 
FROM (
  SELECT
    ROW_NUMBER() OVER (PARTITION BY name ORDER BY total desc) AS r,
    t.*
  FROM
    n_test t) x
WHERE
  x.r <= 1
	); 
	
select name, amenity, total from n_test1
group by n_test1.name, n_test1.amenity, total
order by total desc; 

---------------------gm

create table gm_test as (
SELECT manchester_wards_polys2011.name AS name, public.manchester_final_poi3.amenity, count(public.manchester_final_poi3.amenity)
AS total 
FROM manchester_wards_polys2011, public.manchester_final_poi3 
WHERE ST_Contains(public.manchester_wards_polys2011.geom, public.manchester_final_poi3.way) 
GROUP BY public.manchester_wards_polys2011.name, public.manchester_final_poi3.amenity
);

create table gm_test1 as (
SELECT
  * 
FROM (
  SELECT
    ROW_NUMBER() OVER (PARTITION BY name ORDER BY total desc) AS r,
    t.*
  FROM
    gm_test t) x
WHERE
  x.r <= 1
	);

select name, amenity, total from gm_test1
group by gm_test1.name, gm_test1.amenity, total
order by total desc;
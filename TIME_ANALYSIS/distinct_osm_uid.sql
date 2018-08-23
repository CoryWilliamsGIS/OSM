--distinct osm_uid

create table gm_uid_2017 (
osm_uid varchar(80),
name varchar(80));

INSERT INTO gm_uid_2017(osm_uid, name)
SELECT public.gm2017_final_poi.osm_uid, manc_consts.name
FROM public.manc_consts LEFT JOIN public.gm2017_final_poi
ON st_contains(public.manc_consts.geom, public.gm2017_final_poi.way);  

INSERT INTO gm_uid_2017(osm_uid, name)
SELECT public.gm2017_final_line.osm_uid, manc_consts.name
FROM public.manc_consts LEFT JOIN public.gm2017_final_line
ON st_contains(public.manc_consts.geom, public.gm2017_final_line.way);  

INSERT INTO gm_uid_2017(osm_uid, name)
SELECT public.gm2017_final_polygon.osm_uid, manc_consts.name
FROM public.manc_consts LEFT JOIN public.gm2017_final_polygon
ON st_contains(public.manc_consts.geom, public.gm2017_final_polygon.way);  

select count(distinct osm_uid), name from gm_uid_2017
group by name;



--version 1
select tbl0.constituen, tbl1.poi_total, tbl2.line_total, tbl3.poly_total,
sum(coalesce(tbl1.poi_total,0)) + sum(coalesce(tbl2.line_total,0)) + sum(coalesce(tbl3.poly_total,0))
as overall_v1_count
from (
(select constituen from nairobi_consts)tbl0
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2008_final_poi.way) AS poi_total
FROM public.nairobi_consts LEFT JOIN public.n2008_final_poi
ON st_contains(public.nairobi_consts.geom, public.n2008_final_poi.way) 
WHERE public.n2008_final_poi.osm_version = '1'
GROUP BY public.nairobi_consts.constituen
)tbl1
on tbl0.constituen = tbl1.constituen
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2008_final_line.way) AS line_total
FROM public.nairobi_consts LEFT JOIN public.n2008_final_line
ON st_contains(public.nairobi_consts.geom, public.n2008_final_line.way) 
WHERE public.n2008_final_line.osm_version = '1'
GROUP BY public.nairobi_consts.constituen
)tbl2
on tbl0.constituen = tbl2.constituen
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2008_final_polygon.way) AS poly_total
FROM public.nairobi_consts LEFT JOIN public.n2008_final_polygon
ON st_contains(public.nairobi_consts.geom, public.n2008_final_polygon.way) 
WHERE public.n2008_final_polygon.osm_version = '1'
GROUP BY public.nairobi_consts.constituen
)tbl3
on tbl0.constituen = tbl3.constituen)
group by tbl0.constituen, tbl1.poi_total, tbl2.line_total, tbl3.poly_total



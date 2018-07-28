

--Calculate total number of records prior to removing bulk imports
--total is 525766
SELECT 
(SELECT COUNT(*) FROM  public.nairobihot_point)+
(SELECT COUNT(*) FROM  public.nairobihot_line)+
(SELECT COUNT(*) FROM  public.nairobihot_polygon)
AS Count_Bulk

--Calculate total number of records after removing bulk imports
--total is "308271"
SELECT 
(SELECT COUNT(*) FROM  public.nairobi_point_no_bulk)+
(SELECT COUNT(*) FROM  public.nairobi_line_no_bulk)+
(SELECT COUNT(*) FROM  public.nairobi_polygon_no_bulk)
AS Count_No_Bulk

--Calculate total number of users before removing bulk imports
--total is "2163"
SELECT 
(SELECT COUNT(distinct osm_uid) FROM  public.nairobihot_point)+
(SELECT COUNT(distinct osm_uid) FROM  public.nairobihot_line)+
(SELECT COUNT(distinct osm_uid) FROM  public.nairobihot_polygon)
AS UID_Count_No_Bulk


--Calculate total number of users after removing bulk imports
--total is 2159
SELECT 
(SELECT COUNT(distinct osm_uid) FROM  public.nairobi_point_no_bulk)+
(SELECT COUNT(distinct osm_uid) FROM  public.nairobi_line_no_bulk)+
(SELECT COUNT(distinct osm_uid) FROM  public.nairobi_polygon_no_bulk)
AS UID_Count_No_Bulk

--Records:

--"448442" bulk point
--"247345" no bulk point

--"60146" bulk polygon
--"43748" no bulk polygon

--"17178" both bulk and no bulk - line no change












select * from public.nairobihot_polygon
where (osm_timestamp::date)::text || osm_uid::text
not in (select (osm_timestamp::date)::text || osm_uid::text
from public.nairobihot_polygon
group by (osm_timestamp::date)::text || osm_uid::text
having count(*) > 1000
)

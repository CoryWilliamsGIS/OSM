/*
GLOBAL VARIATIONS IN OPENSTREETMAP
PRE_PROCESSING.SQL

=====================================================================================================================================================================
GREATER MANCHESTER
=====================================================================================================================================================================
*/

--create a table with distinct nairobi uid's
create table public.mancdistinctuid as 
select distinct osm_uid
from (
    select osm_uid from public.manchester_point_no_bulk
    union 
	select osm_uid from public.manchester_line_no_bulk
	union
	select osm_uid from public.manchester_polygon_no_bulk
	) as userid


	
/*
================================================================================================================================================	
================================================================================================================================================	
===================================================THIS SECTION HAS BEEN REPLACED WITH"NEW_BULK_REMOVE_NAIROBI.SQL ======================================================================================================	

	
--Create new point table with bulk imports removed
/*  Original table = ??? records
	bulk removed table = ??? records	*/
create table public.manchester_point_no_bulk as
select * from public.manchester_point
where (osm_timestamp::date)::text || osm_uid::text
not in (select (osm_timestamp::date)::text || osm_uid::text
from public.manchester_point
group by (osm_timestamp::date)::text || osm_uid::text
having count(*) > 1000
)

--Create new line table with bulk imports removed
/*  Original table = ??? records
	bulk removed table = ??? records	*/
create table public.manchester_line_no_bulk as
select * from public.manchester_line
where (osm_timestamp::date)::text || osm_uid::text
not in (select (osm_timestamp::date)::text || osm_uid::text
from public.manchester_line
group by (osm_timestamp::date)::text || osm_uid::text
having count(*) > 1000
)

--Create new polygon table with bulk imports removed
/*  Original table = ??? records
	bulk removed table = ??? records	*/
create table public.manchester_polygon_no_bulk as
select * from public.manchester_polygon
where (osm_timestamp::date)::text || osm_uid::text
not in (select (osm_timestamp::date)::text || osm_uid::text
from public.manchester_polygon
group by (osm_timestamp::date)::text || osm_uid::text
having count(*) > 1000
)


--Calculate total number of records prior to removing bulk imports
--total is 1795980
SELECT 
(SELECT COUNT(*) FROM  public.manchester_point)+
(SELECT COUNT(*) FROM  public.manchester_line)+
(SELECT COUNT(*) FROM  public.manchester_polygon)
AS Count_Bulk

--Calculate total number of records after removing bulk imports
--total is 1138394
SELECT 
(SELECT COUNT(*) FROM  public.manchester_point_no_bulk)+
(SELECT COUNT(*) FROM  public.manchester_line_no_bulk)+
(SELECT COUNT(*) FROM  public.manchester_polygon_no_bulk)
AS Count_No_Bulk

--Calculate total number of users before removing bulk imports
--total is 2084
select distinct osm_uid
from (
    select osm_uid from public.manchester_point
    union 
	select osm_uid from public.manchester_line
	union
	select osm_uid from public.manchester_polygon
	) as userid_count


--Calculate total number of users after removing bulk imports
--total is 2083
select distinct osm_uid
from (
    select osm_uid from public.manchester_point_no_bulk
    union 
	select osm_uid from public.manchester_line_no_bulk
	union
	select osm_uid from public.manchester_polygon_no_bulk
	) as userid

--records:
--1544525 bulk point
--893721 no bulk point

--125514 bulk polygon
--118732 no bulk polygon

--line = same
--================================================================================================================================================	
--================================================================================================================================================
--Identify which tables have anonymous imports (user_id = 0)
select * from manchester_point_no_bulk where osm_uid = '0' --121 anonymous
select * from manchester_line_no_bulk where osm_uid = '0' --0 anonymous
select * from manchester_polygon_no_bulk where osm_uid = '0' --0 anonymous

--delete anonymous users from the tables 
--deleted 121
delete * from manchester_point2 where osm_uid = '0'

--Merge the multiple tables produced by inserting the kenya_Nairobi data through OSM2PGSQL multiple file imports

--Create merged tables
create table manc_merge_point1 as (
    select * from public.b_manc_1_a_ab_point
    union 
	select * from public.b_manc_1_a_ac_point
    union 
	select * from public.b_manc_1_a_ad_point
    union 
	select * from public.b_manc_1_a_ae_point
    union 
	select * from public.b_manc_1_b_a_point
	union
	select * from public.b_manc_1_b_b_point
	union 
	select * from public.b_manc_1_b_c_point
	union
	select * from public.b_manc_1_b_d_point
	union 
	select * from public.b_manc_1_b_e_point
	union
	select * from public.b_manc_1_b_f_point	
) 

create table manc_merge_line1 as (
    select * from public.b_manc_1_a_ab_line
    union 
	select * from public.b_manc_1_a_ac_line
    union 
	select * from public.b_manc_1_a_ad_line
    union 
	select * from public.b_manc_1_a_ae_line
    union 
	select * from public.b_manc_1_b_a_line
	union
	select * from public.b_manc_1_b_b_line
	union 
	select * from public.b_manc_1_b_c_line
	union
	select * from public.b_manc_1_b_d_line
	union 
	select * from public.b_manc_1_b_e_line
	union
	select * from public.b_manc_1_b_f_line	
) 

create table manc_merge_polygon1 as (
    select * from public.b_manc_1_a_ab_polygon
    union 
	select * from public.b_manc_1_a_ac_polygon
    union 
	select * from public.b_manc_1_a_ad_polygon
    union 
	select * from public.b_manc_1_a_ae_polygon
    union 
	select * from public.b_manc_1_b_a_polygon
	union
	select * from public.b_manc_1_b_b_polygon
	union 
	select * from public.b_manc_1_b_c_polygon
	union
	select * from public.b_manc_1_b_d_polygon
	union 
	select * from public.b_manc_1_b_e_polygon
	union
	select * from public.b_manc_1_b_f_polygon	
) 

create table manc_merge_point2 as (
    select * from public.b_manc_2_a_ab_point
    union 
	select * from public.b_manc_2_a_ac_point
	union 
	select * from public.b_manc_2_a_ad_point
	union 
	select * from public.b_manc_2_a_ae_point
	union 
	select * from public.b_manc_2_a_af_point
	union 
	select * from public.b_manc_2_a_ag_point
	union 
	select * from public.b_manc_2_a_ah_point
	union 
	select * from public.b_manc_2_a_ai_point
	union 
	select * from public.b_manc_2_a_aj_point
	union 
	select * from public.b_manc_2_a_ak_point
) 

create table manc_merge_line2 as (
    select * from public.b_manc_2_a_ab_line
    union 
	select * from public.b_manc_2_a_ac_line
	union 
	select * from public.b_manc_2_a_ad_line
	union 
	select * from public.b_manc_2_a_ae_line
	union 
	select * from public.b_manc_2_a_af_line
	union 
	select * from public.b_manc_2_a_ag_line
	union 
	select * from public.b_manc_2_a_ah_line
	union 
	select * from public.b_manc_2_a_ai_line
	union 
	select * from public.b_manc_2_a_aj_line
	union 
	select * from public.b_manc_2_a_ak_line
) 

create table manc_merge_polygon2 as (
    select * from public.b_manc_2_a_ab_polygon
    union 
	select * from public.b_manc_2_a_ac_polygon
	union 
	select * from public.b_manc_2_a_ad_polygon
	union 
	select * from public.b_manc_2_a_ae_polygon
	union 
	select * from public.b_manc_2_a_af_polygon
	union 
	select * from public.b_manc_2_a_ag_polygon
	union 
	select * from public.b_manc_2_a_ah_polygon
	union 
	select * from public.b_manc_2_a_ai_polygon
	union 
	select * from public.b_manc_2_a_aj_polygon
	union 
	select * from public.b_manc_2_a_ak_polygon
)

create table manc_merge_point3 as (
    select * from public.b_manc_3_a_ab_point
    union 
	select * from public.b_manc_3_a_ac_point
	union 
	select * from public.b_manc_3_a_ad_point
	union 
	select * from public.b_manc_3_a_ae_point
	union 
	select * from public.b_manc_3_a_af_point
	union 
	select * from public.b_manc_3_a_ag_point
	union 
	select * from public.b_manc_3_a_ah_point
	union 
	select * from public.b_manc_3_a_ai_point
	union 
	select * from public.b_manc_3_a_aj_point
	union 
	select * from public.b_manc_3_a_ak_point
	union
	select * from public.b_manc_3_a_al_point
) 

create table manc_merge_line3 as (
    select * from public.b_manc_3_a_ab_line
    union 
	select * from public.b_manc_3_a_ac_line
	union 
	select * from public.b_manc_3_a_ad_line
	union 
	select * from public.b_manc_3_a_ae_line
	union 
	select * from public.b_manc_3_a_af_line
	union 
	select * from public.b_manc_3_a_ag_line
	union 
	select * from public.b_manc_3_a_ah_line
	union 
	select * from public.b_manc_3_a_ai_line
	union 
	select * from public.b_manc_3_a_aj_line
	union 
	select * from public.b_manc_3_a_ak_line
	union
	select * from public.b_manc_3_a_al_line
) 

create table manc_merge_polygon3 as (
    select * from public.b_manc_3_a_ab_polygon
    union 
	select * from public.b_manc_3_a_ac_polygon
	union 
	select * from public.b_manc_3_a_ad_polygon
	union 
	select * from public.b_manc_3_a_ae_polygon
	union 
	select * from public.b_manc_3_a_af_polygon
	union 
	select * from public.b_manc_3_a_ag_polygon
	union 
	select * from public.b_manc_3_a_ah_polygon
	union 
	select * from public.b_manc_3_a_ai_polygon
	union 
	select * from public.b_manc_3_a_aj_polygon
	union 
	select * from public.b_manc_3_a_ak_polygon
	union
	select * from public.b_manc_3_a_al_polygon
)

create table manc_merge_point4 as (
    select * from public.b_manc_4_a_ab_point
    union 
	select * from public.b_manc_4_a_ac_point
	union 
	select * from public.b_manc_4_a_ad_point
	union 
	select * from public.b_manc_4_a_ae_point
	union 
	select * from public.b_manc_4_a_af_point
) 

create table manc_merge_line4 as (
    select * from public.b_manc_4_a_ab_line
    union 
	select * from public.b_manc_4_a_ac_line
	union 
	select * from public.b_manc_4_a_ad_line
	union 
	select * from public.b_manc_4_a_ae_line
	union 
	select * from public.b_manc_4_a_af_line
) 

create table manc_merge_polygon4 as (
    select * from public.b_manc_4_a_ab_polygon
    union 
	select * from public.b_manc_4_a_ac_polygon
	union 
	select * from public.b_manc_4_a_ad_polygon
	union 
	select * from public.b_manc_4_a_ae_polygon
	union 
	select * from public.b_manc_4_a_af_polygon
)

--manc_merge_point/line/polygon_5 skipped as relevant file was imported correctly as one

create table manc_merge_point6 as (
    select * from public.b_manc_6_a_ab_point
    union 
	select * from public.b_manc_6_a_ac_point
	union 
	select * from public.b_manc_6_a_ad_point
	union 
	select * from public.b_manc_6_a_ae_point
	union 
	select * from public.b_manc_6_a_af_point
	union 
	select * from public.b_manc_6_a_ag_point
	union 
	select * from public.b_manc_6_a_ah_point
	union 
	select * from public.b_manc_6_a_ai_point
	union 
	select * from public.b_manc_6_a_aj_point
	union 
	select * from public.b_manc_6_a_ak_point
) 

create table manc_merge_line6 as (
    select * from public.b_manc_6_a_ab_line
    union 
	select * from public.b_manc_6_a_ac_line
	union 
	select * from public.b_manc_6_a_ad_line
	union 
	select * from public.b_manc_6_a_ae_line
	union 
	select * from public.b_manc_6_a_af_line
	union 
	select * from public.b_manc_6_a_ag_line
	union 
	select * from public.b_manc_6_a_ah_line
	union 
	select * from public.b_manc_6_a_ai_line
	union 
	select * from public.b_manc_6_a_aj_line
	union 
	select * from public.b_manc_6_a_ak_line
) 

create table manc_merge_polygon6 as (
    select * from public.b_manc_6_a_ab_polygon
    union 
	select * from public.b_manc_6_a_ac_polygon
	union 
	select * from public.b_manc_6_a_ad_polygon
	union 
	select * from public.b_manc_6_a_ae_polygon
	union 
	select * from public.b_manc_6_a_af_polygon
	union 
	select * from public.b_manc_6_a_ag_polygon
	union 
	select * from public.b_manc_6_a_ah_polygon
	union 
	select * from public.b_manc_6_a_ai_polygon
	union 
	select * from public.b_manc_6_a_aj_polygon
	union 
	select * from public.b_manc_6_a_ak_polygon
)

--final merge of the tables together
create table manchester_point_merge as (
select * from public.manc_merge_point1
union
select * from public.manc_merge_point2
union
select * from public.manc_merge_point3
union
select * from public.manc_merge_point4
union
select * from public.britain_manc5_point
union
select * from public.manc_merge_point6
)

create table manchester_line_merge as (
select * from public.manc_merge_line1
union
select * from public.manc_merge_line2
union
select * from public.manc_merge_line3
union
select * from public.manc_merge_line4
union
select * from public.britain_manc5_line
union
select * from public.manc_merge_line6
)

create table manchester_polygon_merge as (
select * from public.manc_merge_polygon1
union
select * from public.manc_merge_polygon2
union
select * from public.manc_merge_polygon3
union
select * from public.manc_merge_polygon4
union
select * from public.britain_manc5_polygon
union
select * from public.manc_merge_polygon6
)

/* 
The following scripts were run, then the created tables
were exported to csv using the export functionality in PGADMIN4 */


/* 
The following scripts were run, then the created tables
were exported to csv using the export functionality in PGADMIN4 */

--find total number of imports per uid
create table m_count_total_point as (
SELECT osm_uid, count(*) from public.manchester_point_merge
group by osm_uid
order by osm_uid
	)

--find the total number of imports that are within the simplified geometry area per uid
create table m_count_within_point as (
SELECT osm_uid, count(*) from public.manchester_point_merge
where ST_Within(way,
ST_GEOMFROMTEXT('Polygon((
-228179.551231 7110434.74344,-225212.164296 7097981.79734,-212413.10538 7083167.22631,-213788.408051 7077841.87449,-219282.32387 7076831.93647,-220864.346792 7067679.54684, -225510.123399 7063328.71489,-221621.852233 7060121.27732,-222992.858396 7054731.19166,-229717.204361 7049393.8512,-237954.213508 7051182.50155,-239639.81126 7043813.00076, -244092.889153 7045836.89673,-243955.910412 7048723.73203,-251027.055911 7049945.17873,-256025.554547 7046111.49718,-259539.305856 7050843.70923,-275097.028992 7055923.7985, -272479.603015 7061596.82446,-277735.373523 7072410.82643,-283971.511355 7069963.69529,-286686.129165 7065890.19309,-290999.866376 7069211.53522,-290626.667368 7072450.63383, -303055.710281 7077920.96614,-300877.265651 7087715.23793,-302548.243063 7090239.42785,-299218.124467 7095526.68312,-293125.953406 7096273.35999,-291823.332845 7093513.41233, -288716.560473 7096726.53899,-286380.527702 7093647.99211,-279401.95915 7099785.11581,-273133.928063 7098726.51371,-271319.24569 7103362.06304,-269858.047311 7099575.33817, -267142.686387 7099335.0392,-263704.530048 7100636.95097,-263805.49548 7107313.63135,-257740.269811 7105041.38174,-255760.167583 7107241.478,-252142.564451 7097446.38831, -252521.552996 7103363.53606,-249849.126123 7106644.12987,-246714.998671 7107670.37243,-241857.480854 7102097.78051,-238967.246024 7110118.91119,-236600.418129 7109665.9215, -232818.19663 7107891.74714,-228179.551231 7110434.74344))', 3857)) 
group by osm_uid
order by osm_uid
)
	
--find total number of imports per uid
create table m_count_total_line as (
SELECT osm_uid, count(*) from public.manchester_line_merge
group by osm_uid
order by osm_uid
	)

--find the total number of imports that are within the simplified geometry area per uid
create table m_count_within_line as (
SELECT osm_uid, count(*) from public.manchester_line_merge
where ST_Within(way,
ST_GEOMFROMTEXT('Polygon((
-228179.551231 7110434.74344,-225212.164296 7097981.79734,-212413.10538 7083167.22631,-213788.408051 7077841.87449,-219282.32387 7076831.93647,-220864.346792 7067679.54684, -225510.123399 7063328.71489,-221621.852233 7060121.27732,-222992.858396 7054731.19166,-229717.204361 7049393.8512,-237954.213508 7051182.50155,-239639.81126 7043813.00076, -244092.889153 7045836.89673,-243955.910412 7048723.73203,-251027.055911 7049945.17873,-256025.554547 7046111.49718,-259539.305856 7050843.70923,-275097.028992 7055923.7985, -272479.603015 7061596.82446,-277735.373523 7072410.82643,-283971.511355 7069963.69529,-286686.129165 7065890.19309,-290999.866376 7069211.53522,-290626.667368 7072450.63383, -303055.710281 7077920.96614,-300877.265651 7087715.23793,-302548.243063 7090239.42785,-299218.124467 7095526.68312,-293125.953406 7096273.35999,-291823.332845 7093513.41233, -288716.560473 7096726.53899,-286380.527702 7093647.99211,-279401.95915 7099785.11581,-273133.928063 7098726.51371,-271319.24569 7103362.06304,-269858.047311 7099575.33817, -267142.686387 7099335.0392,-263704.530048 7100636.95097,-263805.49548 7107313.63135,-257740.269811 7105041.38174,-255760.167583 7107241.478,-252142.564451 7097446.38831, -252521.552996 7103363.53606,-249849.126123 7106644.12987,-246714.998671 7107670.37243,-241857.480854 7102097.78051,-238967.246024 7110118.91119,-236600.418129 7109665.9215, -232818.19663 7107891.74714,-228179.551231 7110434.74344))', 3857))
group by osm_uid
order by osm_uid
	)

--find total number of imports per uid
create table m_count_total_poly as (
SELECT osm_uid, count(*) from public.manchester_polygon_merge
group by osm_uid
order by osm_uid
	)

--find the total number of imports that are within the simplified geometry area per uid
create table m_count_within_poly as (
SELECT osm_uid, count(*) from public.manchester_polygon_merge
where ST_Within(way,
ST_GEOMFROMTEXT('Polygon((
-228179.551231 7110434.74344,-225212.164296 7097981.79734,-212413.10538 7083167.22631,-213788.408051 7077841.87449,-219282.32387 7076831.93647,-220864.346792 7067679.54684, -225510.123399 7063328.71489,-221621.852233 7060121.27732,-222992.858396 7054731.19166,-229717.204361 7049393.8512,-237954.213508 7051182.50155,-239639.81126 7043813.00076, -244092.889153 7045836.89673,-243955.910412 7048723.73203,-251027.055911 7049945.17873,-256025.554547 7046111.49718,-259539.305856 7050843.70923,-275097.028992 7055923.7985, -272479.603015 7061596.82446,-277735.373523 7072410.82643,-283971.511355 7069963.69529,-286686.129165 7065890.19309,-290999.866376 7069211.53522,-290626.667368 7072450.63383, -303055.710281 7077920.96614,-300877.265651 7087715.23793,-302548.243063 7090239.42785,-299218.124467 7095526.68312,-293125.953406 7096273.35999,-291823.332845 7093513.41233, -288716.560473 7096726.53899,-286380.527702 7093647.99211,-279401.95915 7099785.11581,-273133.928063 7098726.51371,-271319.24569 7103362.06304,-269858.047311 7099575.33817, -267142.686387 7099335.0392,-263704.530048 7100636.95097,-263805.49548 7107313.63135,-257740.269811 7105041.38174,-255760.167583 7107241.478,-252142.564451 7097446.38831, -252521.552996 7103363.53606,-249849.126123 7106644.12987,-246714.998671 7107670.37243,-241857.480854 7102097.78051,-238967.246024 7110118.91119,-236600.418129 7109665.9215, -232818.19663 7107891.74714,-228179.551231 7110434.74344))', 3857))
group by osm_uid
order by osm_uid
)	
 
	
/*
The exported csv files were then imported into R studio for further analysis.
This includes determining which users have >=70% of their edits (from the entire country) within the case study area.
This forms the methodology for ensuring only the edits of local people are considered.
The below scripts for filtering by osm_uid are the result of this R analysis. (868 users qualified
*/

create table manchester_final_point as (select * from public.manchester_point_no_bulk where osm_uid = '1004044' or osm_uid = '101150' or osm_uid = '102179' or osm_uid = '102218' or osm_uid = '103272' or osm_uid = '103913' or osm_uid = '103965' or osm_uid = '104094' or osm_uid = '1195315' or osm_uid = '1196179' or osm_uid = '1197753' or osm_uid = '1199559' or osm_uid = '1201958' or osm_uid = '1203156' or osm_uid = '1214104' or osm_uid = '1214354' or osm_uid = '1218812' or osm_uid = '1222685' or osm_uid = '1223572' or osm_uid = '1223707' or osm_uid = '1223734' or osm_uid = '1236976' or osm_uid = '1238559' or osm_uid = '124714' or osm_uid = '1263066' or osm_uid = '1269743' or osm_uid = '127689' or osm_uid = '1278962' or osm_uid = '1290642' or osm_uid = '1304456' or osm_uid = '1313226' or osm_uid = '1316995' or osm_uid = '1326809' or osm_uid = '133524' or osm_uid = '1343344' or osm_uid = '134405' or osm_uid = '1352470' or osm_uid = '135451' or osm_uid = '1373362' or osm_uid = '1403800' or osm_uid = '1405378' or osm_uid = '1407799' or osm_uid = '1418828' or osm_uid = '1429431' or osm_uid = '1429910' or osm_uid = '1430086' or osm_uid = '143992' or osm_uid = '145573' or osm_uid = '146135' or osm_uid = '1467389' or osm_uid = '1476041' or osm_uid = '148524' or osm_uid = '1511813' or osm_uid = '151253' or osm_uid = '151510' or osm_uid = '1520385' or osm_uid = '1531205' or osm_uid = '154012' or osm_uid = '1556311' or osm_uid = '1557003' or osm_uid = '156199' or osm_uid = '157507' or osm_uid = '1607' or osm_uid = '16180' or osm_uid = '163399' or osm_uid = '1638032' or osm_uid = '1639428' or osm_uid = '164300' or osm_uid = '1660537' or osm_uid = '166103' or osm_uid = '1662957' or osm_uid = '1665677' or osm_uid = '1668446' or osm_uid = '167795' or osm_uid = '16821' or osm_uid = '1683417' or osm_uid = '168700' or osm_uid = '169215' or osm_uid = '169229' or osm_uid = '169569' or osm_uid = '1700709' or osm_uid = '1704593' or osm_uid = '1706673' or osm_uid = '1707383' or osm_uid = '1716089' or osm_uid = '1718823' or osm_uid = '172353' or osm_uid = '1723873' or osm_uid = '173261' or osm_uid = '173614' or osm_uid = '1742769' or osm_uid = '1743054' or osm_uid = '1744028' or osm_uid = '1753294' or osm_uid = '178560' or osm_uid = '1790891' or osm_uid = '179103' or osm_uid = '1791547' or osm_uid = '1800249' or osm_uid = '1801024' or osm_uid = '1804760' or osm_uid = '1807339' or osm_uid = '1807469' or osm_uid = '1807538' or osm_uid = '18087' or osm_uid = '1816152' or osm_uid = '1817182' or osm_uid = '1818794' or osm_uid = '1819965' or osm_uid = '1821747' or osm_uid = '1822230' or osm_uid = '1822315' or osm_uid = '182506' or osm_uid = '1836312' or osm_uid = '1836349' or osm_uid = '184757' or osm_uid = '18480' or osm_uid = '1849977' or osm_uid = '18568' or osm_uid = '1860449' or osm_uid = '18623' or osm_uid = '1862816' or osm_uid = '1870664' or osm_uid = '1872877' or osm_uid = '1877416' or osm_uid = '1878245' or osm_uid = '1882113' or osm_uid = '1882123' or osm_uid = '1882442' or osm_uid = '1882489' or osm_uid = '1882575' or osm_uid = '1883368' or osm_uid = '1883529' or osm_uid = '1884973' or osm_uid = '1885873' or osm_uid = '1897731' or osm_uid = '191399' or osm_uid = '1914846' or osm_uid = '1918174' or osm_uid = '1924133' or osm_uid = '1928051' or osm_uid = '193653' or osm_uid = '19472' or osm_uid = '1951050' or osm_uid = '1953652' or osm_uid = '1958914' or osm_uid = '1960741' or osm_uid = '1963358' or osm_uid = '1967789' or osm_uid = '1969477' or osm_uid = '1976449' or osm_uid = '1976630' or osm_uid = '1977070' or osm_uid = '1979041' or osm_uid = '1979485' or osm_uid = '1981160' or osm_uid = '198183' or osm_uid = '19834' or osm_uid = '1989751' or osm_uid = '19901' or osm_uid = '199545' or osm_uid = '1997480' or osm_uid = '2005288' or osm_uid = '2015287' or osm_uid = '2020865' or osm_uid = '2025986' or osm_uid = '2030616' or osm_uid = '2039391' or osm_uid = '204152' or osm_uid = '2044070' or osm_uid = '2045215' or osm_uid = '2046847' or osm_uid = '2048358' or osm_uid = '2050359' or osm_uid = '205740' or osm_uid = '2062042' or osm_uid = '2062939' or osm_uid = '2064718' or osm_uid = '2073294' or osm_uid = '2073414' or osm_uid = '2084381' or osm_uid = '2088016' or osm_uid = '20898' or osm_uid = '2102213' or osm_uid = '2111379' or osm_uid = '2114823' or osm_uid = '211575' or osm_uid = '2121101' or osm_uid = '21235' or osm_uid = '213893' or osm_uid = '214152' or osm_uid = '2142086' or osm_uid = '214846' or osm_uid = '215123' or osm_uid = '215239' or osm_uid = '2166986' or osm_uid = '2201587' or osm_uid = '224936' or osm_uid = '2263619' or osm_uid = '2294177' or osm_uid = '2298114' or osm_uid = '230287' or osm_uid = '231240' or osm_uid = '2315642' or osm_uid = '2324248' or osm_uid = '2328006' or osm_uid = '233890' or osm_uid = '2339960' or osm_uid = '2340855' or osm_uid = '234692' or osm_uid = '2355' or osm_uid = '2369313' or osm_uid = '237302' or osm_uid = '237777' or osm_uid = '2380808' or osm_uid = '238520' or osm_uid = '2388323' or osm_uid = '2393820' or osm_uid = '2397352' or osm_uid = '24019' or osm_uid = '2402' or osm_uid = '2403806' or osm_uid = '2408199' or osm_uid = '2411548' or osm_uid = '24116' or osm_uid = '2433431' or osm_uid = '2443879' or osm_uid = '2444139' or osm_uid = '2445549' or osm_uid = '2452904' or osm_uid = '2457499' or osm_uid = '2470627' or osm_uid = '2471749' or osm_uid = '2484422' or osm_uid = '2488986' or osm_uid = '250450' or osm_uid = '250649' or osm_uid = '251482' or osm_uid = '2521908' or osm_uid = '2535601' or osm_uid = '2544444' or osm_uid = '2551280' or osm_uid = '2562316' or osm_uid = '256394' or osm_uid = '256872' or osm_uid = '2569360' or osm_uid = '257421' or osm_uid = '2585346' or osm_uid = '2595133' or osm_uid = '2596250' or osm_uid = '2606406' or osm_uid = '2608802' or osm_uid = '263593' or osm_uid = '2636765' or osm_uid = '2641285' or osm_uid = '2652008' or osm_uid = '2677117' or osm_uid = '2680020' or osm_uid = '2680204' or osm_uid = '2689100' or osm_uid = '2699546' or osm_uid = '270456' or osm_uid = '2719086' or osm_uid = '273178' or osm_uid = '273963' or osm_uid = '27426' or osm_uid = '2748122' or osm_uid = '275365' or osm_uid = '276140' or osm_uid = '2764121' or osm_uid = '2773877' or osm_uid = '2780528' or osm_uid = '2783885' or osm_uid = '2788773' or osm_uid = '2791697' or osm_uid = '2799163' or osm_uid = '2800377' or osm_uid = '2810211' or osm_uid = '282798' or osm_uid = '2845963' or osm_uid = '2850658' or osm_uid = '2854457' or osm_uid = '286814' or osm_uid = '2868873' or osm_uid = '2874110' or osm_uid = '2883761' or osm_uid = '289311' or osm_uid = '2900364' or osm_uid = '2905735' or osm_uid = '2907731' or osm_uid = '2926' or osm_uid = '2928071' or osm_uid = '2946015' or osm_uid = '2956856' or osm_uid = '296177' or osm_uid = '296597' or osm_uid = '297420' or osm_uid = '298394' or osm_uid = '299891' or osm_uid = '3028632' or osm_uid = '3030981' or osm_uid = '305459' or osm_uid = '3067760' or osm_uid = '308558' or osm_uid = '309601' or osm_uid = '309618' or osm_uid = '310680' or osm_uid = '311271' or osm_uid = '3113780' or osm_uid = '3125624' or osm_uid = '3127176' or osm_uid = '3139656' or osm_uid = '3140408' or osm_uid = '314721' or osm_uid = '3161459' or osm_uid = '317039' or osm_uid = '317060' or osm_uid = '3184503' or osm_uid = '319081' or osm_uid = '3200104' or osm_uid = '3203267' or osm_uid = '32154' or osm_uid = '322127' or osm_uid = '322503' or osm_uid = '322717' or osm_uid = '325611' or osm_uid = '3293862' or osm_uid = '329608' or osm_uid = '3298838' or osm_uid = '33103' or osm_uid = '3333912' or osm_uid = '3338661' or osm_uid = '3342801' or osm_uid = '3349252' or osm_uid = '3358825' or osm_uid = '336327' or osm_uid = '33647' or osm_uid = '3382053' or osm_uid = '3384121' or osm_uid = '3438084' or osm_uid = '3440603' or osm_uid = '3440839' or osm_uid = '3442459' or osm_uid = '3444615' or osm_uid = '3448456' or osm_uid = '3451745' or osm_uid = '345507' or osm_uid = '345640' or osm_uid = '347347' or osm_uid = '347433' or osm_uid = '3476663' or osm_uid = '348949' or osm_uid = '3492260' or osm_uid = '349367' or osm_uid = '3496835' or osm_uid = '3497617' or osm_uid = '3500699' or osm_uid = '350344' or osm_uid = '3541716' or osm_uid = '354406' or osm_uid = '3547560' or osm_uid = '3566984' or osm_uid = '35699' or osm_uid = '3582374' or osm_uid = '358953' or osm_uid = '360873' or osm_uid = '3630915' or osm_uid = '363573' or osm_uid = '363967' or osm_uid = '364088' or osm_uid = '364520' or osm_uid = '3655306' or osm_uid = '365966' or osm_uid = '3662256' or osm_uid = '3674371' or osm_uid = '3687268' or osm_uid = '3704406' or osm_uid = '371213' or osm_uid = '371370' or osm_uid = '3717833' or osm_uid = '3734077' or osm_uid = '373565' or osm_uid = '3738047' or osm_uid = '3748375' or osm_uid = '37496' or osm_uid = '3777514' or osm_uid = '37798' or osm_uid = '3783186' or osm_uid = '3785466' or osm_uid = '380333' or osm_uid = '3806735' or osm_uid = '381997' or osm_uid = '3822092' or osm_uid = '3826407' or osm_uid = '3828331' or osm_uid = '3837268' or osm_uid = '384296' or osm_uid = '385581' or osm_uid = '385627' or osm_uid = '386089' or osm_uid = '386125' or osm_uid = '387225' or osm_uid = '388496' or osm_uid = '38903' or osm_uid = '3896924' or osm_uid = '38985' or osm_uid = '3900861' or osm_uid = '3905794' or osm_uid = '3918144' or osm_uid = '3925656' or osm_uid = '3932273' or osm_uid = '395076' or osm_uid = '3959663' or osm_uid = '396987' or osm_uid = '397468' or osm_uid = '397491' or osm_uid = '399008' or osm_uid = '3992054' or osm_uid = '4017082' or osm_uid = '4026873' or osm_uid = '403518' or osm_uid = '4039728' or osm_uid = '404175' or osm_uid = '405080' or osm_uid = '4068656' or osm_uid = '4070455' or osm_uid = '4070822' or osm_uid = '407299' or osm_uid = '4075809' or osm_uid = '4078654' or osm_uid = '4079629' or osm_uid = '4096811' or osm_uid = '410313' or osm_uid = '4109876' or osm_uid = '4114163' or osm_uid = '411497' or osm_uid = '411634' or osm_uid = '412804' or osm_uid = '413286' or osm_uid = '41368' or osm_uid = '416166' or osm_uid = '4172827' or osm_uid = '4191525' or osm_uid = '4212624' or osm_uid = '4242208' or osm_uid = '424779' or osm_uid = '42680' or osm_uid = '428524' or osm_uid = '428545' or osm_uid = '4291619' or osm_uid = '430743' or osm_uid = '4316207' or osm_uid = '4317048' or osm_uid = '431837' or osm_uid = '4323399' or osm_uid = '432382' or osm_uid = '4337284' or osm_uid = '4359567' or osm_uid = '439645' or osm_uid = '4409551' or osm_uid = '4415367' or osm_uid = '4458716' or osm_uid = '4479998' or osm_uid = '4497001' or osm_uid = '4509274' or osm_uid = '4531208' or osm_uid = '4541812' or osm_uid = '454759' or osm_uid = '455164' or osm_uid = '456013' or osm_uid = '457818' or osm_uid = '458075' or osm_uid = '4587125' or osm_uid = '459239' or osm_uid = '4598206' or osm_uid = '45985' or osm_uid = '4607797' or osm_uid = '4618362' or osm_uid = '4626625' or osm_uid = '46623' or osm_uid = '4664716' or osm_uid = '466627' or osm_uid = '4667746' or osm_uid = '4683111' or osm_uid = '4689463' or osm_uid = '46926' or osm_uid = '4694' or osm_uid = '4714783' or osm_uid = '4737998' or osm_uid = '4742920' or osm_uid = '475106' or osm_uid = '475800' or osm_uid = '477289' or osm_uid = '477427' or osm_uid = '479574' or osm_uid = '4817367' or osm_uid = '4820878' or osm_uid = '482491' or osm_uid = '4841912' or osm_uid = '4860523' or osm_uid = '4870999' or osm_uid = '4892183' or osm_uid = '489324' or osm_uid = '4902241' or osm_uid = '490500' or osm_uid = '4949658' or osm_uid = '4960446' or osm_uid = '4967947' or osm_uid = '499672' or osm_uid = '5006531' or osm_uid = '500789' or osm_uid = '5007892' or osm_uid = '5008160' or osm_uid = '501118' or osm_uid = '5011295' or osm_uid = '5011732' or osm_uid = '5020122' or osm_uid = '502174' or osm_uid = '502525' or osm_uid = '5034114' or osm_uid = '5049586' or osm_uid = '5050518' or osm_uid = '5066150' or osm_uid = '507228' or osm_uid = '5103217' or osm_uid = '5111492' or osm_uid = '5113658' or osm_uid = '511782' or osm_uid = '5138029' or osm_uid = '5138852' or osm_uid = '5141635' or osm_uid = '514683' or osm_uid = '5171316' or osm_uid = '5179581' or osm_uid = '5181642' or osm_uid = '5185271' or osm_uid = '5188437' or osm_uid = '5192500' or osm_uid = '5196346' or osm_uid = '5198003' or osm_uid = '5200534' or osm_uid = '5201425' or osm_uid = '5201871' or osm_uid = '5201891' or osm_uid = '5202263' or osm_uid = '5202420' or osm_uid = '5202693' or osm_uid = '5202757' or osm_uid = '5203303' or osm_uid = '520488' or osm_uid = '5206390' or osm_uid = '5206448' or osm_uid = '5207495' or osm_uid = '5208248' or osm_uid = '5209800' or osm_uid = '521378' or osm_uid = '521954' or osm_uid = '5230057' or osm_uid = '523764' or osm_uid = '5243311' or osm_uid = '524468' or osm_uid = '5263943' or osm_uid = '5265183' or osm_uid = '5278660' or osm_uid = '5283320' or osm_uid = '529040' or osm_uid = '5295262' or osm_uid = '5307733' or osm_uid = '53300' or osm_uid = '5338836' or osm_uid = '5340439' or osm_uid = '534214' or osm_uid = '5348299' or osm_uid = '5353863' or osm_uid = '536623' or osm_uid = '5366536' or osm_uid = '537646' or osm_uid = '538831' or osm_uid = '5407518' or osm_uid = '5413963' or osm_uid = '54552' or osm_uid = '5457374' or osm_uid = '54594' or osm_uid = '5459879' or osm_uid = '5478844' or osm_uid = '550860' or osm_uid = '552197' or osm_uid = '5522575' or osm_uid = '5523697' or osm_uid = '55606' or osm_uid = '5565937' or osm_uid = '5586553' or osm_uid = '559157' or osm_uid = '559546' or osm_uid = '56277' or osm_uid = '563041' or osm_uid = '5633277' or osm_uid = '563462' or osm_uid = '5652397' or osm_uid = '5653973' or osm_uid = '565589' or osm_uid = '5656' or osm_uid = '5658027' or osm_uid = '5666137' or osm_uid = '5667707' or osm_uid = '5671811' or osm_uid = '5681163' or osm_uid = '568581' or osm_uid = '5686537' or osm_uid = '5701832' or osm_uid = '570650' or osm_uid = '5707611' or osm_uid = '5708649' or osm_uid = '570866' or osm_uid = '572200' or osm_uid = '572234' or osm_uid = '5742031' or osm_uid = '5751228' or osm_uid = '575573' or osm_uid = '5760' or osm_uid = '5765086' or osm_uid = '581181' or osm_uid = '581228' or osm_uid = '581746' or osm_uid = '582637' or osm_uid = '5854449' or osm_uid = '5864559' or osm_uid = '587343' or osm_uid = '587497' or osm_uid = '590140' or osm_uid = '591711' or osm_uid = '594980' or osm_uid = '598343' or osm_uid = '5996224' or osm_uid = '60178' or osm_uid = '6019200' or osm_uid = '602230' or osm_uid = '6049655' or osm_uid = '605664' or osm_uid = '6065909' or osm_uid = '607240' or osm_uid = '607440' or osm_uid = '608484' or osm_uid = '610772' or osm_uid = '6112529' or osm_uid = '611983' or osm_uid = '6126274' or osm_uid = '612895' or osm_uid = '6130502' or osm_uid = '613493' or osm_uid = '614067' or osm_uid = '6168330' or osm_uid = '61747' or osm_uid = '6175387' or osm_uid = '61809' or osm_uid = '620115' or osm_uid = '62013' or osm_uid = '620992' or osm_uid = '621115' or osm_uid = '6211955' or osm_uid = '621345' or osm_uid = '6213791' or osm_uid = '6226844' or osm_uid = '6237710' or osm_uid = '6245429' or osm_uid = '624588' or osm_uid = '6248313' or osm_uid = '624955' or osm_uid = '6255985' or osm_uid = '626954' or osm_uid = '62878' or osm_uid = '6293186' or osm_uid = '630267' or osm_uid = '63031' or osm_uid = '630535' or osm_uid = '631986' or osm_uid = '63340' or osm_uid = '636406' or osm_uid = '6379503' or osm_uid = '6397757' or osm_uid = '642638' or osm_uid = '645297' or osm_uid = '646152' or osm_uid = '648778' or osm_uid = '6492562' or osm_uid = '6505567' or osm_uid = '6513527' or osm_uid = '6519570' or osm_uid = '651969' or osm_uid = '652095' or osm_uid = '654350' or osm_uid = '654937' or osm_uid = '6555121' or osm_uid = '6586841' or osm_uid = '6653025' or osm_uid = '6653655' or osm_uid = '6700174' or osm_uid = '670432' or osm_uid = '672490' or osm_uid = '673026' or osm_uid = '6735880' or osm_uid = '673686' or osm_uid = '6755640' or osm_uid = '6765114' or osm_uid = '6780544' or osm_uid = '67832' or osm_uid = '6787565' or osm_uid = '679056' or osm_uid = '6797242' or osm_uid = '679794' or osm_uid = '680571' or osm_uid = '6805933' or osm_uid = '681381' or osm_uid = '6829111' or osm_uid = '685228' or osm_uid = '6865755' or osm_uid = '68873' or osm_uid = '693162' or osm_uid = '69418' or osm_uid = '6965258' or osm_uid = '699465' or osm_uid = '7001068' or osm_uid = '7001228' or osm_uid = '700170' or osm_uid = '701357' or osm_uid = '701616' or osm_uid = '702201' or osm_uid = '7037837' or osm_uid = '7051387' or osm_uid = '709568' or osm_uid = '710580' or osm_uid = '7117410' or osm_uid = '7118503' or osm_uid = '7125232' or osm_uid = '7135061' or osm_uid = '7136206' or osm_uid = '713653' or osm_uid = '713669' or osm_uid = '7140286' or osm_uid = '7142286' or osm_uid = '7160' or osm_uid = '7163579' or osm_uid = '71640' or osm_uid = '7165481' or osm_uid = '7178464' or osm_uid = '719181' or osm_uid = '7206855' or osm_uid = '7230529' or osm_uid = '72472' or osm_uid = '7299506' or osm_uid = '731617' or osm_uid = '73314' or osm_uid = '7350445' or osm_uid = '7404582' or osm_uid = '7420616' or osm_uid = '7452033' or osm_uid = '7459041' or osm_uid = '7463456' or osm_uid = '7470399' or osm_uid = '7473263' or osm_uid = '7491818' or osm_uid = '7505713' or osm_uid = '7522935' or osm_uid = '7526422' or osm_uid = '75315' or osm_uid = '7552692' or osm_uid = '7558739' or osm_uid = '7566700' or osm_uid = '7585088' or osm_uid = '7590348' or osm_uid = '7591844' or osm_uid = '75936' or osm_uid = '7644726' or osm_uid = '7645173' or osm_uid = '7662310' or osm_uid = '76678' or osm_uid = '7674414' or osm_uid = '7675673' or osm_uid = '7694099' or osm_uid = '77323' or osm_uid = '7739498' or osm_uid = '7767083' or osm_uid = '777434' or osm_uid = '7786310' or osm_uid = '782982' or osm_uid = '7850888' or osm_uid = '78863' or osm_uid = '790192' or osm_uid = '7949410' or osm_uid = '7959422' or osm_uid = '8024383' or osm_uid = '8076256' or osm_uid = '8078403' or osm_uid = '8124742' or osm_uid = '8125605' or osm_uid = '8183672' or osm_uid = '8213968' or osm_uid = '82164' or osm_uid = '8224003' or osm_uid = '8244365' or osm_uid = '8244812' or osm_uid = '8244821' or osm_uid = '8245566' or osm_uid = '8257375' or osm_uid = '8276520' or osm_uid = '8291531' or osm_uid = '8294164' or osm_uid = '83024' or osm_uid = '8311123' or osm_uid = '8324803' or osm_uid = '8339894' or osm_uid = '834411' or osm_uid = '8344547' or osm_uid = '8345830' or osm_uid = '8345931' or osm_uid = '8358968' or osm_uid = '8365476' or osm_uid = '837005' or osm_uid = '8373687' or osm_uid = '8376894' or osm_uid = '839345' or osm_uid = '8399506' or osm_uid = '8404294' or osm_uid = '8404734' or osm_uid = '8404848' or osm_uid = '8417514' or osm_uid = '842068' or osm_uid = '8423831' or osm_uid = '8432495' or osm_uid = '8432550' or osm_uid = '8468443' or osm_uid = '84777' or osm_uid = '8486599' or osm_uid = '8494347' or osm_uid = '8494394' or osm_uid = '8498246' or osm_uid = '85635' or osm_uid = '87428' or osm_uid = '87781' or osm_uid = '900157' or osm_uid = '901366' or osm_uid = '90283' or osm_uid = '911036' or osm_uid = '917581' or osm_uid = '923101' or osm_uid = '92655' or osm_uid = '92878' or osm_uid = '94085' or osm_uid = '94278' or osm_uid = '943860' or osm_uid = '96060' or osm_uid = '965935' or osm_uid = '971034' or osm_uid = '971299' or osm_uid = '971759' or osm_uid = '972111' or osm_uid = '972521' or osm_uid = '973860' or osm_uid = '974258' or osm_uid = '974820' or osm_uid = '976991' or osm_uid = '98712' or osm_uid = '98807' or osm_uid = '98964' or osm_uid = '989915' or osm_uid = '990288' or osm_uid = '99620' or osm_uid = '997917')

create table manchester_final_line as (select * from public.manchester_line_no_bulk where osm_uid = '1004044' or osm_uid = '101150' or osm_uid = '102179' or osm_uid = '102218' or osm_uid = '103272' or osm_uid = '103913' or osm_uid = '103965' or osm_uid = '104094' or osm_uid = '1195315' or osm_uid = '1196179' or osm_uid = '1197753' or osm_uid = '1199559' or osm_uid = '1201958' or osm_uid = '1203156' or osm_uid = '1214104' or osm_uid = '1214354' or osm_uid = '1218812' or osm_uid = '1222685' or osm_uid = '1223572' or osm_uid = '1223707' or osm_uid = '1223734' or osm_uid = '1236976' or osm_uid = '1238559' or osm_uid = '124714' or osm_uid = '1263066' or osm_uid = '1269743' or osm_uid = '127689' or osm_uid = '1278962' or osm_uid = '1290642' or osm_uid = '1304456' or osm_uid = '1313226' or osm_uid = '1316995' or osm_uid = '1326809' or osm_uid = '133524' or osm_uid = '1343344' or osm_uid = '134405' or osm_uid = '1352470' or osm_uid = '135451' or osm_uid = '1373362' or osm_uid = '1403800' or osm_uid = '1405378' or osm_uid = '1407799' or osm_uid = '1418828' or osm_uid = '1429431' or osm_uid = '1429910' or osm_uid = '1430086' or osm_uid = '143992' or osm_uid = '145573' or osm_uid = '146135' or osm_uid = '1467389' or osm_uid = '1476041' or osm_uid = '148524' or osm_uid = '1511813' or osm_uid = '151253' or osm_uid = '151510' or osm_uid = '1520385' or osm_uid = '1531205' or osm_uid = '154012' or osm_uid = '1556311' or osm_uid = '1557003' or osm_uid = '156199' or osm_uid = '157507' or osm_uid = '1607' or osm_uid = '16180' or osm_uid = '163399' or osm_uid = '1638032' or osm_uid = '1639428' or osm_uid = '164300' or osm_uid = '1660537' or osm_uid = '166103' or osm_uid = '1662957' or osm_uid = '1665677' or osm_uid = '1668446' or osm_uid = '167795' or osm_uid = '16821' or osm_uid = '1683417' or osm_uid = '168700' or osm_uid = '169215' or osm_uid = '169229' or osm_uid = '169569' or osm_uid = '1700709' or osm_uid = '1704593' or osm_uid = '1706673' or osm_uid = '1707383' or osm_uid = '1716089' or osm_uid = '1718823' or osm_uid = '172353' or osm_uid = '1723873' or osm_uid = '173261' or osm_uid = '173614' or osm_uid = '1742769' or osm_uid = '1743054' or osm_uid = '1744028' or osm_uid = '1753294' or osm_uid = '178560' or osm_uid = '1790891' or osm_uid = '179103' or osm_uid = '1791547' or osm_uid = '1800249' or osm_uid = '1801024' or osm_uid = '1804760' or osm_uid = '1807339' or osm_uid = '1807469' or osm_uid = '1807538' or osm_uid = '18087' or osm_uid = '1816152' or osm_uid = '1817182' or osm_uid = '1818794' or osm_uid = '1819965' or osm_uid = '1821747' or osm_uid = '1822230' or osm_uid = '1822315' or osm_uid = '182506' or osm_uid = '1836312' or osm_uid = '1836349' or osm_uid = '184757' or osm_uid = '18480' or osm_uid = '1849977' or osm_uid = '18568' or osm_uid = '1860449' or osm_uid = '18623' or osm_uid = '1862816' or osm_uid = '1870664' or osm_uid = '1872877' or osm_uid = '1877416' or osm_uid = '1878245' or osm_uid = '1882113' or osm_uid = '1882123' or osm_uid = '1882442' or osm_uid = '1882489' or osm_uid = '1882575' or osm_uid = '1883368' or osm_uid = '1883529' or osm_uid = '1884973' or osm_uid = '1885873' or osm_uid = '1897731' or osm_uid = '191399' or osm_uid = '1914846' or osm_uid = '1918174' or osm_uid = '1924133' or osm_uid = '1928051' or osm_uid = '193653' or osm_uid = '19472' or osm_uid = '1951050' or osm_uid = '1953652' or osm_uid = '1958914' or osm_uid = '1960741' or osm_uid = '1963358' or osm_uid = '1967789' or osm_uid = '1969477' or osm_uid = '1976449' or osm_uid = '1976630' or osm_uid = '1977070' or osm_uid = '1979041' or osm_uid = '1979485' or osm_uid = '1981160' or osm_uid = '198183' or osm_uid = '19834' or osm_uid = '1989751' or osm_uid = '19901' or osm_uid = '199545' or osm_uid = '1997480' or osm_uid = '2005288' or osm_uid = '2015287' or osm_uid = '2020865' or osm_uid = '2025986' or osm_uid = '2030616' or osm_uid = '2039391' or osm_uid = '204152' or osm_uid = '2044070' or osm_uid = '2045215' or osm_uid = '2046847' or osm_uid = '2048358' or osm_uid = '2050359' or osm_uid = '205740' or osm_uid = '2062042' or osm_uid = '2062939' or osm_uid = '2064718' or osm_uid = '2073294' or osm_uid = '2073414' or osm_uid = '2084381' or osm_uid = '2088016' or osm_uid = '20898' or osm_uid = '2102213' or osm_uid = '2111379' or osm_uid = '2114823' or osm_uid = '211575' or osm_uid = '2121101' or osm_uid = '21235' or osm_uid = '213893' or osm_uid = '214152' or osm_uid = '2142086' or osm_uid = '214846' or osm_uid = '215123' or osm_uid = '215239' or osm_uid = '2166986' or osm_uid = '2201587' or osm_uid = '224936' or osm_uid = '2263619' or osm_uid = '2294177' or osm_uid = '2298114' or osm_uid = '230287' or osm_uid = '231240' or osm_uid = '2315642' or osm_uid = '2324248' or osm_uid = '2328006' or osm_uid = '233890' or osm_uid = '2339960' or osm_uid = '2340855' or osm_uid = '234692' or osm_uid = '2355' or osm_uid = '2369313' or osm_uid = '237302' or osm_uid = '237777' or osm_uid = '2380808' or osm_uid = '238520' or osm_uid = '2388323' or osm_uid = '2393820' or osm_uid = '2397352' or osm_uid = '24019' or osm_uid = '2402' or osm_uid = '2403806' or osm_uid = '2408199' or osm_uid = '2411548' or osm_uid = '24116' or osm_uid = '2433431' or osm_uid = '2443879' or osm_uid = '2444139' or osm_uid = '2445549' or osm_uid = '2452904' or osm_uid = '2457499' or osm_uid = '2470627' or osm_uid = '2471749' or osm_uid = '2484422' or osm_uid = '2488986' or osm_uid = '250450' or osm_uid = '250649' or osm_uid = '251482' or osm_uid = '2521908' or osm_uid = '2535601' or osm_uid = '2544444' or osm_uid = '2551280' or osm_uid = '2562316' or osm_uid = '256394' or osm_uid = '256872' or osm_uid = '2569360' or osm_uid = '257421' or osm_uid = '2585346' or osm_uid = '2595133' or osm_uid = '2596250' or osm_uid = '2606406' or osm_uid = '2608802' or osm_uid = '263593' or osm_uid = '2636765' or osm_uid = '2641285' or osm_uid = '2652008' or osm_uid = '2677117' or osm_uid = '2680020' or osm_uid = '2680204' or osm_uid = '2689100' or osm_uid = '2699546' or osm_uid = '270456' or osm_uid = '2719086' or osm_uid = '273178' or osm_uid = '273963' or osm_uid = '27426' or osm_uid = '2748122' or osm_uid = '275365' or osm_uid = '276140' or osm_uid = '2764121' or osm_uid = '2773877' or osm_uid = '2780528' or osm_uid = '2783885' or osm_uid = '2788773' or osm_uid = '2791697' or osm_uid = '2799163' or osm_uid = '2800377' or osm_uid = '2810211' or osm_uid = '282798' or osm_uid = '2845963' or osm_uid = '2850658' or osm_uid = '2854457' or osm_uid = '286814' or osm_uid = '2868873' or osm_uid = '2874110' or osm_uid = '2883761' or osm_uid = '289311' or osm_uid = '2900364' or osm_uid = '2905735' or osm_uid = '2907731' or osm_uid = '2926' or osm_uid = '2928071' or osm_uid = '2946015' or osm_uid = '2956856' or osm_uid = '296177' or osm_uid = '296597' or osm_uid = '297420' or osm_uid = '298394' or osm_uid = '299891' or osm_uid = '3028632' or osm_uid = '3030981' or osm_uid = '305459' or osm_uid = '3067760' or osm_uid = '308558' or osm_uid = '309601' or osm_uid = '309618' or osm_uid = '310680' or osm_uid = '311271' or osm_uid = '3113780' or osm_uid = '3125624' or osm_uid = '3127176' or osm_uid = '3139656' or osm_uid = '3140408' or osm_uid = '314721' or osm_uid = '3161459' or osm_uid = '317039' or osm_uid = '317060' or osm_uid = '3184503' or osm_uid = '319081' or osm_uid = '3200104' or osm_uid = '3203267' or osm_uid = '32154' or osm_uid = '322127' or osm_uid = '322503' or osm_uid = '322717' or osm_uid = '325611' or osm_uid = '3293862' or osm_uid = '329608' or osm_uid = '3298838' or osm_uid = '33103' or osm_uid = '3333912' or osm_uid = '3338661' or osm_uid = '3342801' or osm_uid = '3349252' or osm_uid = '3358825' or osm_uid = '336327' or osm_uid = '33647' or osm_uid = '3382053' or osm_uid = '3384121' or osm_uid = '3438084' or osm_uid = '3440603' or osm_uid = '3440839' or osm_uid = '3442459' or osm_uid = '3444615' or osm_uid = '3448456' or osm_uid = '3451745' or osm_uid = '345507' or osm_uid = '345640' or osm_uid = '347347' or osm_uid = '347433' or osm_uid = '3476663' or osm_uid = '348949' or osm_uid = '3492260' or osm_uid = '349367' or osm_uid = '3496835' or osm_uid = '3497617' or osm_uid = '3500699' or osm_uid = '350344' or osm_uid = '3541716' or osm_uid = '354406' or osm_uid = '3547560' or osm_uid = '3566984' or osm_uid = '35699' or osm_uid = '3582374' or osm_uid = '358953' or osm_uid = '360873' or osm_uid = '3630915' or osm_uid = '363573' or osm_uid = '363967' or osm_uid = '364088' or osm_uid = '364520' or osm_uid = '3655306' or osm_uid = '365966' or osm_uid = '3662256' or osm_uid = '3674371' or osm_uid = '3687268' or osm_uid = '3704406' or osm_uid = '371213' or osm_uid = '371370' or osm_uid = '3717833' or osm_uid = '3734077' or osm_uid = '373565' or osm_uid = '3738047' or osm_uid = '3748375' or osm_uid = '37496' or osm_uid = '3777514' or osm_uid = '37798' or osm_uid = '3783186' or osm_uid = '3785466' or osm_uid = '380333' or osm_uid = '3806735' or osm_uid = '381997' or osm_uid = '3822092' or osm_uid = '3826407' or osm_uid = '3828331' or osm_uid = '3837268' or osm_uid = '384296' or osm_uid = '385581' or osm_uid = '385627' or osm_uid = '386089' or osm_uid = '386125' or osm_uid = '387225' or osm_uid = '388496' or osm_uid = '38903' or osm_uid = '3896924' or osm_uid = '38985' or osm_uid = '3900861' or osm_uid = '3905794' or osm_uid = '3918144' or osm_uid = '3925656' or osm_uid = '3932273' or osm_uid = '395076' or osm_uid = '3959663' or osm_uid = '396987' or osm_uid = '397468' or osm_uid = '397491' or osm_uid = '399008' or osm_uid = '3992054' or osm_uid = '4017082' or osm_uid = '4026873' or osm_uid = '403518' or osm_uid = '4039728' or osm_uid = '404175' or osm_uid = '405080' or osm_uid = '4068656' or osm_uid = '4070455' or osm_uid = '4070822' or osm_uid = '407299' or osm_uid = '4075809' or osm_uid = '4078654' or osm_uid = '4079629' or osm_uid = '4096811' or osm_uid = '410313' or osm_uid = '4109876' or osm_uid = '4114163' or osm_uid = '411497' or osm_uid = '411634' or osm_uid = '412804' or osm_uid = '413286' or osm_uid = '41368' or osm_uid = '416166' or osm_uid = '4172827' or osm_uid = '4191525' or osm_uid = '4212624' or osm_uid = '4242208' or osm_uid = '424779' or osm_uid = '42680' or osm_uid = '428524' or osm_uid = '428545' or osm_uid = '4291619' or osm_uid = '430743' or osm_uid = '4316207' or osm_uid = '4317048' or osm_uid = '431837' or osm_uid = '4323399' or osm_uid = '432382' or osm_uid = '4337284' or osm_uid = '4359567' or osm_uid = '439645' or osm_uid = '4409551' or osm_uid = '4415367' or osm_uid = '4458716' or osm_uid = '4479998' or osm_uid = '4497001' or osm_uid = '4509274' or osm_uid = '4531208' or osm_uid = '4541812' or osm_uid = '454759' or osm_uid = '455164' or osm_uid = '456013' or osm_uid = '457818' or osm_uid = '458075' or osm_uid = '4587125' or osm_uid = '459239' or osm_uid = '4598206' or osm_uid = '45985' or osm_uid = '4607797' or osm_uid = '4618362' or osm_uid = '4626625' or osm_uid = '46623' or osm_uid = '4664716' or osm_uid = '466627' or osm_uid = '4667746' or osm_uid = '4683111' or osm_uid = '4689463' or osm_uid = '46926' or osm_uid = '4694' or osm_uid = '4714783' or osm_uid = '4737998' or osm_uid = '4742920' or osm_uid = '475106' or osm_uid = '475800' or osm_uid = '477289' or osm_uid = '477427' or osm_uid = '479574' or osm_uid = '4817367' or osm_uid = '4820878' or osm_uid = '482491' or osm_uid = '4841912' or osm_uid = '4860523' or osm_uid = '4870999' or osm_uid = '4892183' or osm_uid = '489324' or osm_uid = '4902241' or osm_uid = '490500' or osm_uid = '4949658' or osm_uid = '4960446' or osm_uid = '4967947' or osm_uid = '499672' or osm_uid = '5006531' or osm_uid = '500789' or osm_uid = '5007892' or osm_uid = '5008160' or osm_uid = '501118' or osm_uid = '5011295' or osm_uid = '5011732' or osm_uid = '5020122' or osm_uid = '502174' or osm_uid = '502525' or osm_uid = '5034114' or osm_uid = '5049586' or osm_uid = '5050518' or osm_uid = '5066150' or osm_uid = '507228' or osm_uid = '5103217' or osm_uid = '5111492' or osm_uid = '5113658' or osm_uid = '511782' or osm_uid = '5138029' or osm_uid = '5138852' or osm_uid = '5141635' or osm_uid = '514683' or osm_uid = '5171316' or osm_uid = '5179581' or osm_uid = '5181642' or osm_uid = '5185271' or osm_uid = '5188437' or osm_uid = '5192500' or osm_uid = '5196346' or osm_uid = '5198003' or osm_uid = '5200534' or osm_uid = '5201425' or osm_uid = '5201871' or osm_uid = '5201891' or osm_uid = '5202263' or osm_uid = '5202420' or osm_uid = '5202693' or osm_uid = '5202757' or osm_uid = '5203303' or osm_uid = '520488' or osm_uid = '5206390' or osm_uid = '5206448' or osm_uid = '5207495' or osm_uid = '5208248' or osm_uid = '5209800' or osm_uid = '521378' or osm_uid = '521954' or osm_uid = '5230057' or osm_uid = '523764' or osm_uid = '5243311' or osm_uid = '524468' or osm_uid = '5263943' or osm_uid = '5265183' or osm_uid = '5278660' or osm_uid = '5283320' or osm_uid = '529040' or osm_uid = '5295262' or osm_uid = '5307733' or osm_uid = '53300' or osm_uid = '5338836' or osm_uid = '5340439' or osm_uid = '534214' or osm_uid = '5348299' or osm_uid = '5353863' or osm_uid = '536623' or osm_uid = '5366536' or osm_uid = '537646' or osm_uid = '538831' or osm_uid = '5407518' or osm_uid = '5413963' or osm_uid = '54552' or osm_uid = '5457374' or osm_uid = '54594' or osm_uid = '5459879' or osm_uid = '5478844' or osm_uid = '550860' or osm_uid = '552197' or osm_uid = '5522575' or osm_uid = '5523697' or osm_uid = '55606' or osm_uid = '5565937' or osm_uid = '5586553' or osm_uid = '559157' or osm_uid = '559546' or osm_uid = '56277' or osm_uid = '563041' or osm_uid = '5633277' or osm_uid = '563462' or osm_uid = '5652397' or osm_uid = '5653973' or osm_uid = '565589' or osm_uid = '5656' or osm_uid = '5658027' or osm_uid = '5666137' or osm_uid = '5667707' or osm_uid = '5671811' or osm_uid = '5681163' or osm_uid = '568581' or osm_uid = '5686537' or osm_uid = '5701832' or osm_uid = '570650' or osm_uid = '5707611' or osm_uid = '5708649' or osm_uid = '570866' or osm_uid = '572200' or osm_uid = '572234' or osm_uid = '5742031' or osm_uid = '5751228' or osm_uid = '575573' or osm_uid = '5760' or osm_uid = '5765086' or osm_uid = '581181' or osm_uid = '581228' or osm_uid = '581746' or osm_uid = '582637' or osm_uid = '5854449' or osm_uid = '5864559' or osm_uid = '587343' or osm_uid = '587497' or osm_uid = '590140' or osm_uid = '591711' or osm_uid = '594980' or osm_uid = '598343' or osm_uid = '5996224' or osm_uid = '60178' or osm_uid = '6019200' or osm_uid = '602230' or osm_uid = '6049655' or osm_uid = '605664' or osm_uid = '6065909' or osm_uid = '607240' or osm_uid = '607440' or osm_uid = '608484' or osm_uid = '610772' or osm_uid = '6112529' or osm_uid = '611983' or osm_uid = '6126274' or osm_uid = '612895' or osm_uid = '6130502' or osm_uid = '613493' or osm_uid = '614067' or osm_uid = '6168330' or osm_uid = '61747' or osm_uid = '6175387' or osm_uid = '61809' or osm_uid = '620115' or osm_uid = '62013' or osm_uid = '620992' or osm_uid = '621115' or osm_uid = '6211955' or osm_uid = '621345' or osm_uid = '6213791' or osm_uid = '6226844' or osm_uid = '6237710' or osm_uid = '6245429' or osm_uid = '624588' or osm_uid = '6248313' or osm_uid = '624955' or osm_uid = '6255985' or osm_uid = '626954' or osm_uid = '62878' or osm_uid = '6293186' or osm_uid = '630267' or osm_uid = '63031' or osm_uid = '630535' or osm_uid = '631986' or osm_uid = '63340' or osm_uid = '636406' or osm_uid = '6379503' or osm_uid = '6397757' or osm_uid = '642638' or osm_uid = '645297' or osm_uid = '646152' or osm_uid = '648778' or osm_uid = '6492562' or osm_uid = '6505567' or osm_uid = '6513527' or osm_uid = '6519570' or osm_uid = '651969' or osm_uid = '652095' or osm_uid = '654350' or osm_uid = '654937' or osm_uid = '6555121' or osm_uid = '6586841' or osm_uid = '6653025' or osm_uid = '6653655' or osm_uid = '6700174' or osm_uid = '670432' or osm_uid = '672490' or osm_uid = '673026' or osm_uid = '6735880' or osm_uid = '673686' or osm_uid = '6755640' or osm_uid = '6765114' or osm_uid = '6780544' or osm_uid = '67832' or osm_uid = '6787565' or osm_uid = '679056' or osm_uid = '6797242' or osm_uid = '679794' or osm_uid = '680571' or osm_uid = '6805933' or osm_uid = '681381' or osm_uid = '6829111' or osm_uid = '685228' or osm_uid = '6865755' or osm_uid = '68873' or osm_uid = '693162' or osm_uid = '69418' or osm_uid = '6965258' or osm_uid = '699465' or osm_uid = '7001068' or osm_uid = '7001228' or osm_uid = '700170' or osm_uid = '701357' or osm_uid = '701616' or osm_uid = '702201' or osm_uid = '7037837' or osm_uid = '7051387' or osm_uid = '709568' or osm_uid = '710580' or osm_uid = '7117410' or osm_uid = '7118503' or osm_uid = '7125232' or osm_uid = '7135061' or osm_uid = '7136206' or osm_uid = '713653' or osm_uid = '713669' or osm_uid = '7140286' or osm_uid = '7142286' or osm_uid = '7160' or osm_uid = '7163579' or osm_uid = '71640' or osm_uid = '7165481' or osm_uid = '7178464' or osm_uid = '719181' or osm_uid = '7206855' or osm_uid = '7230529' or osm_uid = '72472' or osm_uid = '7299506' or osm_uid = '731617' or osm_uid = '73314' or osm_uid = '7350445' or osm_uid = '7404582' or osm_uid = '7420616' or osm_uid = '7452033' or osm_uid = '7459041' or osm_uid = '7463456' or osm_uid = '7470399' or osm_uid = '7473263' or osm_uid = '7491818' or osm_uid = '7505713' or osm_uid = '7522935' or osm_uid = '7526422' or osm_uid = '75315' or osm_uid = '7552692' or osm_uid = '7558739' or osm_uid = '7566700' or osm_uid = '7585088' or osm_uid = '7590348' or osm_uid = '7591844' or osm_uid = '75936' or osm_uid = '7644726' or osm_uid = '7645173' or osm_uid = '7662310' or osm_uid = '76678' or osm_uid = '7674414' or osm_uid = '7675673' or osm_uid = '7694099' or osm_uid = '77323' or osm_uid = '7739498' or osm_uid = '7767083' or osm_uid = '777434' or osm_uid = '7786310' or osm_uid = '782982' or osm_uid = '7850888' or osm_uid = '78863' or osm_uid = '790192' or osm_uid = '7949410' or osm_uid = '7959422' or osm_uid = '8024383' or osm_uid = '8076256' or osm_uid = '8078403' or osm_uid = '8124742' or osm_uid = '8125605' or osm_uid = '8183672' or osm_uid = '8213968' or osm_uid = '82164' or osm_uid = '8224003' or osm_uid = '8244365' or osm_uid = '8244812' or osm_uid = '8244821' or osm_uid = '8245566' or osm_uid = '8257375' or osm_uid = '8276520' or osm_uid = '8291531' or osm_uid = '8294164' or osm_uid = '83024' or osm_uid = '8311123' or osm_uid = '8324803' or osm_uid = '8339894' or osm_uid = '834411' or osm_uid = '8344547' or osm_uid = '8345830' or osm_uid = '8345931' or osm_uid = '8358968' or osm_uid = '8365476' or osm_uid = '837005' or osm_uid = '8373687' or osm_uid = '8376894' or osm_uid = '839345' or osm_uid = '8399506' or osm_uid = '8404294' or osm_uid = '8404734' or osm_uid = '8404848' or osm_uid = '8417514' or osm_uid = '842068' or osm_uid = '8423831' or osm_uid = '8432495' or osm_uid = '8432550' or osm_uid = '8468443' or osm_uid = '84777' or osm_uid = '8486599' or osm_uid = '8494347' or osm_uid = '8494394' or osm_uid = '8498246' or osm_uid = '85635' or osm_uid = '87428' or osm_uid = '87781' or osm_uid = '900157' or osm_uid = '901366' or osm_uid = '90283' or osm_uid = '911036' or osm_uid = '917581' or osm_uid = '923101' or osm_uid = '92655' or osm_uid = '92878' or osm_uid = '94085' or osm_uid = '94278' or osm_uid = '943860' or osm_uid = '96060' or osm_uid = '965935' or osm_uid = '971034' or osm_uid = '971299' or osm_uid = '971759' or osm_uid = '972111' or osm_uid = '972521' or osm_uid = '973860' or osm_uid = '974258' or osm_uid = '974820' or osm_uid = '976991' or osm_uid = '98712' or osm_uid = '98807' or osm_uid = '98964' or osm_uid = '989915' or osm_uid = '990288' or osm_uid = '99620' or osm_uid = '997917')

create table manchester_final_polygon as (select * from public.manchester_polygon_no_bulk where osm_uid = '1004044' or osm_uid = '101150' or osm_uid = '102179' or osm_uid = '102218' or osm_uid = '103272' or osm_uid = '103913' or osm_uid = '103965' or osm_uid = '104094' or osm_uid = '1195315' or osm_uid = '1196179' or osm_uid = '1197753' or osm_uid = '1199559' or osm_uid = '1201958' or osm_uid = '1203156' or osm_uid = '1214104' or osm_uid = '1214354' or osm_uid = '1218812' or osm_uid = '1222685' or osm_uid = '1223572' or osm_uid = '1223707' or osm_uid = '1223734' or osm_uid = '1236976' or osm_uid = '1238559' or osm_uid = '124714' or osm_uid = '1263066' or osm_uid = '1269743' or osm_uid = '127689' or osm_uid = '1278962' or osm_uid = '1290642' or osm_uid = '1304456' or osm_uid = '1313226' or osm_uid = '1316995' or osm_uid = '1326809' or osm_uid = '133524' or osm_uid = '1343344' or osm_uid = '134405' or osm_uid = '1352470' or osm_uid = '135451' or osm_uid = '1373362' or osm_uid = '1403800' or osm_uid = '1405378' or osm_uid = '1407799' or osm_uid = '1418828' or osm_uid = '1429431' or osm_uid = '1429910' or osm_uid = '1430086' or osm_uid = '143992' or osm_uid = '145573' or osm_uid = '146135' or osm_uid = '1467389' or osm_uid = '1476041' or osm_uid = '148524' or osm_uid = '1511813' or osm_uid = '151253' or osm_uid = '151510' or osm_uid = '1520385' or osm_uid = '1531205' or osm_uid = '154012' or osm_uid = '1556311' or osm_uid = '1557003' or osm_uid = '156199' or osm_uid = '157507' or osm_uid = '1607' or osm_uid = '16180' or osm_uid = '163399' or osm_uid = '1638032' or osm_uid = '1639428' or osm_uid = '164300' or osm_uid = '1660537' or osm_uid = '166103' or osm_uid = '1662957' or osm_uid = '1665677' or osm_uid = '1668446' or osm_uid = '167795' or osm_uid = '16821' or osm_uid = '1683417' or osm_uid = '168700' or osm_uid = '169215' or osm_uid = '169229' or osm_uid = '169569' or osm_uid = '1700709' or osm_uid = '1704593' or osm_uid = '1706673' or osm_uid = '1707383' or osm_uid = '1716089' or osm_uid = '1718823' or osm_uid = '172353' or osm_uid = '1723873' or osm_uid = '173261' or osm_uid = '173614' or osm_uid = '1742769' or osm_uid = '1743054' or osm_uid = '1744028' or osm_uid = '1753294' or osm_uid = '178560' or osm_uid = '1790891' or osm_uid = '179103' or osm_uid = '1791547' or osm_uid = '1800249' or osm_uid = '1801024' or osm_uid = '1804760' or osm_uid = '1807339' or osm_uid = '1807469' or osm_uid = '1807538' or osm_uid = '18087' or osm_uid = '1816152' or osm_uid = '1817182' or osm_uid = '1818794' or osm_uid = '1819965' or osm_uid = '1821747' or osm_uid = '1822230' or osm_uid = '1822315' or osm_uid = '182506' or osm_uid = '1836312' or osm_uid = '1836349' or osm_uid = '184757' or osm_uid = '18480' or osm_uid = '1849977' or osm_uid = '18568' or osm_uid = '1860449' or osm_uid = '18623' or osm_uid = '1862816' or osm_uid = '1870664' or osm_uid = '1872877' or osm_uid = '1877416' or osm_uid = '1878245' or osm_uid = '1882113' or osm_uid = '1882123' or osm_uid = '1882442' or osm_uid = '1882489' or osm_uid = '1882575' or osm_uid = '1883368' or osm_uid = '1883529' or osm_uid = '1884973' or osm_uid = '1885873' or osm_uid = '1897731' or osm_uid = '191399' or osm_uid = '1914846' or osm_uid = '1918174' or osm_uid = '1924133' or osm_uid = '1928051' or osm_uid = '193653' or osm_uid = '19472' or osm_uid = '1951050' or osm_uid = '1953652' or osm_uid = '1958914' or osm_uid = '1960741' or osm_uid = '1963358' or osm_uid = '1967789' or osm_uid = '1969477' or osm_uid = '1976449' or osm_uid = '1976630' or osm_uid = '1977070' or osm_uid = '1979041' or osm_uid = '1979485' or osm_uid = '1981160' or osm_uid = '198183' or osm_uid = '19834' or osm_uid = '1989751' or osm_uid = '19901' or osm_uid = '199545' or osm_uid = '1997480' or osm_uid = '2005288' or osm_uid = '2015287' or osm_uid = '2020865' or osm_uid = '2025986' or osm_uid = '2030616' or osm_uid = '2039391' or osm_uid = '204152' or osm_uid = '2044070' or osm_uid = '2045215' or osm_uid = '2046847' or osm_uid = '2048358' or osm_uid = '2050359' or osm_uid = '205740' or osm_uid = '2062042' or osm_uid = '2062939' or osm_uid = '2064718' or osm_uid = '2073294' or osm_uid = '2073414' or osm_uid = '2084381' or osm_uid = '2088016' or osm_uid = '20898' or osm_uid = '2102213' or osm_uid = '2111379' or osm_uid = '2114823' or osm_uid = '211575' or osm_uid = '2121101' or osm_uid = '21235' or osm_uid = '213893' or osm_uid = '214152' or osm_uid = '2142086' or osm_uid = '214846' or osm_uid = '215123' or osm_uid = '215239' or osm_uid = '2166986' or osm_uid = '2201587' or osm_uid = '224936' or osm_uid = '2263619' or osm_uid = '2294177' or osm_uid = '2298114' or osm_uid = '230287' or osm_uid = '231240' or osm_uid = '2315642' or osm_uid = '2324248' or osm_uid = '2328006' or osm_uid = '233890' or osm_uid = '2339960' or osm_uid = '2340855' or osm_uid = '234692' or osm_uid = '2355' or osm_uid = '2369313' or osm_uid = '237302' or osm_uid = '237777' or osm_uid = '2380808' or osm_uid = '238520' or osm_uid = '2388323' or osm_uid = '2393820' or osm_uid = '2397352' or osm_uid = '24019' or osm_uid = '2402' or osm_uid = '2403806' or osm_uid = '2408199' or osm_uid = '2411548' or osm_uid = '24116' or osm_uid = '2433431' or osm_uid = '2443879' or osm_uid = '2444139' or osm_uid = '2445549' or osm_uid = '2452904' or osm_uid = '2457499' or osm_uid = '2470627' or osm_uid = '2471749' or osm_uid = '2484422' or osm_uid = '2488986' or osm_uid = '250450' or osm_uid = '250649' or osm_uid = '251482' or osm_uid = '2521908' or osm_uid = '2535601' or osm_uid = '2544444' or osm_uid = '2551280' or osm_uid = '2562316' or osm_uid = '256394' or osm_uid = '256872' or osm_uid = '2569360' or osm_uid = '257421' or osm_uid = '2585346' or osm_uid = '2595133' or osm_uid = '2596250' or osm_uid = '2606406' or osm_uid = '2608802' or osm_uid = '263593' or osm_uid = '2636765' or osm_uid = '2641285' or osm_uid = '2652008' or osm_uid = '2677117' or osm_uid = '2680020' or osm_uid = '2680204' or osm_uid = '2689100' or osm_uid = '2699546' or osm_uid = '270456' or osm_uid = '2719086' or osm_uid = '273178' or osm_uid = '273963' or osm_uid = '27426' or osm_uid = '2748122' or osm_uid = '275365' or osm_uid = '276140' or osm_uid = '2764121' or osm_uid = '2773877' or osm_uid = '2780528' or osm_uid = '2783885' or osm_uid = '2788773' or osm_uid = '2791697' or osm_uid = '2799163' or osm_uid = '2800377' or osm_uid = '2810211' or osm_uid = '282798' or osm_uid = '2845963' or osm_uid = '2850658' or osm_uid = '2854457' or osm_uid = '286814' or osm_uid = '2868873' or osm_uid = '2874110' or osm_uid = '2883761' or osm_uid = '289311' or osm_uid = '2900364' or osm_uid = '2905735' or osm_uid = '2907731' or osm_uid = '2926' or osm_uid = '2928071' or osm_uid = '2946015' or osm_uid = '2956856' or osm_uid = '296177' or osm_uid = '296597' or osm_uid = '297420' or osm_uid = '298394' or osm_uid = '299891' or osm_uid = '3028632' or osm_uid = '3030981' or osm_uid = '305459' or osm_uid = '3067760' or osm_uid = '308558' or osm_uid = '309601' or osm_uid = '309618' or osm_uid = '310680' or osm_uid = '311271' or osm_uid = '3113780' or osm_uid = '3125624' or osm_uid = '3127176' or osm_uid = '3139656' or osm_uid = '3140408' or osm_uid = '314721' or osm_uid = '3161459' or osm_uid = '317039' or osm_uid = '317060' or osm_uid = '3184503' or osm_uid = '319081' or osm_uid = '3200104' or osm_uid = '3203267' or osm_uid = '32154' or osm_uid = '322127' or osm_uid = '322503' or osm_uid = '322717' or osm_uid = '325611' or osm_uid = '3293862' or osm_uid = '329608' or osm_uid = '3298838' or osm_uid = '33103' or osm_uid = '3333912' or osm_uid = '3338661' or osm_uid = '3342801' or osm_uid = '3349252' or osm_uid = '3358825' or osm_uid = '336327' or osm_uid = '33647' or osm_uid = '3382053' or osm_uid = '3384121' or osm_uid = '3438084' or osm_uid = '3440603' or osm_uid = '3440839' or osm_uid = '3442459' or osm_uid = '3444615' or osm_uid = '3448456' or osm_uid = '3451745' or osm_uid = '345507' or osm_uid = '345640' or osm_uid = '347347' or osm_uid = '347433' or osm_uid = '3476663' or osm_uid = '348949' or osm_uid = '3492260' or osm_uid = '349367' or osm_uid = '3496835' or osm_uid = '3497617' or osm_uid = '3500699' or osm_uid = '350344' or osm_uid = '3541716' or osm_uid = '354406' or osm_uid = '3547560' or osm_uid = '3566984' or osm_uid = '35699' or osm_uid = '3582374' or osm_uid = '358953' or osm_uid = '360873' or osm_uid = '3630915' or osm_uid = '363573' or osm_uid = '363967' or osm_uid = '364088' or osm_uid = '364520' or osm_uid = '3655306' or osm_uid = '365966' or osm_uid = '3662256' or osm_uid = '3674371' or osm_uid = '3687268' or osm_uid = '3704406' or osm_uid = '371213' or osm_uid = '371370' or osm_uid = '3717833' or osm_uid = '3734077' or osm_uid = '373565' or osm_uid = '3738047' or osm_uid = '3748375' or osm_uid = '37496' or osm_uid = '3777514' or osm_uid = '37798' or osm_uid = '3783186' or osm_uid = '3785466' or osm_uid = '380333' or osm_uid = '3806735' or osm_uid = '381997' or osm_uid = '3822092' or osm_uid = '3826407' or osm_uid = '3828331' or osm_uid = '3837268' or osm_uid = '384296' or osm_uid = '385581' or osm_uid = '385627' or osm_uid = '386089' or osm_uid = '386125' or osm_uid = '387225' or osm_uid = '388496' or osm_uid = '38903' or osm_uid = '3896924' or osm_uid = '38985' or osm_uid = '3900861' or osm_uid = '3905794' or osm_uid = '3918144' or osm_uid = '3925656' or osm_uid = '3932273' or osm_uid = '395076' or osm_uid = '3959663' or osm_uid = '396987' or osm_uid = '397468' or osm_uid = '397491' or osm_uid = '399008' or osm_uid = '3992054' or osm_uid = '4017082' or osm_uid = '4026873' or osm_uid = '403518' or osm_uid = '4039728' or osm_uid = '404175' or osm_uid = '405080' or osm_uid = '4068656' or osm_uid = '4070455' or osm_uid = '4070822' or osm_uid = '407299' or osm_uid = '4075809' or osm_uid = '4078654' or osm_uid = '4079629' or osm_uid = '4096811' or osm_uid = '410313' or osm_uid = '4109876' or osm_uid = '4114163' or osm_uid = '411497' or osm_uid = '411634' or osm_uid = '412804' or osm_uid = '413286' or osm_uid = '41368' or osm_uid = '416166' or osm_uid = '4172827' or osm_uid = '4191525' or osm_uid = '4212624' or osm_uid = '4242208' or osm_uid = '424779' or osm_uid = '42680' or osm_uid = '428524' or osm_uid = '428545' or osm_uid = '4291619' or osm_uid = '430743' or osm_uid = '4316207' or osm_uid = '4317048' or osm_uid = '431837' or osm_uid = '4323399' or osm_uid = '432382' or osm_uid = '4337284' or osm_uid = '4359567' or osm_uid = '439645' or osm_uid = '4409551' or osm_uid = '4415367' or osm_uid = '4458716' or osm_uid = '4479998' or osm_uid = '4497001' or osm_uid = '4509274' or osm_uid = '4531208' or osm_uid = '4541812' or osm_uid = '454759' or osm_uid = '455164' or osm_uid = '456013' or osm_uid = '457818' or osm_uid = '458075' or osm_uid = '4587125' or osm_uid = '459239' or osm_uid = '4598206' or osm_uid = '45985' or osm_uid = '4607797' or osm_uid = '4618362' or osm_uid = '4626625' or osm_uid = '46623' or osm_uid = '4664716' or osm_uid = '466627' or osm_uid = '4667746' or osm_uid = '4683111' or osm_uid = '4689463' or osm_uid = '46926' or osm_uid = '4694' or osm_uid = '4714783' or osm_uid = '4737998' or osm_uid = '4742920' or osm_uid = '475106' or osm_uid = '475800' or osm_uid = '477289' or osm_uid = '477427' or osm_uid = '479574' or osm_uid = '4817367' or osm_uid = '4820878' or osm_uid = '482491' or osm_uid = '4841912' or osm_uid = '4860523' or osm_uid = '4870999' or osm_uid = '4892183' or osm_uid = '489324' or osm_uid = '4902241' or osm_uid = '490500' or osm_uid = '4949658' or osm_uid = '4960446' or osm_uid = '4967947' or osm_uid = '499672' or osm_uid = '5006531' or osm_uid = '500789' or osm_uid = '5007892' or osm_uid = '5008160' or osm_uid = '501118' or osm_uid = '5011295' or osm_uid = '5011732' or osm_uid = '5020122' or osm_uid = '502174' or osm_uid = '502525' or osm_uid = '5034114' or osm_uid = '5049586' or osm_uid = '5050518' or osm_uid = '5066150' or osm_uid = '507228' or osm_uid = '5103217' or osm_uid = '5111492' or osm_uid = '5113658' or osm_uid = '511782' or osm_uid = '5138029' or osm_uid = '5138852' or osm_uid = '5141635' or osm_uid = '514683' or osm_uid = '5171316' or osm_uid = '5179581' or osm_uid = '5181642' or osm_uid = '5185271' or osm_uid = '5188437' or osm_uid = '5192500' or osm_uid = '5196346' or osm_uid = '5198003' or osm_uid = '5200534' or osm_uid = '5201425' or osm_uid = '5201871' or osm_uid = '5201891' or osm_uid = '5202263' or osm_uid = '5202420' or osm_uid = '5202693' or osm_uid = '5202757' or osm_uid = '5203303' or osm_uid = '520488' or osm_uid = '5206390' or osm_uid = '5206448' or osm_uid = '5207495' or osm_uid = '5208248' or osm_uid = '5209800' or osm_uid = '521378' or osm_uid = '521954' or osm_uid = '5230057' or osm_uid = '523764' or osm_uid = '5243311' or osm_uid = '524468' or osm_uid = '5263943' or osm_uid = '5265183' or osm_uid = '5278660' or osm_uid = '5283320' or osm_uid = '529040' or osm_uid = '5295262' or osm_uid = '5307733' or osm_uid = '53300' or osm_uid = '5338836' or osm_uid = '5340439' or osm_uid = '534214' or osm_uid = '5348299' or osm_uid = '5353863' or osm_uid = '536623' or osm_uid = '5366536' or osm_uid = '537646' or osm_uid = '538831' or osm_uid = '5407518' or osm_uid = '5413963' or osm_uid = '54552' or osm_uid = '5457374' or osm_uid = '54594' or osm_uid = '5459879' or osm_uid = '5478844' or osm_uid = '550860' or osm_uid = '552197' or osm_uid = '5522575' or osm_uid = '5523697' or osm_uid = '55606' or osm_uid = '5565937' or osm_uid = '5586553' or osm_uid = '559157' or osm_uid = '559546' or osm_uid = '56277' or osm_uid = '563041' or osm_uid = '5633277' or osm_uid = '563462' or osm_uid = '5652397' or osm_uid = '5653973' or osm_uid = '565589' or osm_uid = '5656' or osm_uid = '5658027' or osm_uid = '5666137' or osm_uid = '5667707' or osm_uid = '5671811' or osm_uid = '5681163' or osm_uid = '568581' or osm_uid = '5686537' or osm_uid = '5701832' or osm_uid = '570650' or osm_uid = '5707611' or osm_uid = '5708649' or osm_uid = '570866' or osm_uid = '572200' or osm_uid = '572234' or osm_uid = '5742031' or osm_uid = '5751228' or osm_uid = '575573' or osm_uid = '5760' or osm_uid = '5765086' or osm_uid = '581181' or osm_uid = '581228' or osm_uid = '581746' or osm_uid = '582637' or osm_uid = '5854449' or osm_uid = '5864559' or osm_uid = '587343' or osm_uid = '587497' or osm_uid = '590140' or osm_uid = '591711' or osm_uid = '594980' or osm_uid = '598343' or osm_uid = '5996224' or osm_uid = '60178' or osm_uid = '6019200' or osm_uid = '602230' or osm_uid = '6049655' or osm_uid = '605664' or osm_uid = '6065909' or osm_uid = '607240' or osm_uid = '607440' or osm_uid = '608484' or osm_uid = '610772' or osm_uid = '6112529' or osm_uid = '611983' or osm_uid = '6126274' or osm_uid = '612895' or osm_uid = '6130502' or osm_uid = '613493' or osm_uid = '614067' or osm_uid = '6168330' or osm_uid = '61747' or osm_uid = '6175387' or osm_uid = '61809' or osm_uid = '620115' or osm_uid = '62013' or osm_uid = '620992' or osm_uid = '621115' or osm_uid = '6211955' or osm_uid = '621345' or osm_uid = '6213791' or osm_uid = '6226844' or osm_uid = '6237710' or osm_uid = '6245429' or osm_uid = '624588' or osm_uid = '6248313' or osm_uid = '624955' or osm_uid = '6255985' or osm_uid = '626954' or osm_uid = '62878' or osm_uid = '6293186' or osm_uid = '630267' or osm_uid = '63031' or osm_uid = '630535' or osm_uid = '631986' or osm_uid = '63340' or osm_uid = '636406' or osm_uid = '6379503' or osm_uid = '6397757' or osm_uid = '642638' or osm_uid = '645297' or osm_uid = '646152' or osm_uid = '648778' or osm_uid = '6492562' or osm_uid = '6505567' or osm_uid = '6513527' or osm_uid = '6519570' or osm_uid = '651969' or osm_uid = '652095' or osm_uid = '654350' or osm_uid = '654937' or osm_uid = '6555121' or osm_uid = '6586841' or osm_uid = '6653025' or osm_uid = '6653655' or osm_uid = '6700174' or osm_uid = '670432' or osm_uid = '672490' or osm_uid = '673026' or osm_uid = '6735880' or osm_uid = '673686' or osm_uid = '6755640' or osm_uid = '6765114' or osm_uid = '6780544' or osm_uid = '67832' or osm_uid = '6787565' or osm_uid = '679056' or osm_uid = '6797242' or osm_uid = '679794' or osm_uid = '680571' or osm_uid = '6805933' or osm_uid = '681381' or osm_uid = '6829111' or osm_uid = '685228' or osm_uid = '6865755' or osm_uid = '68873' or osm_uid = '693162' or osm_uid = '69418' or osm_uid = '6965258' or osm_uid = '699465' or osm_uid = '7001068' or osm_uid = '7001228' or osm_uid = '700170' or osm_uid = '701357' or osm_uid = '701616' or osm_uid = '702201' or osm_uid = '7037837' or osm_uid = '7051387' or osm_uid = '709568' or osm_uid = '710580' or osm_uid = '7117410' or osm_uid = '7118503' or osm_uid = '7125232' or osm_uid = '7135061' or osm_uid = '7136206' or osm_uid = '713653' or osm_uid = '713669' or osm_uid = '7140286' or osm_uid = '7142286' or osm_uid = '7160' or osm_uid = '7163579' or osm_uid = '71640' or osm_uid = '7165481' or osm_uid = '7178464' or osm_uid = '719181' or osm_uid = '7206855' or osm_uid = '7230529' or osm_uid = '72472' or osm_uid = '7299506' or osm_uid = '731617' or osm_uid = '73314' or osm_uid = '7350445' or osm_uid = '7404582' or osm_uid = '7420616' or osm_uid = '7452033' or osm_uid = '7459041' or osm_uid = '7463456' or osm_uid = '7470399' or osm_uid = '7473263' or osm_uid = '7491818' or osm_uid = '7505713' or osm_uid = '7522935' or osm_uid = '7526422' or osm_uid = '75315' or osm_uid = '7552692' or osm_uid = '7558739' or osm_uid = '7566700' or osm_uid = '7585088' or osm_uid = '7590348' or osm_uid = '7591844' or osm_uid = '75936' or osm_uid = '7644726' or osm_uid = '7645173' or osm_uid = '7662310' or osm_uid = '76678' or osm_uid = '7674414' or osm_uid = '7675673' or osm_uid = '7694099' or osm_uid = '77323' or osm_uid = '7739498' or osm_uid = '7767083' or osm_uid = '777434' or osm_uid = '7786310' or osm_uid = '782982' or osm_uid = '7850888' or osm_uid = '78863' or osm_uid = '790192' or osm_uid = '7949410' or osm_uid = '7959422' or osm_uid = '8024383' or osm_uid = '8076256' or osm_uid = '8078403' or osm_uid = '8124742' or osm_uid = '8125605' or osm_uid = '8183672' or osm_uid = '8213968' or osm_uid = '82164' or osm_uid = '8224003' or osm_uid = '8244365' or osm_uid = '8244812' or osm_uid = '8244821' or osm_uid = '8245566' or osm_uid = '8257375' or osm_uid = '8276520' or osm_uid = '8291531' or osm_uid = '8294164' or osm_uid = '83024' or osm_uid = '8311123' or osm_uid = '8324803' or osm_uid = '8339894' or osm_uid = '834411' or osm_uid = '8344547' or osm_uid = '8345830' or osm_uid = '8345931' or osm_uid = '8358968' or osm_uid = '8365476' or osm_uid = '837005' or osm_uid = '8373687' or osm_uid = '8376894' or osm_uid = '839345' or osm_uid = '8399506' or osm_uid = '8404294' or osm_uid = '8404734' or osm_uid = '8404848' or osm_uid = '8417514' or osm_uid = '842068' or osm_uid = '8423831' or osm_uid = '8432495' or osm_uid = '8432550' or osm_uid = '8468443' or osm_uid = '84777' or osm_uid = '8486599' or osm_uid = '8494347' or osm_uid = '8494394' or osm_uid = '8498246' or osm_uid = '85635' or osm_uid = '87428' or osm_uid = '87781' or osm_uid = '900157' or osm_uid = '901366' or osm_uid = '90283' or osm_uid = '911036' or osm_uid = '917581' or osm_uid = '923101' or osm_uid = '92655' or osm_uid = '92878' or osm_uid = '94085' or osm_uid = '94278' or osm_uid = '943860' or osm_uid = '96060' or osm_uid = '965935' or osm_uid = '971034' or osm_uid = '971299' or osm_uid = '971759' or osm_uid = '972111' or osm_uid = '972521' or osm_uid = '973860' or osm_uid = '974258' or osm_uid = '974820' or osm_uid = '976991' or osm_uid = '98712' or osm_uid = '98807' or osm_uid = '98964' or osm_uid = '989915' or osm_uid = '990288' or osm_uid = '99620' or osm_uid = '997917')

create table manchester_final_roads as (select * from public.manchester_roads where osm_uid = '1004044' or osm_uid = '101150' or osm_uid = '102179' or osm_uid = '102218' or osm_uid = '103272' or osm_uid = '103913' or osm_uid = '103965' or osm_uid = '104094' or osm_uid = '1195315' or osm_uid = '1196179' or osm_uid = '1197753' or osm_uid = '1199559' or osm_uid = '1201958' or osm_uid = '1203156' or osm_uid = '1214104' or osm_uid = '1214354' or osm_uid = '1218812' or osm_uid = '1222685' or osm_uid = '1223572' or osm_uid = '1223707' or osm_uid = '1223734' or osm_uid = '1236976' or osm_uid = '1238559' or osm_uid = '124714' or osm_uid = '1263066' or osm_uid = '1269743' or osm_uid = '127689' or osm_uid = '1278962' or osm_uid = '1290642' or osm_uid = '1304456' or osm_uid = '1313226' or osm_uid = '1316995' or osm_uid = '1326809' or osm_uid = '133524' or osm_uid = '1343344' or osm_uid = '134405' or osm_uid = '1352470' or osm_uid = '135451' or osm_uid = '1373362' or osm_uid = '1403800' or osm_uid = '1405378' or osm_uid = '1407799' or osm_uid = '1418828' or osm_uid = '1429431' or osm_uid = '1429910' or osm_uid = '1430086' or osm_uid = '143992' or osm_uid = '145573' or osm_uid = '146135' or osm_uid = '1467389' or osm_uid = '1476041' or osm_uid = '148524' or osm_uid = '1511813' or osm_uid = '151253' or osm_uid = '151510' or osm_uid = '1520385' or osm_uid = '1531205' or osm_uid = '154012' or osm_uid = '1556311' or osm_uid = '1557003' or osm_uid = '156199' or osm_uid = '157507' or osm_uid = '1607' or osm_uid = '16180' or osm_uid = '163399' or osm_uid = '1638032' or osm_uid = '1639428' or osm_uid = '164300' or osm_uid = '1660537' or osm_uid = '166103' or osm_uid = '1662957' or osm_uid = '1665677' or osm_uid = '1668446' or osm_uid = '167795' or osm_uid = '16821' or osm_uid = '1683417' or osm_uid = '168700' or osm_uid = '169215' or osm_uid = '169229' or osm_uid = '169569' or osm_uid = '1700709' or osm_uid = '1704593' or osm_uid = '1706673' or osm_uid = '1707383' or osm_uid = '1716089' or osm_uid = '1718823' or osm_uid = '172353' or osm_uid = '1723873' or osm_uid = '173261' or osm_uid = '173614' or osm_uid = '1742769' or osm_uid = '1743054' or osm_uid = '1744028' or osm_uid = '1753294' or osm_uid = '178560' or osm_uid = '1790891' or osm_uid = '179103' or osm_uid = '1791547' or osm_uid = '1800249' or osm_uid = '1801024' or osm_uid = '1804760' or osm_uid = '1807339' or osm_uid = '1807469' or osm_uid = '1807538' or osm_uid = '18087' or osm_uid = '1816152' or osm_uid = '1817182' or osm_uid = '1818794' or osm_uid = '1819965' or osm_uid = '1821747' or osm_uid = '1822230' or osm_uid = '1822315' or osm_uid = '182506' or osm_uid = '1836312' or osm_uid = '1836349' or osm_uid = '184757' or osm_uid = '18480' or osm_uid = '1849977' or osm_uid = '18568' or osm_uid = '1860449' or osm_uid = '18623' or osm_uid = '1862816' or osm_uid = '1870664' or osm_uid = '1872877' or osm_uid = '1877416' or osm_uid = '1878245' or osm_uid = '1882113' or osm_uid = '1882123' or osm_uid = '1882442' or osm_uid = '1882489' or osm_uid = '1882575' or osm_uid = '1883368' or osm_uid = '1883529' or osm_uid = '1884973' or osm_uid = '1885873' or osm_uid = '1897731' or osm_uid = '191399' or osm_uid = '1914846' or osm_uid = '1918174' or osm_uid = '1924133' or osm_uid = '1928051' or osm_uid = '193653' or osm_uid = '19472' or osm_uid = '1951050' or osm_uid = '1953652' or osm_uid = '1958914' or osm_uid = '1960741' or osm_uid = '1963358' or osm_uid = '1967789' or osm_uid = '1969477' or osm_uid = '1976449' or osm_uid = '1976630' or osm_uid = '1977070' or osm_uid = '1979041' or osm_uid = '1979485' or osm_uid = '1981160' or osm_uid = '198183' or osm_uid = '19834' or osm_uid = '1989751' or osm_uid = '19901' or osm_uid = '199545' or osm_uid = '1997480' or osm_uid = '2005288' or osm_uid = '2015287' or osm_uid = '2020865' or osm_uid = '2025986' or osm_uid = '2030616' or osm_uid = '2039391' or osm_uid = '204152' or osm_uid = '2044070' or osm_uid = '2045215' or osm_uid = '2046847' or osm_uid = '2048358' or osm_uid = '2050359' or osm_uid = '205740' or osm_uid = '2062042' or osm_uid = '2062939' or osm_uid = '2064718' or osm_uid = '2073294' or osm_uid = '2073414' or osm_uid = '2084381' or osm_uid = '2088016' or osm_uid = '20898' or osm_uid = '2102213' or osm_uid = '2111379' or osm_uid = '2114823' or osm_uid = '211575' or osm_uid = '2121101' or osm_uid = '21235' or osm_uid = '213893' or osm_uid = '214152' or osm_uid = '2142086' or osm_uid = '214846' or osm_uid = '215123' or osm_uid = '215239' or osm_uid = '2166986' or osm_uid = '2201587' or osm_uid = '224936' or osm_uid = '2263619' or osm_uid = '2294177' or osm_uid = '2298114' or osm_uid = '230287' or osm_uid = '231240' or osm_uid = '2315642' or osm_uid = '2324248' or osm_uid = '2328006' or osm_uid = '233890' or osm_uid = '2339960' or osm_uid = '2340855' or osm_uid = '234692' or osm_uid = '2355' or osm_uid = '2369313' or osm_uid = '237302' or osm_uid = '237777' or osm_uid = '2380808' or osm_uid = '238520' or osm_uid = '2388323' or osm_uid = '2393820' or osm_uid = '2397352' or osm_uid = '24019' or osm_uid = '2402' or osm_uid = '2403806' or osm_uid = '2408199' or osm_uid = '2411548' or osm_uid = '24116' or osm_uid = '2433431' or osm_uid = '2443879' or osm_uid = '2444139' or osm_uid = '2445549' or osm_uid = '2452904' or osm_uid = '2457499' or osm_uid = '2470627' or osm_uid = '2471749' or osm_uid = '2484422' or osm_uid = '2488986' or osm_uid = '250450' or osm_uid = '250649' or osm_uid = '251482' or osm_uid = '2521908' or osm_uid = '2535601' or osm_uid = '2544444' or osm_uid = '2551280' or osm_uid = '2562316' or osm_uid = '256394' or osm_uid = '256872' or osm_uid = '2569360' or osm_uid = '257421' or osm_uid = '2585346' or osm_uid = '2595133' or osm_uid = '2596250' or osm_uid = '2606406' or osm_uid = '2608802' or osm_uid = '263593' or osm_uid = '2636765' or osm_uid = '2641285' or osm_uid = '2652008' or osm_uid = '2677117' or osm_uid = '2680020' or osm_uid = '2680204' or osm_uid = '2689100' or osm_uid = '2699546' or osm_uid = '270456' or osm_uid = '2719086' or osm_uid = '273178' or osm_uid = '273963' or osm_uid = '27426' or osm_uid = '2748122' or osm_uid = '275365' or osm_uid = '276140' or osm_uid = '2764121' or osm_uid = '2773877' or osm_uid = '2780528' or osm_uid = '2783885' or osm_uid = '2788773' or osm_uid = '2791697' or osm_uid = '2799163' or osm_uid = '2800377' or osm_uid = '2810211' or osm_uid = '282798' or osm_uid = '2845963' or osm_uid = '2850658' or osm_uid = '2854457' or osm_uid = '286814' or osm_uid = '2868873' or osm_uid = '2874110' or osm_uid = '2883761' or osm_uid = '289311' or osm_uid = '2900364' or osm_uid = '2905735' or osm_uid = '2907731' or osm_uid = '2926' or osm_uid = '2928071' or osm_uid = '2946015' or osm_uid = '2956856' or osm_uid = '296177' or osm_uid = '296597' or osm_uid = '297420' or osm_uid = '298394' or osm_uid = '299891' or osm_uid = '3028632' or osm_uid = '3030981' or osm_uid = '305459' or osm_uid = '3067760' or osm_uid = '308558' or osm_uid = '309601' or osm_uid = '309618' or osm_uid = '310680' or osm_uid = '311271' or osm_uid = '3113780' or osm_uid = '3125624' or osm_uid = '3127176' or osm_uid = '3139656' or osm_uid = '3140408' or osm_uid = '314721' or osm_uid = '3161459' or osm_uid = '317039' or osm_uid = '317060' or osm_uid = '3184503' or osm_uid = '319081' or osm_uid = '3200104' or osm_uid = '3203267' or osm_uid = '32154' or osm_uid = '322127' or osm_uid = '322503' or osm_uid = '322717' or osm_uid = '325611' or osm_uid = '3293862' or osm_uid = '329608' or osm_uid = '3298838' or osm_uid = '33103' or osm_uid = '3333912' or osm_uid = '3338661' or osm_uid = '3342801' or osm_uid = '3349252' or osm_uid = '3358825' or osm_uid = '336327' or osm_uid = '33647' or osm_uid = '3382053' or osm_uid = '3384121' or osm_uid = '3438084' or osm_uid = '3440603' or osm_uid = '3440839' or osm_uid = '3442459' or osm_uid = '3444615' or osm_uid = '3448456' or osm_uid = '3451745' or osm_uid = '345507' or osm_uid = '345640' or osm_uid = '347347' or osm_uid = '347433' or osm_uid = '3476663' or osm_uid = '348949' or osm_uid = '3492260' or osm_uid = '349367' or osm_uid = '3496835' or osm_uid = '3497617' or osm_uid = '3500699' or osm_uid = '350344' or osm_uid = '3541716' or osm_uid = '354406' or osm_uid = '3547560' or osm_uid = '3566984' or osm_uid = '35699' or osm_uid = '3582374' or osm_uid = '358953' or osm_uid = '360873' or osm_uid = '3630915' or osm_uid = '363573' or osm_uid = '363967' or osm_uid = '364088' or osm_uid = '364520' or osm_uid = '3655306' or osm_uid = '365966' or osm_uid = '3662256' or osm_uid = '3674371' or osm_uid = '3687268' or osm_uid = '3704406' or osm_uid = '371213' or osm_uid = '371370' or osm_uid = '3717833' or osm_uid = '3734077' or osm_uid = '373565' or osm_uid = '3738047' or osm_uid = '3748375' or osm_uid = '37496' or osm_uid = '3777514' or osm_uid = '37798' or osm_uid = '3783186' or osm_uid = '3785466' or osm_uid = '380333' or osm_uid = '3806735' or osm_uid = '381997' or osm_uid = '3822092' or osm_uid = '3826407' or osm_uid = '3828331' or osm_uid = '3837268' or osm_uid = '384296' or osm_uid = '385581' or osm_uid = '385627' or osm_uid = '386089' or osm_uid = '386125' or osm_uid = '387225' or osm_uid = '388496' or osm_uid = '38903' or osm_uid = '3896924' or osm_uid = '38985' or osm_uid = '3900861' or osm_uid = '3905794' or osm_uid = '3918144' or osm_uid = '3925656' or osm_uid = '3932273' or osm_uid = '395076' or osm_uid = '3959663' or osm_uid = '396987' or osm_uid = '397468' or osm_uid = '397491' or osm_uid = '399008' or osm_uid = '3992054' or osm_uid = '4017082' or osm_uid = '4026873' or osm_uid = '403518' or osm_uid = '4039728' or osm_uid = '404175' or osm_uid = '405080' or osm_uid = '4068656' or osm_uid = '4070455' or osm_uid = '4070822' or osm_uid = '407299' or osm_uid = '4075809' or osm_uid = '4078654' or osm_uid = '4079629' or osm_uid = '4096811' or osm_uid = '410313' or osm_uid = '4109876' or osm_uid = '4114163' or osm_uid = '411497' or osm_uid = '411634' or osm_uid = '412804' or osm_uid = '413286' or osm_uid = '41368' or osm_uid = '416166' or osm_uid = '4172827' or osm_uid = '4191525' or osm_uid = '4212624' or osm_uid = '4242208' or osm_uid = '424779' or osm_uid = '42680' or osm_uid = '428524' or osm_uid = '428545' or osm_uid = '4291619' or osm_uid = '430743' or osm_uid = '4316207' or osm_uid = '4317048' or osm_uid = '431837' or osm_uid = '4323399' or osm_uid = '432382' or osm_uid = '4337284' or osm_uid = '4359567' or osm_uid = '439645' or osm_uid = '4409551' or osm_uid = '4415367' or osm_uid = '4458716' or osm_uid = '4479998' or osm_uid = '4497001' or osm_uid = '4509274' or osm_uid = '4531208' or osm_uid = '4541812' or osm_uid = '454759' or osm_uid = '455164' or osm_uid = '456013' or osm_uid = '457818' or osm_uid = '458075' or osm_uid = '4587125' or osm_uid = '459239' or osm_uid = '4598206' or osm_uid = '45985' or osm_uid = '4607797' or osm_uid = '4618362' or osm_uid = '4626625' or osm_uid = '46623' or osm_uid = '4664716' or osm_uid = '466627' or osm_uid = '4667746' or osm_uid = '4683111' or osm_uid = '4689463' or osm_uid = '46926' or osm_uid = '4694' or osm_uid = '4714783' or osm_uid = '4737998' or osm_uid = '4742920' or osm_uid = '475106' or osm_uid = '475800' or osm_uid = '477289' or osm_uid = '477427' or osm_uid = '479574' or osm_uid = '4817367' or osm_uid = '4820878' or osm_uid = '482491' or osm_uid = '4841912' or osm_uid = '4860523' or osm_uid = '4870999' or osm_uid = '4892183' or osm_uid = '489324' or osm_uid = '4902241' or osm_uid = '490500' or osm_uid = '4949658' or osm_uid = '4960446' or osm_uid = '4967947' or osm_uid = '499672' or osm_uid = '5006531' or osm_uid = '500789' or osm_uid = '5007892' or osm_uid = '5008160' or osm_uid = '501118' or osm_uid = '5011295' or osm_uid = '5011732' or osm_uid = '5020122' or osm_uid = '502174' or osm_uid = '502525' or osm_uid = '5034114' or osm_uid = '5049586' or osm_uid = '5050518' or osm_uid = '5066150' or osm_uid = '507228' or osm_uid = '5103217' or osm_uid = '5111492' or osm_uid = '5113658' or osm_uid = '511782' or osm_uid = '5138029' or osm_uid = '5138852' or osm_uid = '5141635' or osm_uid = '514683' or osm_uid = '5171316' or osm_uid = '5179581' or osm_uid = '5181642' or osm_uid = '5185271' or osm_uid = '5188437' or osm_uid = '5192500' or osm_uid = '5196346' or osm_uid = '5198003' or osm_uid = '5200534' or osm_uid = '5201425' or osm_uid = '5201871' or osm_uid = '5201891' or osm_uid = '5202263' or osm_uid = '5202420' or osm_uid = '5202693' or osm_uid = '5202757' or osm_uid = '5203303' or osm_uid = '520488' or osm_uid = '5206390' or osm_uid = '5206448' or osm_uid = '5207495' or osm_uid = '5208248' or osm_uid = '5209800' or osm_uid = '521378' or osm_uid = '521954' or osm_uid = '5230057' or osm_uid = '523764' or osm_uid = '5243311' or osm_uid = '524468' or osm_uid = '5263943' or osm_uid = '5265183' or osm_uid = '5278660' or osm_uid = '5283320' or osm_uid = '529040' or osm_uid = '5295262' or osm_uid = '5307733' or osm_uid = '53300' or osm_uid = '5338836' or osm_uid = '5340439' or osm_uid = '534214' or osm_uid = '5348299' or osm_uid = '5353863' or osm_uid = '536623' or osm_uid = '5366536' or osm_uid = '537646' or osm_uid = '538831' or osm_uid = '5407518' or osm_uid = '5413963' or osm_uid = '54552' or osm_uid = '5457374' or osm_uid = '54594' or osm_uid = '5459879' or osm_uid = '5478844' or osm_uid = '550860' or osm_uid = '552197' or osm_uid = '5522575' or osm_uid = '5523697' or osm_uid = '55606' or osm_uid = '5565937' or osm_uid = '5586553' or osm_uid = '559157' or osm_uid = '559546' or osm_uid = '56277' or osm_uid = '563041' or osm_uid = '5633277' or osm_uid = '563462' or osm_uid = '5652397' or osm_uid = '5653973' or osm_uid = '565589' or osm_uid = '5656' or osm_uid = '5658027' or osm_uid = '5666137' or osm_uid = '5667707' or osm_uid = '5671811' or osm_uid = '5681163' or osm_uid = '568581' or osm_uid = '5686537' or osm_uid = '5701832' or osm_uid = '570650' or osm_uid = '5707611' or osm_uid = '5708649' or osm_uid = '570866' or osm_uid = '572200' or osm_uid = '572234' or osm_uid = '5742031' or osm_uid = '5751228' or osm_uid = '575573' or osm_uid = '5760' or osm_uid = '5765086' or osm_uid = '581181' or osm_uid = '581228' or osm_uid = '581746' or osm_uid = '582637' or osm_uid = '5854449' or osm_uid = '5864559' or osm_uid = '587343' or osm_uid = '587497' or osm_uid = '590140' or osm_uid = '591711' or osm_uid = '594980' or osm_uid = '598343' or osm_uid = '5996224' or osm_uid = '60178' or osm_uid = '6019200' or osm_uid = '602230' or osm_uid = '6049655' or osm_uid = '605664' or osm_uid = '6065909' or osm_uid = '607240' or osm_uid = '607440' or osm_uid = '608484' or osm_uid = '610772' or osm_uid = '6112529' or osm_uid = '611983' or osm_uid = '6126274' or osm_uid = '612895' or osm_uid = '6130502' or osm_uid = '613493' or osm_uid = '614067' or osm_uid = '6168330' or osm_uid = '61747' or osm_uid = '6175387' or osm_uid = '61809' or osm_uid = '620115' or osm_uid = '62013' or osm_uid = '620992' or osm_uid = '621115' or osm_uid = '6211955' or osm_uid = '621345' or osm_uid = '6213791' or osm_uid = '6226844' or osm_uid = '6237710' or osm_uid = '6245429' or osm_uid = '624588' or osm_uid = '6248313' or osm_uid = '624955' or osm_uid = '6255985' or osm_uid = '626954' or osm_uid = '62878' or osm_uid = '6293186' or osm_uid = '630267' or osm_uid = '63031' or osm_uid = '630535' or osm_uid = '631986' or osm_uid = '63340' or osm_uid = '636406' or osm_uid = '6379503' or osm_uid = '6397757' or osm_uid = '642638' or osm_uid = '645297' or osm_uid = '646152' or osm_uid = '648778' or osm_uid = '6492562' or osm_uid = '6505567' or osm_uid = '6513527' or osm_uid = '6519570' or osm_uid = '651969' or osm_uid = '652095' or osm_uid = '654350' or osm_uid = '654937' or osm_uid = '6555121' or osm_uid = '6586841' or osm_uid = '6653025' or osm_uid = '6653655' or osm_uid = '6700174' or osm_uid = '670432' or osm_uid = '672490' or osm_uid = '673026' or osm_uid = '6735880' or osm_uid = '673686' or osm_uid = '6755640' or osm_uid = '6765114' or osm_uid = '6780544' or osm_uid = '67832' or osm_uid = '6787565' or osm_uid = '679056' or osm_uid = '6797242' or osm_uid = '679794' or osm_uid = '680571' or osm_uid = '6805933' or osm_uid = '681381' or osm_uid = '6829111' or osm_uid = '685228' or osm_uid = '6865755' or osm_uid = '68873' or osm_uid = '693162' or osm_uid = '69418' or osm_uid = '6965258' or osm_uid = '699465' or osm_uid = '7001068' or osm_uid = '7001228' or osm_uid = '700170' or osm_uid = '701357' or osm_uid = '701616' or osm_uid = '702201' or osm_uid = '7037837' or osm_uid = '7051387' or osm_uid = '709568' or osm_uid = '710580' or osm_uid = '7117410' or osm_uid = '7118503' or osm_uid = '7125232' or osm_uid = '7135061' or osm_uid = '7136206' or osm_uid = '713653' or osm_uid = '713669' or osm_uid = '7140286' or osm_uid = '7142286' or osm_uid = '7160' or osm_uid = '7163579' or osm_uid = '71640' or osm_uid = '7165481' or osm_uid = '7178464' or osm_uid = '719181' or osm_uid = '7206855' or osm_uid = '7230529' or osm_uid = '72472' or osm_uid = '7299506' or osm_uid = '731617' or osm_uid = '73314' or osm_uid = '7350445' or osm_uid = '7404582' or osm_uid = '7420616' or osm_uid = '7452033' or osm_uid = '7459041' or osm_uid = '7463456' or osm_uid = '7470399' or osm_uid = '7473263' or osm_uid = '7491818' or osm_uid = '7505713' or osm_uid = '7522935' or osm_uid = '7526422' or osm_uid = '75315' or osm_uid = '7552692' or osm_uid = '7558739' or osm_uid = '7566700' or osm_uid = '7585088' or osm_uid = '7590348' or osm_uid = '7591844' or osm_uid = '75936' or osm_uid = '7644726' or osm_uid = '7645173' or osm_uid = '7662310' or osm_uid = '76678' or osm_uid = '7674414' or osm_uid = '7675673' or osm_uid = '7694099' or osm_uid = '77323' or osm_uid = '7739498' or osm_uid = '7767083' or osm_uid = '777434' or osm_uid = '7786310' or osm_uid = '782982' or osm_uid = '7850888' or osm_uid = '78863' or osm_uid = '790192' or osm_uid = '7949410' or osm_uid = '7959422' or osm_uid = '8024383' or osm_uid = '8076256' or osm_uid = '8078403' or osm_uid = '8124742' or osm_uid = '8125605' or osm_uid = '8183672' or osm_uid = '8213968' or osm_uid = '82164' or osm_uid = '8224003' or osm_uid = '8244365' or osm_uid = '8244812' or osm_uid = '8244821' or osm_uid = '8245566' or osm_uid = '8257375' or osm_uid = '8276520' or osm_uid = '8291531' or osm_uid = '8294164' or osm_uid = '83024' or osm_uid = '8311123' or osm_uid = '8324803' or osm_uid = '8339894' or osm_uid = '834411' or osm_uid = '8344547' or osm_uid = '8345830' or osm_uid = '8345931' or osm_uid = '8358968' or osm_uid = '8365476' or osm_uid = '837005' or osm_uid = '8373687' or osm_uid = '8376894' or osm_uid = '839345' or osm_uid = '8399506' or osm_uid = '8404294' or osm_uid = '8404734' or osm_uid = '8404848' or osm_uid = '8417514' or osm_uid = '842068' or osm_uid = '8423831' or osm_uid = '8432495' or osm_uid = '8432550' or osm_uid = '8468443' or osm_uid = '84777' or osm_uid = '8486599' or osm_uid = '8494347' or osm_uid = '8494394' or osm_uid = '8498246' or osm_uid = '85635' or osm_uid = '87428' or osm_uid = '87781' or osm_uid = '900157' or osm_uid = '901366' or osm_uid = '90283' or osm_uid = '911036' or osm_uid = '917581' or osm_uid = '923101' or osm_uid = '92655' or osm_uid = '92878' or osm_uid = '94085' or osm_uid = '94278' or osm_uid = '943860' or osm_uid = '96060' or osm_uid = '965935' or osm_uid = '971034' or osm_uid = '971299' or osm_uid = '971759' or osm_uid = '972111' or osm_uid = '972521' or osm_uid = '973860' or osm_uid = '974258' or osm_uid = '974820' or osm_uid = '976991' or osm_uid = '98712' or osm_uid = '98807' or osm_uid = '98964' or osm_uid = '989915' or osm_uid = '990288' or osm_uid = '99620' or osm_uid = '997917')
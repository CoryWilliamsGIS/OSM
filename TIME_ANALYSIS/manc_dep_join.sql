select tbl0.name, tbl1.school, tbl2.college, tbl3.pub, tbl4.bar, tbl5.pharmacy,
tbl6.hospital, tbl7.dentist, tbl8.clinic, tbl9.police, tbl10.bank, tbl11.atm,
tbl12.restaurant, tbl13.fast_food, tbl14.toilets, tbl15.drinking_water, 
tbl16.place_of_worship, tbl17.bus_stop, tbl18.street_lamp, tbl19.hotel, 
tbl50.industrial, tbl20.apartm, tbl21.house, tbl22.church, tbl23.mosque,
tbl24.footway, tbl25.primary_road, tbl26.residential, tbl27.unclassified
from (
(select name from manc_consts
)tbl0
full outer join
(
SELECT public.manc_consts.name, count(public.gm2017_final_poi.way) AS school
FROM public.manc_consts LEFT JOIN public.gm2017_final_poi 
ON st_contains(public.manc_consts.geom, public.gm2017_final_poi.way) 
WHERE public.gm2017_final_poi.amenity = 'school'
GROUP BY public.manc_consts.name,
public.manc_consts.name
)tbl1
on tbl0.name = tbl1.name
full outer join
(
SELECT public.manc_consts.name, count(public.gm2017_final_poi.way) AS college
FROM public.manc_consts LEFT JOIN public.gm2017_final_poi 
ON st_contains(public.manc_consts.geom, public.gm2017_final_poi.way) 
WHERE public.gm2017_final_poi.amenity = 'college'
GROUP BY public.manc_consts.name,
public.manc_consts.name
)tbl2
on tbl0.name = tbl2.name
full outer join
(
SELECT public.manc_consts.name, count(public.gm2017_final_poi.way) AS pub
FROM public.manc_consts LEFT JOIN public.gm2017_final_poi 
ON st_contains(public.manc_consts.geom, public.gm2017_final_poi.way) 
WHERE public.gm2017_final_poi.amenity = 'pub'
GROUP BY public.manc_consts.name,
public.manc_consts.name
)tbl3
on tbl0.name = tbl3.name
full outer join
(
SELECT public.manc_consts.name, count(public.gm2017_final_poi.way) AS bar
FROM public.manc_consts LEFT JOIN public.gm2017_final_poi 
ON st_contains(public.manc_consts.geom, public.gm2017_final_poi.way) 
WHERE public.gm2017_final_poi.amenity = 'bar'
GROUP BY public.manc_consts.name,
public.manc_consts.name
)tbl4
on tbl0.name = tbl4.name
full outer join
(
SELECT public.manc_consts.name, count(public.gm2017_final_poi.way) AS pharmacy
FROM public.manc_consts LEFT JOIN public.gm2017_final_poi 
ON st_contains(public.manc_consts.geom, public.gm2017_final_poi.way) 
WHERE public.gm2017_final_poi.amenity = 'pharmacy'
GROUP BY public.manc_consts.name,
public.manc_consts.name
)tbl5
on tbl0.name = tbl5.name
full outer join
(
SELECT public.manc_consts.name, count(public.gm2017_final_poi.way) AS hospital
FROM public.manc_consts LEFT JOIN public.gm2017_final_poi 
ON st_contains(public.manc_consts.geom, public.gm2017_final_poi.way) 
WHERE public.gm2017_final_poi.amenity = 'hospital'
GROUP BY public.manc_consts.name,
public.manc_consts.name
)tbl6
on tbl0.name = tbl6.name
full outer join
(
SELECT public.manc_consts.name, count(public.gm2017_final_poi.way) AS dentist
FROM public.manc_consts LEFT JOIN public.gm2017_final_poi 
ON st_contains(public.manc_consts.geom, public.gm2017_final_poi.way) 
WHERE public.gm2017_final_poi.amenity = 'dentist'
GROUP BY public.manc_consts.name,
public.manc_consts.name
)tbl7
on tbl0.name = tbl7.name
full outer join
(
SELECT public.manc_consts.name, count(public.gm2017_final_poi.way) AS clinic
FROM public.manc_consts LEFT JOIN public.gm2017_final_poi 
ON st_contains(public.manc_consts.geom, public.gm2017_final_poi.way) 
WHERE public.gm2017_final_poi.amenity = 'clinic'
GROUP BY public.manc_consts.name,
public.manc_consts.name
)tbl8
on tbl0.name = tbl8.name
full outer join
(
SELECT public.manc_consts.name, count(public.gm2017_final_poi.way) AS police
FROM public.manc_consts LEFT JOIN public.gm2017_final_poi 
ON st_contains(public.manc_consts.geom, public.gm2017_final_poi.way) 
WHERE public.gm2017_final_poi.amenity = 'police'
GROUP BY public.manc_consts.name,
public.manc_consts.name
)tbl9
on tbl0.name = tbl9.name
full outer join
(
SELECT public.manc_consts.name, count(public.gm2017_final_poi.way) AS bank
FROM public.manc_consts LEFT JOIN public.gm2017_final_poi 
ON st_contains(public.manc_consts.geom, public.gm2017_final_poi.way) 
WHERE public.gm2017_final_poi.amenity = 'bank'
GROUP BY public.manc_consts.name,
public.manc_consts.name
)tbl10
on tbl0.name = tbl10.name
full outer join
(
SELECT public.manc_consts.name, count(public.gm2017_final_poi.way) AS atm
FROM public.manc_consts LEFT JOIN public.gm2017_final_poi 
ON st_contains(public.manc_consts.geom, public.gm2017_final_poi.way) 
WHERE public.gm2017_final_poi.amenity = 'atm'
GROUP BY public.manc_consts.name,
public.manc_consts.name
)tbl11
on tbl0.name = tbl11.name
full outer join
(
SELECT public.manc_consts.name, count(public.gm2017_final_poi.way) AS restaurant
FROM public.manc_consts LEFT JOIN public.gm2017_final_poi 
ON st_contains(public.manc_consts.geom, public.gm2017_final_poi.way) 
WHERE public.gm2017_final_poi.amenity = 'restaurant'
GROUP BY public.manc_consts.name,
public.manc_consts.name
)tbl12
on tbl0.name = tbl12.name
full outer join
(
SELECT public.manc_consts.name, count(public.gm2017_final_poi.way) AS fast_food
FROM public.manc_consts LEFT JOIN public.gm2017_final_poi 
ON st_contains(public.manc_consts.geom, public.gm2017_final_poi.way) 
WHERE public.gm2017_final_poi.amenity = 'fast_food'
GROUP BY public.manc_consts.name,
public.manc_consts.name
)tbl13
on tbl0.name = tbl13.name
full outer join
(
SELECT public.manc_consts.name, count(public.gm2017_final_poi.way) AS toilets
FROM public.manc_consts LEFT JOIN public.gm2017_final_poi 
ON st_contains(public.manc_consts.geom, public.gm2017_final_poi.way) 
WHERE public.gm2017_final_poi.amenity = 'toilets'
GROUP BY public.manc_consts.name,
public.manc_consts.name
)tbl14
on tbl0.name = tbl14.name
full outer join
(
SELECT public.manc_consts.name, count(public.gm2017_final_poi.way) AS drinking_water
FROM public.manc_consts LEFT JOIN public.gm2017_final_poi 
ON st_contains(public.manc_consts.geom, public.gm2017_final_poi.way) 
WHERE public.gm2017_final_poi.amenity = 'drinking_water'
GROUP BY public.manc_consts.name,
public.manc_consts.name
)tbl15
on tbl0.name = tbl15.name
full outer join
(
SELECT public.manc_consts.name, count(public.gm2017_final_poi.way) AS place_of_worship
FROM public.manc_consts LEFT JOIN public.gm2017_final_poi 
ON st_contains(public.manc_consts.geom, public.gm2017_final_poi.way) 
WHERE public.gm2017_final_poi.amenity = 'place_of_worship'
GROUP BY public.manc_consts.name,
public.manc_consts.name
)tbl16
on tbl0.name = tbl16.name
full outer join
(
SELECT public.manc_consts.name, count(public.gm2017_final_poi.way) AS bus_stop
FROM public.manc_consts LEFT JOIN public.gm2017_final_poi 
ON st_contains(public.manc_consts.geom, public.gm2017_final_poi.way) 
WHERE public.gm2017_final_poi.highway = 'bus_stop'
GROUP BY public.manc_consts.name,
public.manc_consts.name
)tbl17
on tbl0.name = tbl17.name
full outer join
(
SELECT public.manc_consts.name, count(public.gm2017_final_poi.way) AS street_lamp
FROM public.manc_consts LEFT JOIN public.gm2017_final_poi 
ON st_contains(public.manc_consts.geom, public.gm2017_final_poi.way) 
WHERE public.gm2017_final_poi.highway = 'street_lamp'
GROUP BY public.manc_consts.name,
public.manc_consts.name
)tbl18
on tbl0.name = tbl18.name
full outer join
(
SELECT public.manc_consts.name, count(public.gm2017_final_polygon.way) AS hotel
FROM public.manc_consts LEFT JOIN public.gm2017_final_polygon 
ON st_contains(public.manc_consts.geom, public.gm2017_final_polygon.way) 
WHERE public.gm2017_final_polygon.tourism = 'hotel'
GROUP BY public.manc_consts.name,
public.manc_consts.name
)tbl19
on tbl0.name = tbl19.name
full outer join
(
SELECT public.manc_consts.name, count(public.gm2017_final_polygon.way) AS industrial
FROM public.manc_consts LEFT JOIN public.gm2017_final_polygon 
ON st_contains(public.manc_consts.geom, public.gm2017_final_polygon.way) 
WHERE public.gm2017_final_polygon.building = 'industrial'
GROUP BY public.manc_consts.name,
public.manc_consts.name
)tbl50
on tbl0.name = tbl50.name
full outer join
(
SELECT public.manc_consts.name, count(public.gm2017_final_polygon.way) AS apartm
FROM public.manc_consts LEFT JOIN public.gm2017_final_polygon 
ON st_contains(public.manc_consts.geom, public.gm2017_final_polygon.way) 
WHERE public.gm2017_final_polygon.building = 'apartments'
GROUP BY public.manc_consts.name,
public.manc_consts.name
)tbl20
on tbl0.name = tbl20.name
full outer join
(
SELECT public.manc_consts.name, count(public.gm2017_final_polygon.way) AS house
FROM public.manc_consts LEFT JOIN public.gm2017_final_polygon 
ON st_contains(public.manc_consts.geom, public.gm2017_final_polygon.way) 
WHERE public.gm2017_final_polygon.building = 'house'
GROUP BY public.manc_consts.name,
public.manc_consts.name
)tbl21
on tbl0.name = tbl21.name
full outer join
(
SELECT public.manc_consts.name, count(public.gm2017_final_polygon.way) AS church
FROM public.manc_consts LEFT JOIN public.gm2017_final_polygon 
ON st_contains(public.manc_consts.geom, public.gm2017_final_polygon.way) 
WHERE public.gm2017_final_polygon.building = 'church'
GROUP BY public.manc_consts.name,
public.manc_consts.name
)tbl22
on tbl0.name = tbl22.name
full outer join
(
SELECT public.manc_consts.name, count(public.gm2017_final_polygon.way) AS mosque
FROM public.manc_consts LEFT JOIN public.gm2017_final_polygon 
ON st_contains(public.manc_consts.geom, public.gm2017_final_polygon.way) 
WHERE public.gm2017_final_polygon.building = 'mosque'
GROUP BY public.manc_consts.name,
public.manc_consts.name
)tbl23
on tbl0.name = tbl23.name
full outer join
(
--additional line queries
SELECT public.manc_consts.name, count(public.gm2017_final_line.way) AS footway
FROM public.manc_consts LEFT JOIN public.gm2017_final_line
ON st_contains(public.manc_consts.geom, public.gm2017_final_line.way) 
WHERE public.gm2017_final_line.highway = 'footway'
GROUP BY public.manc_consts.name,
public.manc_consts.name
)tbl24
on tbl0.name = tbl24.name
full outer join
(
SELECT public.manc_consts.name, count(public.gm2017_final_line.way) AS primary_road
FROM public.manc_consts LEFT JOIN public.gm2017_final_line
ON st_contains(public.manc_consts.geom, public.gm2017_final_line.way) 
WHERE public.gm2017_final_line.highway = 'primary'
GROUP BY public.manc_consts.name,
public.manc_consts.name
)tbl25
on tbl0.name = tbl25.name
full outer join
(
SELECT public.manc_consts.name, count(public.gm2017_final_line.way) AS residential
FROM public.manc_consts LEFT JOIN public.gm2017_final_line
ON st_contains(public.manc_consts.geom, public.gm2017_final_line.way) 
WHERE public.gm2017_final_line.highway = 'residential'
GROUP BY public.manc_consts.name,
public.manc_consts.name
)tbl26
on tbl0.name = tbl26.name
full outer join
(
SELECT public.manc_consts.name, count(public.gm2017_final_line.way) AS unclassified
FROM public.manc_consts LEFT JOIN public.gm2017_final_line
ON st_contains(public.manc_consts.geom, public.gm2017_final_line.way) 
WHERE public.gm2017_final_line.highway = 'unclassified'
GROUP BY public.manc_consts.name,
public.manc_consts.name
)tbl27
on tbl0.name = tbl27.name)
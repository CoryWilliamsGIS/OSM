select tbl0.constituen, tbl1.school, tbl2.college, tbl3.pub, tbl4.bar, tbl5.pharmacy,
tbl6.hospital, tbl7.dentist, tbl8.clinic, tbl9.police, tbl10.bank, tbl11.atm,
tbl12.restaurant, tbl13.fast_food, tbl14.toilets, tbl15.drinking_water, 
tbl16.place_of_worship, tbl17.bus_stop, tbl18.street_lamp, tbl19.hotel, 
tbl50.industrial, tbl20.apartm, tbl21.house, tbl22.church, tbl23.mosque,
tbl24.footway, tbl25.primary_road, tbl26.residential, tbl27.unclassified
from (
(select constituen from nairobi_consts
)tbl0
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS school
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'school'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen
)tbl1
on tbl0.constituen = tbl1.constituen
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS college
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'college'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen
)tbl2
on tbl0.constituen = tbl2.constituen
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS pub
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'pub'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen
)tbl3
on tbl0.constituen = tbl3.constituen
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS bar
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'bar'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen
)tbl4
on tbl0.constituen = tbl4.constituen
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS pharmacy
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'pharmacy'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen
)tbl5
on tbl0.constituen = tbl5.constituen
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS hospital
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'hospital'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen
)tbl6
on tbl0.constituen = tbl6.constituen
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS dentist
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'dentist'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen
)tbl7
on tbl0.constituen = tbl7.constituen
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS clinic
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'clinic'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen
)tbl8
on tbl0.constituen = tbl8.constituen
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS police
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'police'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen
)tbl9
on tbl0.constituen = tbl9.constituen
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS bank
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'bank'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen
)tbl10
on tbl0.constituen = tbl10.constituen
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS atm
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'atm'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen
)tbl11
on tbl0.constituen = tbl11.constituen
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS restaurant
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'restaurant'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen
)tbl12
on tbl0.constituen = tbl12.constituen
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS fast_food
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'fast_food'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen
)tbl13
on tbl0.constituen = tbl13.constituen
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS toilets
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'toilets'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen
)tbl14
on tbl0.constituen = tbl14.constituen
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS drinking_water
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'drinking_water'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen
)tbl15
on tbl0.constituen = tbl15.constituen
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS place_of_worship
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.amenity = 'place_of_worship'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen
)tbl16
on tbl0.constituen = tbl16.constituen
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS bus_stop
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.highway = 'bus_stop'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen
)tbl17
on tbl0.constituen = tbl17.constituen
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2012_final_poi.way) AS street_lamp
FROM public.nairobi_consts LEFT JOIN public.n2012_final_poi 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_poi.way) 
WHERE public.n2012_final_poi.highway = 'street_lamp'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen
)tbl18
on tbl0.constituen = tbl18.constituen
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2012_final_polygon.way) AS hotel
FROM public.nairobi_consts LEFT JOIN public.n2012_final_polygon 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_polygon.way) 
WHERE public.n2012_final_polygon.tourism = 'hotel'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen
)tbl19
on tbl0.constituen = tbl19.constituen
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2012_final_polygon.way) AS industrial
FROM public.nairobi_consts LEFT JOIN public.n2012_final_polygon 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_polygon.way) 
WHERE public.n2012_final_polygon.building = 'industrial'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen
)tbl50
on tbl0.constituen = tbl50.constituen
full outer join
(
SELECT public.nairobi_consts.constituen as constituen, count(public.n2012_final_polygon.way) AS apartm
FROM public.nairobi_consts LEFT JOIN public.n2012_final_polygon 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_polygon.way) 
WHERE public.n2012_final_polygon.building = 'apartments'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen
)tbl20
on tbl0.constituen = tbl20.constituen
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2012_final_polygon.way) AS house
FROM public.nairobi_consts LEFT JOIN public.n2012_final_polygon 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_polygon.way) 
WHERE public.n2012_final_polygon.building = 'house'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen
)tbl21
on tbl0.constituen = tbl21.constituen
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2012_final_polygon.way) AS church
FROM public.nairobi_consts LEFT JOIN public.n2012_final_polygon 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_polygon.way) 
WHERE public.n2012_final_polygon.building = 'church'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen
)tbl22
on tbl0.constituen = tbl22.constituen
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2012_final_polygon.way) AS mosque
FROM public.nairobi_consts LEFT JOIN public.n2012_final_polygon 
ON st_contains(public.nairobi_consts.geom, public.n2012_final_polygon.way) 
WHERE public.n2012_final_polygon.building = 'mosque'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen
)tbl23
on tbl0.constituen = tbl23.constituen
full outer join
(
--additional line queries
SELECT public.nairobi_consts.constituen, count(public.n2012_final_line.way) AS footway
FROM public.nairobi_consts LEFT JOIN public.n2012_final_line
ON st_contains(public.nairobi_consts.geom, public.n2012_final_line.way) 
WHERE public.n2012_final_line.highway = 'footway'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen
)tbl24
on tbl0.constituen = tbl24.constituen
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2012_final_line.way) AS primary_road
FROM public.nairobi_consts LEFT JOIN public.n2012_final_line
ON st_contains(public.nairobi_consts.geom, public.n2012_final_line.way) 
WHERE public.n2012_final_line.highway = 'primary'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen
)tbl25
on tbl0.constituen = tbl25.constituen
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2012_final_line.way) AS residential
FROM public.nairobi_consts LEFT JOIN public.n2012_final_line
ON st_contains(public.nairobi_consts.geom, public.n2012_final_line.way) 
WHERE public.n2012_final_line.highway = 'residential'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen
)tbl26
on tbl0.constituen = tbl26.constituen
full outer join
(
SELECT public.nairobi_consts.constituen, count(public.n2012_final_line.way) AS unclassified
FROM public.nairobi_consts LEFT JOIN public.n2012_final_line
ON st_contains(public.nairobi_consts.geom, public.n2012_final_line.way) 
WHERE public.n2012_final_line.highway = 'unclassified'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen
)tbl27
on tbl0.constituen = tbl27.constituen)
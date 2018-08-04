--NAIROBI
--CONSTITUENCY ANALYSIS
--DEPENDENT VARIABLES 



SELECT public.nairobi_consts.constituen, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_consts LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_consts.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.amenity = 'school'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen

SELECT public.nairobi_consts.constituen, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_consts LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_consts.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.amenity = 'college'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen

SELECT public.nairobi_consts.constituen, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_consts LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_consts.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.amenity = 'pub'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen

SELECT public.nairobi_consts.constituen, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_consts LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_consts.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.amenity = 'bar'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen

SELECT public.nairobi_consts.constituen, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_consts LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_consts.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.amenity = 'pharmacy'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen

SELECT public.nairobi_consts.constituen, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_consts LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_consts.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.amenity = 'hospital'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen

SELECT public.nairobi_consts.constituen, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_consts LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_consts.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.amenity = 'clinic'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen

SELECT public.nairobi_consts.constituen, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_consts LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_consts.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.amenity = 'police'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen

SELECT public.nairobi_consts.constituen, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_consts LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_consts.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.amenity = 'bank'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen

SELECT public.nairobi_consts.constituen, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_consts LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_consts.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.amenity = 'atm'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen

SELECT public.nairobi_consts.constituen, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_consts LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_consts.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.amenity = 'restaurant'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen

SELECT public.nairobi_consts.constituen, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_consts LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_consts.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.amenity = 'fast_food'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen

SELECT public.nairobi_consts.constituen, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_consts LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_consts.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.amenity = 'toilets'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen

SELECT public.nairobi_consts.constituen, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_consts LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_consts.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.amenity = 'drinking_water'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen

SELECT public.nairobi_consts.constituen, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_consts LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_consts.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.amenity = 'place_of_worship'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen

SELECT public.nairobi_consts.constituen, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_consts LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_consts.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.highway = 'bus_stop'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen

SELECT public.nairobi_consts.constituen, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_consts LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_consts.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.highway = 'street_lamp'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen

SELECT public.nairobi_consts.constituen, count(public.nairobi_final_polygon3.way) AS total
FROM public.nairobi_consts LEFT JOIN public.nairobi_final_polygon3 
ON st_contains(public.nairobi_consts.geom, public.nairobi_final_polygon3.way) 
WHERE public.nairobi_final_polygon3.tourism = 'hotel'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen

SELECT public.nairobi_consts.constituen, count(public.nairobi_final_polygon3.way) AS total
FROM public.nairobi_consts LEFT JOIN public.nairobi_final_polygon3 
ON st_contains(public.nairobi_consts.geom, public.nairobi_final_polygon3.way) 
WHERE public.nairobi_final_polygon3.building = 'industrial'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen

SELECT public.nairobi_consts.constituen, count(public.nairobi_final_polygon3.way) AS total
FROM public.nairobi_consts LEFT JOIN public.nairobi_final_polygon3 
ON st_contains(public.nairobi_consts.geom, public.nairobi_final_polygon3.way) 
WHERE public.nairobi_final_polygon3.building = 'apartments'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen

SELECT public.nairobi_consts.constituen, count(public.nairobi_final_polygon3.way) AS total
FROM public.nairobi_consts LEFT JOIN public.nairobi_final_polygon3 
ON st_contains(public.nairobi_consts.geom, public.nairobi_final_polygon3.way) 
WHERE public.nairobi_final_polygon3.building = 'house'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen

SELECT public.nairobi_consts.constituen, count(public.nairobi_final_polygon3.way) AS total
FROM public.nairobi_consts LEFT JOIN public.nairobi_final_polygon3 
ON st_contains(public.nairobi_consts.geom, public.nairobi_final_polygon3.way) 
WHERE public.nairobi_final_polygon3.building = 'church'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen

SELECT public.nairobi_consts.constituen, count(public.nairobi_final_polygon3.way) AS total
FROM public.nairobi_consts LEFT JOIN public.nairobi_final_polygon3 
ON st_contains(public.nairobi_consts.geom, public.nairobi_final_polygon3.way) 
WHERE public.nairobi_final_polygon3.building = 'mosque'
GROUP BY public.nairobi_consts.constituen,
public.nairobi_consts.constituen









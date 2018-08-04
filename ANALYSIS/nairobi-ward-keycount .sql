--ward analysis - Important key count

--Nairobi 


--Point:

SELECT public.nairobi_wards_polys.name, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_wards_polys LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_wards_polys.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3."access" is not null
GROUP BY public.nairobi_wards_polys.name;

SELECT public.nairobi_wards_polys.name, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_wards_polys LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_wards_polys.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.amenity is not null
GROUP BY public.nairobi_wards_polys.name;

SELECT public.nairobi_wards_polys.name, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_wards_polys LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_wards_polys.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.building is not null
GROUP BY public.nairobi_wards_polys.name;

SELECT public.nairobi_wards_polys.name, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_wards_polys LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_wards_polys.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.barrier is not null
GROUP BY public.nairobi_wards_polys.name;

SELECT public.nairobi_wards_polys.name, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_wards_polys LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_wards_polys.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.denomination is not null
GROUP BY public.nairobi_wards_polys.name;

SELECT public.nairobi_wards_polys.name, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_wards_polys LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_wards_polys.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.foot is not null
GROUP BY public.nairobi_wards_polys.name;

SELECT public.nairobi_wards_polys.name, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_wards_polys LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_wards_polys.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.highway is not null
GROUP BY public.nairobi_wards_polys.name;

SELECT public.nairobi_wards_polys.name, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_wards_polys LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_wards_polys.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.leisure is not null
GROUP BY public.nairobi_wards_polys.name;

SELECT public.nairobi_wards_polys.name, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_wards_polys LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_wards_polys.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3."natural" is not null
GROUP BY public.nairobi_wards_polys.name;

SELECT public.nairobi_wards_polys.name, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_wards_polys LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_wards_polys.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.public_transport is not null
GROUP BY public.nairobi_wards_polys.name;

SELECT public.nairobi_wards_polys.name, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_wards_polys LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_wards_polys.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.religion is not null
GROUP BY public.nairobi_wards_polys.name;

SELECT public.nairobi_wards_polys.name, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_wards_polys LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_wards_polys.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.shop is not null
GROUP BY public.nairobi_wards_polys.name;

SELECT public.nairobi_wards_polys.name, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_wards_polys LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_wards_polys.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.sport is not null
GROUP BY public.nairobi_wards_polys.name;

SELECT public.nairobi_wards_polys.name, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_wards_polys LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_wards_polys.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.surface is not null
GROUP BY public.nairobi_wards_polys.name;

SELECT public.nairobi_wards_polys.name, count(public.nairobi_final_poi3.way) AS total
FROM public.nairobi_wards_polys LEFT JOIN public.nairobi_final_poi3 
ON st_contains(public.nairobi_wards_polys.geom, public.nairobi_final_poi3.way) 
WHERE public.nairobi_final_poi3.tourism is not null
GROUP BY public.nairobi_wards_polys.name;


--line

--poly


--manc
--point
--line
--poly

SELECT public.manchester_wards_polys2011.name, count(*) AS total
FROM public.manchester_wards_polys2011 LEFT JOIN public.manchester_final_poi3 
ON st_contains(public.manchester_wards_polys2011.geom, public.manchester_final_poi3.way) 
WHERE public.manchester_final_poi3.amenity = 
GROUP BY public.manchester_wards_polys2011.name;

--and many more amenities...

SELECT public.manchester_wards_polys2011.name, count(*) AS total
FROM public.manchester_wards_polys2011 LEFT JOIN public.manchester_final_poi3 
ON st_contains(public.manchester_wards_polys2011.geom, public.manchester_final_poi3.way) 
WHERE public.manchester_final_poi3.highway = 'bus_stop'
GROUP BY public.manchester_wards_polys2011.name;

SELECT public.manchester_wards_polys2011.name, count(*) AS total
FROM public.manchester_wards_polys2011 LEFT JOIN public.manchester_final_poi3 
ON st_contains(public.manchester_wards_polys2011.geom, public.manchester_final_poi3.way) 
WHERE public.manchester_final_poi3.highway = 'street_lamp'
GROUP BY public.manchester_wards_polys2011.name;

SELECT public.manchester_wards_polys2011.name, count(*) AS total
FROM public.manchester_wards_polys2011 LEFT JOIN public.manc_final_polygon3 
ON st_contains(public.manchester_wards_polys2011.geom, public.manc_final_polygon3.way) 
WHERE public.manc_final_polygon3.tourism = 'hotel'
GROUP BY public.manchester_wards_polys2011.name;

SELECT public.manchester_wards_polys2011.name, count(*) AS total
FROM public.manchester_wards_polys2011 LEFT JOIN public.manc_final_polygon3 
ON st_contains(public.manchester_wards_polys2011.geom, public.manc_final_polygon3.way) 
WHERE public.manc_final_polygon3.building = 'industrial'
GROUP BY public.manchester_wards_polys2011.name;

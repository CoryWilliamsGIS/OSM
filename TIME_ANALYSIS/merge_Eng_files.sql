--merge england files together

--2011
create table eng2011_point as (
select * from public.eng_gm2011_point
union
select * from public.eng_gm2011_1_point
)

create table eng2011_point as (
select * from public.eng_gm2011_line
union
select * from public.eng_gm2011_1_line
)

create table eng2011_polygon as (
select * from public.eng_gm2011_polygon
union
select * from public.eng_gm2011_1_polygon
)

--2012
create table eng2012_point as (
select * from public.eng_gm2012_point
union
select * from public.eng_gm2012_2_point
)

create table eng2012_line as (
select * from public.eng_gm2012_line
union
select * from public.eng_gm2012_2_line
)

create table eng2012_polygon as (
select * from public.eng_gm2012_polygon
union
select * from public.eng_gm2012_2_polygon
)

--2013 -- CANNOT BE DONE YET - 1 OSM2PGSQL FILE TO GO!!!
create table eng2013_point as (
select * from public.eng_gm2013_point
union
select * from public.eng_gm2013_2_point
union
select * from public.eng_gm2013_3_point
)

create table eng2013_line as (
select * from public.eng_gm2013_line
union
select * from public.eng_gm2013_2_line
union
select * from public.eng_gm2013_3_line
)

create table eng2013_polygon as (
select * from public.eng_gm2013_polygon
union
select * from public.eng_gm2013_2_polygon
union
select * from public.eng_gm2013_3_polygon
)

--2014
create table eng2014_point as (
select * from public.eng_gm2014_point
union
select * from public.eng_gm2014_2_point
union
select * from public.eng_gm2014_3_point
)

create table eng2014_line as (
select * from public.eng_gm2014_line
union
select * from public.eng_gm2014_2_line
union
select * from public.eng_gm2014_3_line
)

create table eng2014_polygon as (
select * from public.eng_gm2014_polygon
union
select * from public.eng_gm2014_2_polygon
union
select * from public.eng_gm2014_3_polygon
)

--2015
create table eng2015_point as (
select * from public.eng_gm2015_point
union
select * from public.eng_gm2015_2_point
union
select * from public.eng_gm2015_3_point
union
select * from public.eng_gm2015_4_point
);

create table eng2015_line as (
select * from public.eng_gm2015_line
union
select * from public.eng_gm2015_2_line
union
select * from public.eng_gm2015_3_line
union
select * from public.eng_gm2015_4_line
);

create table eng2015_polygon as (
select * from public.eng_gm2015_polygon
union
select * from public.eng_gm2015_2_polygon
union
select * from public.eng_gm2015_3_polygon
union
select * from public.eng_gm2015_4_polygon
);

--2016
create table eng2016_point as (
select * from public.eng_gm2016_1_point
union
select * from public.eng_gm2016_2_point
union
select * from public.eng_gm2016_3_point
union
select * from public.eng_gm2016_4_point
);

create table eng2016_line as (
select * from public.eng_gm2016_1_line
union
select * from public.eng_gm2016_2_line
union
select * from public.eng_gm2016_3_line
union
select * from public.eng_gm2016_4_line
);

create table eng2016_polygon as (
select * from public.eng_gm2016_1_polygon
union
select * from public.eng_gm2016_2_polygon
union
select * from public.eng_gm2016_3_polygon
union
select * from public.eng_gm2016_4_polygon
);

--2017
create table eng2017_point as (
select * from public.eng_gm2017_1_point
union
select * from public.eng_gm2017_2_point
union
select * from public.eng_gm2017_3_point
union
select * from public.eng_gm2017_4_point
union
select * from public.eng_gm2017_5_point
);

create table eng2017_line as (
select * from public.eng_gm2017_1_line
union
select * from public.eng_gm2017_2_line
union
select * from public.eng_gm2017_3_line
union
select * from public.eng_gm2017_4_line
union
select * from public.eng_gm2017_5_line
);

create table eng2017_polygon as (
select * from public.eng_gm2017_1_polygon
union
select * from public.eng_gm2017_2_polygon
union
select * from public.eng_gm2017_3_polygon
union
select * from public.eng_gm2017_4_polygon
union
select * from public.eng_gm2017_5_polygon
);

--2018 - CANT BE DONE YET, ONE MORE OSM2PGSQL TO BE DONE
create table eng2018_point as (
select * from public.eng_gm2018_1_point
union
select * from public.eng_gm2018_2_point
union
select * from public.eng_gm2018_3_point
);

create table eng2018_line as (
select * from public.eng_gm2018_1_line
union
select * from public.eng_gm2018_2_line
union
select * from public.eng_gm2018_3_line
);

create table eng2018_polygon as (
select * from public.eng_gm2018_1_polygon
union
select * from public.eng_gm2018_2_polygon
union
select * from public.eng_gm2018_3_polygon
);



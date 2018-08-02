create table n_bulkcheck_polygon as (
select osm_timestamp::date, osm_uid, count(*)
from public.nairobihot_polygon
group by osm_timestamp::date, osm_uid
order by count(*) desc
)

create table n_bulkcheck_point as (
select osm_timestamp::date, osm_uid, count(*)
from public.nairobihot_point
group by osm_timestamp::date, osm_uid
order by count(*) desc
)

create table n_bulkcheck_line as (
select osm_timestamp::date, osm_uid, count(*)
from public.nairobihot_line
group by osm_timestamp::date, osm_uid
order by count(*) desc
)

create table nairobihot_point2 as (
select * from nairobihot_point)

create table nairobihot_line2 as (
select * from nairobihot_line)

create table nairobihot_polygon2 as (
select * from nairobihot_polygon)




delete from nairobihot_point2 where osm_uid = '617871' and osm_timestamp::date = '2017-04-27' or osm_uid = '617871' and osm_timestamp::date = '2017-05-04' or osm_uid = '617871' and osm_timestamp::date = '2017-04-26' or osm_uid = '123394' and osm_timestamp::date = '2018-06-26' or osm_uid = '617871' and osm_timestamp::date = '2017-05-09' or osm_uid = '6821322' and osm_timestamp::date = '2017-11-11' or osm_uid = '123394' and osm_timestamp::date = '2018-06-27' or osm_uid = '617871' and osm_timestamp::date = '2017-05-08' or osm_uid = '123394' and osm_timestamp::date = '2018-05-09' or osm_uid = '6821322' and osm_timestamp::date = '2017-11-09' or osm_uid = '408968' and osm_timestamp::date = '2011-09-15' or osm_uid = '6821322' and osm_timestamp::date = '2017-11-10' or osm_uid = '596047' and osm_timestamp::date = '2014-05-10' or osm_uid = '408968' and osm_timestamp::date = '2011-09-08' or osm_uid = '6821322' and osm_timestamp::date = '2017-11-13' or osm_uid = '261050' and osm_timestamp::date = '2017-12-22' or osm_uid = '123394' and osm_timestamp::date = '2018-05-10' or osm_uid = '123394' and osm_timestamp::date = '2018-05-08' or osm_uid = '7529098' and osm_timestamp::date = '2018-06-27' or osm_uid = '7529098' and osm_timestamp::date = '2018-02-27' or osm_uid = '123394' and osm_timestamp::date = '2018-05-06' or osm_uid = '261050' and osm_timestamp::date = '2017-12-20' or osm_uid = '3844079' and osm_timestamp::date = '2016-04-19' or osm_uid = '617871' and osm_timestamp::date = '2017-04-24' or osm_uid = '3356208' and osm_timestamp::date = '2015-11-14' or osm_uid = '647654' and osm_timestamp::date = '2017-03-15' or osm_uid = '1213353' and osm_timestamp::date = '2013-11-22' or osm_uid = '261050' and osm_timestamp::date = '2018-02-06' or osm_uid = '7634869' and osm_timestamp::date = '2018-02-18' or osm_uid = '60110' and osm_timestamp::date = '2012-10-06' or osm_uid = '261050' and osm_timestamp::date = '2018-02-08' or osm_uid = '647654' and osm_timestamp::date = '2017-03-14' or osm_uid = '408968' and osm_timestamp::date = '2011-09-17' or osm_uid = '408968' and osm_timestamp::date = '2011-08-11' or osm_uid = '215343' and osm_timestamp::date = '2010-01-12' or osm_uid = '408968' and osm_timestamp::date = '2011-07-29' or osm_uid = '261050' and osm_timestamp::date = '2018-01-12' or osm_uid = '1122708' and osm_timestamp::date = '2018-05-25' or osm_uid = '1923406' and osm_timestamp::date = '2014-02-10' or osm_uid = '261050' and osm_timestamp::date = '2018-01-10' or osm_uid = '123394' and osm_timestamp::date = '2018-05-04' or osm_uid = '261050' and osm_timestamp::date = '2015-11-10' or osm_uid = '261050' and osm_timestamp::date = '2016-04-20' or osm_uid = '343553' and osm_timestamp::date = '2016-08-01' or osm_uid = '76281' and osm_timestamp::date = '2015-10-08' or osm_uid = '408968' and osm_timestamp::date = '2011-07-26' or osm_uid = '408968' and osm_timestamp::date = '2011-08-16' or osm_uid = '60110' and osm_timestamp::date = '2012-12-26' or osm_uid = '550560' and osm_timestamp::date = '2017-09-14' or osm_uid = '408968' and osm_timestamp::date = '2011-07-28' or osm_uid = '408968' and osm_timestamp::date = '2011-07-30' or osm_uid = '123394' and osm_timestamp::date = '2018-05-07' or osm_uid = '408968' and osm_timestamp::date = '2011-08-09' or osm_uid = '261050' and osm_timestamp::date = '2017-12-19' or osm_uid = '261050' and osm_timestamp::date = '2017-12-14' or osm_uid = '18236' and osm_timestamp::date = '2009-04-13' or osm_uid = '408968' and osm_timestamp::date = '2011-09-11' or osm_uid = '261050' and osm_timestamp::date = '2018-01-02' or osm_uid = '647654' and osm_timestamp::date = '2017-03-13' or osm_uid = '60110' and osm_timestamp::date = '2012-10-01' or osm_uid = '408968' and osm_timestamp::date = '2011-09-05' or osm_uid = '261050' and osm_timestamp::date = '2016-04-22' or osm_uid = '261050' and osm_timestamp::date = '2016-02-29' or osm_uid = '6821322' and osm_timestamp::date = '2017-11-08' or osm_uid = '343553' and osm_timestamp::date = '2011-02-17' or osm_uid = '261050' and osm_timestamp::date = '2017-10-16' or osm_uid = '261050' and osm_timestamp::date = '2016-02-12' or osm_uid = '18236' and osm_timestamp::date = '2008-07-26' or osm_uid = '408968' and osm_timestamp::date = '2011-10-13' or osm_uid = '408968' and osm_timestamp::date = '2011-08-28' or osm_uid = '6957132' and osm_timestamp::date = '2017-11-10' or osm_uid = '7543013' and osm_timestamp::date = '2018-06-27' or osm_uid = '2778924' and osm_timestamp::date = '2016-05-17' or osm_uid = '219668' and osm_timestamp::date = '2013-11-17' or osm_uid = '18236' and osm_timestamp::date = '2008-07-25' or osm_uid = '74746' and osm_timestamp::date = '2017-05-26' or osm_uid = '261050' and osm_timestamp::date = '2016-04-25' or osm_uid = '261050' and osm_timestamp::date = '2018-02-01' or osm_uid = '1805170' and osm_timestamp::date = '2015-08-11' or osm_uid = '261050' and osm_timestamp::date = '2017-10-17' or osm_uid = '408968' and osm_timestamp::date = '2011-09-20' or osm_uid = '261050' and osm_timestamp::date = '2016-02-24' or osm_uid = '343553' and osm_timestamp::date = '2015-09-04' or osm_uid = '408968' and osm_timestamp::date = '2011-08-08' or osm_uid = '408968' and osm_timestamp::date = '2011-08-20' or osm_uid = '4416051' and osm_timestamp::date = '2017-01-16' or osm_uid = '7529098' and osm_timestamp::date = '2018-06-25' or osm_uid = '6957132' and osm_timestamp::date = '2017-11-11' or osm_uid = '6318104' and osm_timestamp::date = '2018-01-21' or osm_uid = '3139325' and osm_timestamp::date = '2015-08-10' or osm_uid = '7543013' and osm_timestamp::date = '2018-06-25' or osm_uid = '7547309' and osm_timestamp::date = '2018-06-19' or osm_uid = '8408878' and osm_timestamp::date = '2018-06-19' or osm_uid = '527721' and osm_timestamp::date = '2017-05-22' or osm_uid = '161619' and osm_timestamp::date = '2017-05-21' or osm_uid = '161619' and osm_timestamp::date = '2017-04-29' or osm_uid = '616774' and osm_timestamp::date = '2018-06-15' 

delete from nairobihot_line2 where osm_uid = '617871' and osm_timestamp::date = '2017-04-27' or osm_uid = '617871' and osm_timestamp::date = '2017-05-04' or osm_uid = '617871' and osm_timestamp::date = '2017-04-26' or osm_uid = '123394' and osm_timestamp::date = '2018-06-26' or osm_uid = '617871' and osm_timestamp::date = '2017-05-09' or osm_uid = '6821322' and osm_timestamp::date = '2017-11-11' or osm_uid = '123394' and osm_timestamp::date = '2018-06-27' or osm_uid = '617871' and osm_timestamp::date = '2017-05-08' or osm_uid = '123394' and osm_timestamp::date = '2018-05-09' or osm_uid = '6821322' and osm_timestamp::date = '2017-11-09' or osm_uid = '408968' and osm_timestamp::date = '2011-09-15' or osm_uid = '6821322' and osm_timestamp::date = '2017-11-10' or osm_uid = '596047' and osm_timestamp::date = '2014-05-10' or osm_uid = '408968' and osm_timestamp::date = '2011-09-08' or osm_uid = '6821322' and osm_timestamp::date = '2017-11-13' or osm_uid = '261050' and osm_timestamp::date = '2017-12-22' or osm_uid = '123394' and osm_timestamp::date = '2018-05-10' or osm_uid = '123394' and osm_timestamp::date = '2018-05-08' or osm_uid = '7529098' and osm_timestamp::date = '2018-06-27' or osm_uid = '7529098' and osm_timestamp::date = '2018-02-27' or osm_uid = '123394' and osm_timestamp::date = '2018-05-06' or osm_uid = '261050' and osm_timestamp::date = '2017-12-20' or osm_uid = '3844079' and osm_timestamp::date = '2016-04-19' or osm_uid = '617871' and osm_timestamp::date = '2017-04-24' or osm_uid = '3356208' and osm_timestamp::date = '2015-11-14' or osm_uid = '647654' and osm_timestamp::date = '2017-03-15' or osm_uid = '1213353' and osm_timestamp::date = '2013-11-22' or osm_uid = '261050' and osm_timestamp::date = '2018-02-06' or osm_uid = '7634869' and osm_timestamp::date = '2018-02-18' or osm_uid = '60110' and osm_timestamp::date = '2012-10-06' or osm_uid = '261050' and osm_timestamp::date = '2018-02-08' or osm_uid = '647654' and osm_timestamp::date = '2017-03-14' or osm_uid = '408968' and osm_timestamp::date = '2011-09-17' or osm_uid = '408968' and osm_timestamp::date = '2011-08-11' or osm_uid = '215343' and osm_timestamp::date = '2010-01-12' or osm_uid = '408968' and osm_timestamp::date = '2011-07-29' or osm_uid = '261050' and osm_timestamp::date = '2018-01-12' or osm_uid = '1122708' and osm_timestamp::date = '2018-05-25' or osm_uid = '1923406' and osm_timestamp::date = '2014-02-10' or osm_uid = '261050' and osm_timestamp::date = '2018-01-10' or osm_uid = '123394' and osm_timestamp::date = '2018-05-04' or osm_uid = '261050' and osm_timestamp::date = '2015-11-10' or osm_uid = '261050' and osm_timestamp::date = '2016-04-20' or osm_uid = '343553' and osm_timestamp::date = '2016-08-01' or osm_uid = '76281' and osm_timestamp::date = '2015-10-08' or osm_uid = '408968' and osm_timestamp::date = '2011-07-26' or osm_uid = '408968' and osm_timestamp::date = '2011-08-16' or osm_uid = '60110' and osm_timestamp::date = '2012-12-26' or osm_uid = '550560' and osm_timestamp::date = '2017-09-14' or osm_uid = '408968' and osm_timestamp::date = '2011-07-28' or osm_uid = '408968' and osm_timestamp::date = '2011-07-30' or osm_uid = '123394' and osm_timestamp::date = '2018-05-07' or osm_uid = '408968' and osm_timestamp::date = '2011-08-09' or osm_uid = '261050' and osm_timestamp::date = '2017-12-19' or osm_uid = '261050' and osm_timestamp::date = '2017-12-14' or osm_uid = '18236' and osm_timestamp::date = '2009-04-13' or osm_uid = '408968' and osm_timestamp::date = '2011-09-11' or osm_uid = '261050' and osm_timestamp::date = '2018-01-02' or osm_uid = '647654' and osm_timestamp::date = '2017-03-13' or osm_uid = '60110' and osm_timestamp::date = '2012-10-01' or osm_uid = '408968' and osm_timestamp::date = '2011-09-05' or osm_uid = '261050' and osm_timestamp::date = '2016-04-22' or osm_uid = '261050' and osm_timestamp::date = '2016-02-29' or osm_uid = '6821322' and osm_timestamp::date = '2017-11-08' or osm_uid = '343553' and osm_timestamp::date = '2011-02-17' or osm_uid = '261050' and osm_timestamp::date = '2017-10-16' or osm_uid = '261050' and osm_timestamp::date = '2016-02-12' or osm_uid = '18236' and osm_timestamp::date = '2008-07-26' or osm_uid = '408968' and osm_timestamp::date = '2011-10-13' or osm_uid = '408968' and osm_timestamp::date = '2011-08-28' or osm_uid = '6957132' and osm_timestamp::date = '2017-11-10' or osm_uid = '7543013' and osm_timestamp::date = '2018-06-27' or osm_uid = '2778924' and osm_timestamp::date = '2016-05-17' or osm_uid = '219668' and osm_timestamp::date = '2013-11-17' or osm_uid = '18236' and osm_timestamp::date = '2008-07-25' or osm_uid = '74746' and osm_timestamp::date = '2017-05-26' or osm_uid = '261050' and osm_timestamp::date = '2016-04-25' or osm_uid = '261050' and osm_timestamp::date = '2018-02-01' or osm_uid = '1805170' and osm_timestamp::date = '2015-08-11' or osm_uid = '261050' and osm_timestamp::date = '2017-10-17' or osm_uid = '408968' and osm_timestamp::date = '2011-09-20' or osm_uid = '261050' and osm_timestamp::date = '2016-02-24' or osm_uid = '343553' and osm_timestamp::date = '2015-09-04' or osm_uid = '408968' and osm_timestamp::date = '2011-08-08' or osm_uid = '408968' and osm_timestamp::date = '2011-08-20' or osm_uid = '4416051' and osm_timestamp::date = '2017-01-16' or osm_uid = '7529098' and osm_timestamp::date = '2018-06-25' or osm_uid = '6957132' and osm_timestamp::date = '2017-11-11' or osm_uid = '6318104' and osm_timestamp::date = '2018-01-21' or osm_uid = '3139325' and osm_timestamp::date = '2015-08-10' or osm_uid = '7543013' and osm_timestamp::date = '2018-06-25' or osm_uid = '7547309' and osm_timestamp::date = '2018-06-19' or osm_uid = '8408878' and osm_timestamp::date = '2018-06-19' or osm_uid = '527721' and osm_timestamp::date = '2017-05-22' or osm_uid = '161619' and osm_timestamp::date = '2017-05-21' or osm_uid = '161619' and osm_timestamp::date = '2017-04-29' or osm_uid = '616774' and osm_timestamp::date = '2018-06-15' 

delete from nairobihot_polygon2 where osm_uid = '617871' and osm_timestamp::date = '2017-04-27' or osm_uid = '617871' and osm_timestamp::date = '2017-05-04' or osm_uid = '617871' and osm_timestamp::date = '2017-04-26' or osm_uid = '123394' and osm_timestamp::date = '2018-06-26' or osm_uid = '617871' and osm_timestamp::date = '2017-05-09' or osm_uid = '6821322' and osm_timestamp::date = '2017-11-11' or osm_uid = '123394' and osm_timestamp::date = '2018-06-27' or osm_uid = '617871' and osm_timestamp::date = '2017-05-08' or osm_uid = '123394' and osm_timestamp::date = '2018-05-09' or osm_uid = '6821322' and osm_timestamp::date = '2017-11-09' or osm_uid = '408968' and osm_timestamp::date = '2011-09-15' or osm_uid = '6821322' and osm_timestamp::date = '2017-11-10' or osm_uid = '596047' and osm_timestamp::date = '2014-05-10' or osm_uid = '408968' and osm_timestamp::date = '2011-09-08' or osm_uid = '6821322' and osm_timestamp::date = '2017-11-13' or osm_uid = '261050' and osm_timestamp::date = '2017-12-22' or osm_uid = '123394' and osm_timestamp::date = '2018-05-10' or osm_uid = '123394' and osm_timestamp::date = '2018-05-08' or osm_uid = '7529098' and osm_timestamp::date = '2018-06-27' or osm_uid = '7529098' and osm_timestamp::date = '2018-02-27' or osm_uid = '123394' and osm_timestamp::date = '2018-05-06' or osm_uid = '261050' and osm_timestamp::date = '2017-12-20' or osm_uid = '3844079' and osm_timestamp::date = '2016-04-19' or osm_uid = '617871' and osm_timestamp::date = '2017-04-24' or osm_uid = '3356208' and osm_timestamp::date = '2015-11-14' or osm_uid = '647654' and osm_timestamp::date = '2017-03-15' or osm_uid = '1213353' and osm_timestamp::date = '2013-11-22' or osm_uid = '261050' and osm_timestamp::date = '2018-02-06' or osm_uid = '7634869' and osm_timestamp::date = '2018-02-18' or osm_uid = '60110' and osm_timestamp::date = '2012-10-06' or osm_uid = '261050' and osm_timestamp::date = '2018-02-08' or osm_uid = '647654' and osm_timestamp::date = '2017-03-14' or osm_uid = '408968' and osm_timestamp::date = '2011-09-17' or osm_uid = '408968' and osm_timestamp::date = '2011-08-11' or osm_uid = '215343' and osm_timestamp::date = '2010-01-12' or osm_uid = '408968' and osm_timestamp::date = '2011-07-29' or osm_uid = '261050' and osm_timestamp::date = '2018-01-12' or osm_uid = '1122708' and osm_timestamp::date = '2018-05-25' or osm_uid = '1923406' and osm_timestamp::date = '2014-02-10' or osm_uid = '261050' and osm_timestamp::date = '2018-01-10' or osm_uid = '123394' and osm_timestamp::date = '2018-05-04' or osm_uid = '261050' and osm_timestamp::date = '2015-11-10' or osm_uid = '261050' and osm_timestamp::date = '2016-04-20' or osm_uid = '343553' and osm_timestamp::date = '2016-08-01' or osm_uid = '76281' and osm_timestamp::date = '2015-10-08' or osm_uid = '408968' and osm_timestamp::date = '2011-07-26' or osm_uid = '408968' and osm_timestamp::date = '2011-08-16' or osm_uid = '60110' and osm_timestamp::date = '2012-12-26' or osm_uid = '550560' and osm_timestamp::date = '2017-09-14' or osm_uid = '408968' and osm_timestamp::date = '2011-07-28' or osm_uid = '408968' and osm_timestamp::date = '2011-07-30' or osm_uid = '123394' and osm_timestamp::date = '2018-05-07' or osm_uid = '408968' and osm_timestamp::date = '2011-08-09' or osm_uid = '261050' and osm_timestamp::date = '2017-12-19' or osm_uid = '261050' and osm_timestamp::date = '2017-12-14' or osm_uid = '18236' and osm_timestamp::date = '2009-04-13' or osm_uid = '408968' and osm_timestamp::date = '2011-09-11' or osm_uid = '261050' and osm_timestamp::date = '2018-01-02' or osm_uid = '647654' and osm_timestamp::date = '2017-03-13' or osm_uid = '60110' and osm_timestamp::date = '2012-10-01' or osm_uid = '408968' and osm_timestamp::date = '2011-09-05' or osm_uid = '261050' and osm_timestamp::date = '2016-04-22' or osm_uid = '261050' and osm_timestamp::date = '2016-02-29' or osm_uid = '6821322' and osm_timestamp::date = '2017-11-08' or osm_uid = '343553' and osm_timestamp::date = '2011-02-17' or osm_uid = '261050' and osm_timestamp::date = '2017-10-16' or osm_uid = '261050' and osm_timestamp::date = '2016-02-12' or osm_uid = '18236' and osm_timestamp::date = '2008-07-26' or osm_uid = '408968' and osm_timestamp::date = '2011-10-13' or osm_uid = '408968' and osm_timestamp::date = '2011-08-28' or osm_uid = '6957132' and osm_timestamp::date = '2017-11-10' or osm_uid = '7543013' and osm_timestamp::date = '2018-06-27' or osm_uid = '2778924' and osm_timestamp::date = '2016-05-17' or osm_uid = '219668' and osm_timestamp::date = '2013-11-17' or osm_uid = '18236' and osm_timestamp::date = '2008-07-25' or osm_uid = '74746' and osm_timestamp::date = '2017-05-26' or osm_uid = '261050' and osm_timestamp::date = '2016-04-25' or osm_uid = '261050' and osm_timestamp::date = '2018-02-01' or osm_uid = '1805170' and osm_timestamp::date = '2015-08-11' or osm_uid = '261050' and osm_timestamp::date = '2017-10-17' or osm_uid = '408968' and osm_timestamp::date = '2011-09-20' or osm_uid = '261050' and osm_timestamp::date = '2016-02-24' or osm_uid = '343553' and osm_timestamp::date = '2015-09-04' or osm_uid = '408968' and osm_timestamp::date = '2011-08-08' or osm_uid = '408968' and osm_timestamp::date = '2011-08-20' or osm_uid = '4416051' and osm_timestamp::date = '2017-01-16' or osm_uid = '7529098' and osm_timestamp::date = '2018-06-25' or osm_uid = '6957132' and osm_timestamp::date = '2017-11-11' or osm_uid = '6318104' and osm_timestamp::date = '2018-01-21' or osm_uid = '3139325' and osm_timestamp::date = '2015-08-10' or osm_uid = '7543013' and osm_timestamp::date = '2018-06-25' or osm_uid = '7547309' and osm_timestamp::date = '2018-06-19' or osm_uid = '8408878' and osm_timestamp::date = '2018-06-19' or osm_uid = '527721' and osm_timestamp::date = '2017-05-22' or osm_uid = '161619' and osm_timestamp::date = '2017-05-21' or osm_uid = '161619' and osm_timestamp::date = '2017-04-29' or osm_uid = '616774' and osm_timestamp::date = '2018-06-15' 

--POINT
--select count(*) from nairobihot_point --"448442"
--select count(*) from nairobihot_point2 --"231838"


--POLYGON
--select count(*) from nairobihot_polygon --"60146"
--select count(*) from nairobihot_polygon2 --"26859"

--LINE
--select count(*) from nairobihot_line --"17178"
--select count(*) from nairobihot_line2 --"14259"


create table nairobihot_final_point2 as (select * from public.nairobi_point2 where osm_uid= '104962' or osm_uid= '105050' or osm_uid= '1092114' or osm_uid= '109852' or osm_uid= '1127998' or osm_uid= '113669' or osm_uid= '116004' or osm_uid= '118021' or osm_uid= '1183539' or osm_uid= '1193827' or osm_uid= '1222460' or osm_uid= '1227812'or osm_uid= '1228099' or osm_uid= '123394' or osm_uid= '123574' or osm_uid= '1241146' or osm_uid= '1272420' or osm_uid= '1295' or osm_uid= '1298408' or osm_uid= '1420318' or osm_uid= '143643' or osm_uid= '1438944' or osm_uid= '1451799' or osm_uid= '145231' or osm_uid= '1478147' or osm_uid= '1486839' or osm_uid= '151957' or osm_uid= '152074' or osm_uid= '152217' or osm_uid= '154897' or osm_uid= '158826' or osm_uid= '1624486' or osm_uid= '162827' or osm_uid= '1631208' or osm_uid= '16315' or osm_uid= '165869' or osm_uid= '1702867' or osm_uid= '1709411' or osm_uid= '1718307' or osm_uid= '1722488' or osm_uid= '1722705' or osm_uid= '1728489' or osm_uid= '172867' or osm_uid= '1734925' or osm_uid= '1737095' or osm_uid= '1758189' or osm_uid= '1759476' or osm_uid= '178186' or osm_uid= '1783785' or osm_uid= '1784024' or osm_uid= '1788345' or osm_uid= '1790725' or osm_uid= '1791419' or osm_uid= '179179' or osm_uid= '1794962' or osm_uid= '1800923' or osm_uid= '1805170' or osm_uid= '181135' or osm_uid= '1816329' or osm_uid= '1819294' or osm_uid= '1828156' or osm_uid= '1837088' or osm_uid= '1849360' or osm_uid= '1850261' or osm_uid= '1858859' or osm_uid= '18675' or osm_uid= '1871907' or osm_uid= '191112' or osm_uid= '1915697' or osm_uid= '1918544' or osm_uid= '19239' or osm_uid= '193865' or osm_uid= '1945995' or osm_uid= '1970' or osm_uid= '1974317' or osm_uid= '19862' or osm_uid= '1988531' or osm_uid= '1992089' or osm_uid= '1994572' or osm_uid= '2012929' or osm_uid= '2014887' or osm_uid= '202858' or osm_uid= '204528' or osm_uid= '2058020' or osm_uid= '207249' or osm_uid= '2110714' or osm_uid= '2131679' or osm_uid= '213831' or osm_uid= '2147741' or osm_uid= '215343' or osm_uid= '21640' or osm_uid= '216549' or osm_uid= '2183897' or osm_uid= '220397' or osm_uid= '22301' or osm_uid= '223946' or osm_uid= '224440' or osm_uid= '2252378' or osm_uid= '2255370' or osm_uid= '22577' or osm_uid= '2267193' or osm_uid= '227137' or osm_uid= '22726' or osm_uid= '2277688' or osm_uid= '2279520' or osm_uid= '228596' or osm_uid= '2304720' or osm_uid= '230870' or osm_uid= '232312' or osm_uid= '2339121' or osm_uid= '2343654' or osm_uid= '2344498' or osm_uid= '236134' or osm_uid= '236381' or osm_uid= '2380527' or osm_uid= '2402416'or osm_uid= '2407086' or osm_uid= '2418784' or osm_uid= '2429819' or osm_uid= '243041' or osm_uid= '2447642' or osm_uid= '2454337' or osm_uid= '2483501' or osm_uid= '2483514' or osm_uid= '2488962' or osm_uid= '250196' or osm_uid= '2502128' or osm_uid= '251068' or osm_uid= '2525464' or osm_uid= '2529271' or osm_uid= '2546503' or osm_uid= '25504' or osm_uid= '2560523' or osm_uid= '2567001' or osm_uid= '257518' or osm_uid= '2580007' or osm_uid= '261018' or osm_uid= '261043' or osm_uid= '261052' or osm_uid= '261053' or osm_uid= '26139' or osm_uid= '261848' or osm_uid= '2629845' or osm_uid= '2673403' or osm_uid= '2721194' or osm_uid= '2727503' or osm_uid= '2791123' or osm_uid= '280679' or osm_uid= '2815749' or osm_uid= '2819117' or osm_uid= '2823342' or osm_uid= '2826988' or osm_uid= '282922' or osm_uid= '2831095' or osm_uid= '2838481' or osm_uid= '2853561' or osm_uid= '286581' or osm_uid= '2875252' or osm_uid= '290680' or osm_uid= '2931961' or osm_uid= '293774' or osm_uid= '2964356' or osm_uid= '2966528' or osm_uid= '297047' or osm_uid= '297215' or osm_uid= '302013' or osm_uid= '3052145' or osm_uid= '3087085' or osm_uid= '3103111' or osm_uid= '31075' or osm_uid= '3112087' or osm_uid= '3128730' or osm_uid= '3139249' or osm_uid= '3139300' or osm_uid= '3139310' or osm_uid= '3139311' or osm_uid= '3139312' or osm_uid= '3139313' or osm_uid= '3139314' or osm_uid= '3139315' or osm_uid= '3139316' or osm_uid= '3139317' or osm_uid= '3139318' or osm_uid= '3139319' or osm_uid= '3139320' or osm_uid= '3139321' or osm_uid= '3139324' or osm_uid= '3139325' or osm_uid= '3139326' or osm_uid= '3139328' or osm_uid= '3139330' or osm_uid= '3139332' or osm_uid= '3139334' or osm_uid= '3139337' or osm_uid= '3139340' or osm_uid= '3139345' or osm_uid= '3139349' or osm_uid= '3139356' or osm_uid= '3139465' or osm_uid= '3139468' or osm_uid= '3139469' or osm_uid= '3139473' or osm_uid= '3139474' or osm_uid= '3139475' or osm_uid= '3139476' or osm_uid= '3139478' or osm_uid= '3139479' or osm_uid= '3139480' or osm_uid= '3139483' or osm_uid= '3139484' or osm_uid= '3139485' or osm_uid= '3139486' or osm_uid= '3139487' or osm_uid= '3139488' or osm_uid= '3139489' or osm_uid= '3139491' or osm_uid= '3139492' or osm_uid= '3139493' or osm_uid= '3139501' or osm_uid= '3139510' or osm_uid= '3139511' or osm_uid= '3139512' or osm_uid= '3139513' or osm_uid= '3139514' or osm_uid= '3139516' or osm_uid= '3139517' or osm_uid= '3139522' or osm_uid= '3139523' or osm_uid= '3141551' or osm_uid= '3156549' or osm_uid= '3164269' or osm_uid= '3165110' or osm_uid= '3165111' or osm_uid= '3165112' or osm_uid= '3165114' or osm_uid= '3165115' or osm_uid= '3165118' or osm_uid= '3165119' or osm_uid= '3165121' or osm_uid= '3165122' or osm_uid= '3165123' or osm_uid= '3165149' or osm_uid= '3165155' or osm_uid= '3165245' or osm_uid= '3165248' or osm_uid= '3165249' or osm_uid= '3165250' or osm_uid= '3165251' or osm_uid= '3165252' or osm_uid= '3165263' or osm_uid= '3165265' or osm_uid= '3165266' or osm_uid= '3165267' or osm_uid= '3166401' or osm_uid= '3171160' or osm_uid= '3171172' or osm_uid= '3180922' or osm_uid= '3181344' or osm_uid= '3201239' or osm_uid= '3201496' or osm_uid= '3203529' or osm_uid= '3213324' or osm_uid= '3213825' or osm_uid= '3213901' or osm_uid= '3213903' or osm_uid= '3213907' or osm_uid= '3213908' or osm_uid= '3213941' or osm_uid= '3213954' or osm_uid= '3213957' or osm_uid= '3213964' or osm_uid= '3213972' or osm_uid= '3213995' or osm_uid= '3214086' or osm_uid= '3214103' or osm_uid= '3227906' or osm_uid= '3227908' or osm_uid= '3227909' or osm_uid= '3227911' or osm_uid= '3227913' or osm_uid= '3227922' or osm_uid= '3227929' or osm_uid= '3244277' or osm_uid= '3260103' or osm_uid= '3271693' or osm_uid= '330499' or osm_uid= '3335899' or osm_uid= '334393' or osm_uid= '3345287' or osm_uid= '3356190' or osm_uid= '3356208' or osm_uid= '3356215' or osm_uid= '3359905' or osm_uid= '336263' or osm_uid= '336460' or osm_uid= '336481' or osm_uid= '3378955' or osm_uid= '3381684' or osm_uid= '3385081' or osm_uid= '3392660' or osm_uid= '3401382' or osm_uid= '3404311' or osm_uid= '3407014' or osm_uid= '343975' or osm_uid= '3439880' or osm_uid= '344031' or osm_uid= '344834' or osm_uid= '345885' or osm_uid= '346151' or osm_uid= '3464017' or osm_uid= '34684' or osm_uid= '347165' or osm_uid= '347895' or osm_uid= '35243' or osm_uid= '352832' or osm_uid= '353101' or osm_uid= '355617' or osm_uid= '3596555' or osm_uid= '360480' or osm_uid= '3616826' or osm_uid= '3626072' or osm_uid= '3662165' or osm_uid= '3684103' or osm_uid= '3689925' or osm_uid= '3722983' or osm_uid= '3741963' or osm_uid= '3779047' or osm_uid= '3780035' or osm_uid= '3785778' or osm_uid= '3790985' or osm_uid= '38066' or osm_uid= '381946' or osm_uid= '382639' or osm_uid= '383494' or osm_uid= '383550' or osm_uid= '3844079' or osm_uid= '385027' or osm_uid= '385790' or osm_uid= '3883821' or osm_uid= '3883829' or osm_uid= '3883830' or osm_uid= '3883989' or osm_uid= '3884006' or osm_uid= '3884008' or osm_uid= '3884048' or osm_uid= '3884087' or osm_uid= '3888955' or osm_uid= '3889036' or osm_uid= '3907877' or osm_uid= '392442' or osm_uid= '393385' or osm_uid= '3947067' or osm_uid= '3952306' or osm_uid= '3967886' or osm_uid= '39688' or osm_uid= '398086' or osm_uid= '398864' or osm_uid= '3997030' or osm_uid= '4001691' or osm_uid= '4009825' or osm_uid= '402366' or osm_uid= '4041765' or osm_uid= '4083191' or osm_uid= '4088480' or osm_uid= '408968' or osm_uid= '4112037' or osm_uid= '4127143' or osm_uid= '413785' or osm_uid= '4140347' or osm_uid= '4157551' or osm_uid= '4191819' or osm_uid= '421504' or osm_uid= '42429' or osm_uid= '4295071' or osm_uid= '429923' or osm_uid= '429943' or osm_uid= '429952' or osm_uid= '429956' or osm_uid= '429994' or osm_uid= '4336738' or osm_uid= '433827' or osm_uid= '435017' or osm_uid= '4370234' or osm_uid= '43972' or osm_uid= '440940' or osm_uid= '44221' or osm_uid= '443179' or osm_uid= '4438265' or osm_uid= '4438307' or osm_uid= '4438329' or osm_uid= '4439158' or osm_uid= '445671' or osm_uid= '44659' or osm_uid= '4468660' or osm_uid= '451142' or osm_uid= '4537872' or osm_uid= '454012' or osm_uid= '455573' or osm_uid= '4584578' or osm_uid= '4590780' or osm_uid= '4615093' or osm_uid= '4649310' or osm_uid= '4678589' or osm_uid= '4727391' or osm_uid= '4742744' or osm_uid= '474505' or osm_uid= '474570' or osm_uid= '474572' or osm_uid= '474574' or osm_uid= '474600' or osm_uid= '4751083' or osm_uid= '4757967' or osm_uid= '4758007' or osm_uid= '4758194' or osm_uid= '477692' or osm_uid= '4792818' or osm_uid= '4808795' or osm_uid= '4820501' or osm_uid= '483101' or osm_uid= '4847896' or osm_uid= '4902' or osm_uid= '4902414' or osm_uid= '49031' or osm_uid= '4910048' or osm_uid= '4913331' or osm_uid= '4929286' or osm_uid= '4935618' or osm_uid= '494109' or osm_uid= '4951' or osm_uid= '4954033' or osm_uid= '4967870' or osm_uid= '4972415' or osm_uid= '4976961' or osm_uid= '4982674' or osm_uid= '5049606' or osm_uid= '5060826' or osm_uid= '513716' or osm_uid= '513724' or osm_uid= '513730' or osm_uid= '513735' or osm_uid= '514275' or osm_uid= '514279' or osm_uid= '514285' or osm_uid= '514291' or osm_uid= '514293' or osm_uid= '514329' or osm_uid= '5184174' or osm_uid= '5211' or osm_uid= '521872' or osm_uid= '5229804' or osm_uid= '5252171' or osm_uid= '527748' or osm_uid= '527956' or osm_uid= '5281821' or osm_uid= '5289191' or osm_uid= '5304463' or osm_uid= '533514' or osm_uid= '535126' or osm_uid= '5352781' or osm_uid= '5352998' or osm_uid= '5359' or osm_uid= '537590' or osm_uid= '540100' or osm_uid= '540114' or osm_uid= '5409294' or osm_uid= '5413154' or osm_uid= '543072' or osm_uid= '5460778' or osm_uid= '547959' or osm_uid= '5517273' or osm_uid= '554987' or osm_uid= '555655' or osm_uid= '5565982' or osm_uid= '5577207' or osm_uid= '562199' or osm_uid= '5636613' or osm_uid= '56475' or osm_uid= '5666909' or osm_uid= '5683833' or osm_uid= '5702677' or osm_uid= '5723404' or osm_uid= '5730' or osm_uid= '5735' or osm_uid= '578205' or osm_uid= '579394' or osm_uid= '579465' or osm_uid= '5891' or osm_uid= '590702' or osm_uid= '602776' or osm_uid= '605229' or osm_uid= '6070403' or osm_uid= '609578' or osm_uid= '6099467' or osm_uid= '61148' or osm_uid= '6124' or osm_uid= '6166865' or osm_uid= '616774' or osm_uid= '617871' or osm_uid= '618618' or osm_uid= '6192815' or osm_uid= '6231864' or osm_uid= '6252249' or osm_uid= '6312212' or osm_uid= '6317329' or osm_uid= '6318104' or osm_uid= '6367677' or osm_uid= '6371832' or osm_uid= '64578' or osm_uid= '6465169' or osm_uid= '6465640' or osm_uid= '647654' or osm_uid= '6494' or osm_uid= '6518769' or osm_uid= '65334' or osm_uid= '6559404' or osm_uid= '6575867' or osm_uid= '6590111' or osm_uid= '6603691' or osm_uid= '660503' or osm_uid= '663559' or osm_uid= '6654082' or osm_uid= '6690280' or osm_uid= '669372' or osm_uid= '6716077' or osm_uid= '67244' or osm_uid= '6740189' or osm_uid= '6773623' or osm_uid= '677828' or osm_uid= '6791950' or osm_uid= '6803188' or osm_uid= '6805926' or osm_uid= '6816428' or osm_uid= '6819172' or osm_uid= '6821322' or osm_uid= '687500' or osm_uid= '68842' or osm_uid= '6894902' or osm_uid= '68982' or osm_uid= '6907408' or osm_uid= '69102' or osm_uid= '692835' or osm_uid= '692836' or osm_uid= '692840' or osm_uid= '6929426' or osm_uid= '6957132' or osm_uid= '6962339' or osm_uid= '6990887' or osm_uid= '6990999' or osm_uid= '7000013' or osm_uid= '7002615' or osm_uid= '7005951' or osm_uid= '70260' or osm_uid= '70696' or osm_uid= '70757' or osm_uid= '7096975' or osm_uid= '7100234' or osm_uid= '711265' or osm_uid= '711823' or osm_uid= '7135712' or osm_uid= '7162786' or osm_uid= '719422' or osm_uid= '7203' or osm_uid= '722137' or osm_uid= '7271605' or osm_uid= '7333449' or osm_uid= '7489764' or osm_uid= '7489879' or osm_uid= '7529085' or osm_uid= '7529098' or osm_uid= '7530388' or osm_uid= '7535177' or osm_uid= '7535205' or osm_uid= '7542284' or osm_uid= '7543013' or osm_uid= '7543330' or osm_uid= '7543364' or osm_uid= '7543871' or osm_uid= '7544385' or osm_uid= '7547309' or osm_uid= '7547329' or osm_uid= '7547352' or osm_uid= '7547827' or osm_uid= '7549479' or osm_uid= '7559520' or osm_uid= '7573782' or osm_uid= '76114' or osm_uid= '7622592' or osm_uid= '7628597' or osm_uid= '76471' or osm_uid= '7657266' or osm_uid= '769728' or osm_uid= '7807696' or osm_uid= '8063837' or osm_uid= '8082974' or osm_uid= '8104961' or osm_uid= '8130064' or osm_uid= '8130069' or osm_uid= '8130074' or osm_uid= '8130075' or osm_uid= '8130076' or osm_uid= '8130078' or osm_uid= '8130079' or osm_uid= '8130080' or osm_uid= '8130082' or osm_uid= '8130083' or osm_uid= '8130098' or osm_uid= '8130101' or osm_uid= '8130121' or osm_uid= '8130194' or osm_uid= '8152729' or osm_uid= '8228922' or osm_uid= '8264894' or osm_uid= '8280066' or osm_uid= '8296594' or osm_uid= '8315380' or osm_uid= '8348853' or osm_uid= '8349595' or osm_uid= '8354089' or osm_uid= '8385528' or osm_uid= '8394422' or osm_uid= '8408744' or osm_uid= '8408878' or osm_uid= '8408910' or osm_uid= '8408975' or osm_uid= '8408987' or osm_uid= '8408998' or osm_uid= '8409006' or osm_uid= '8412466' or osm_uid= '8412544' or osm_uid= '8428582' or osm_uid= '8454602' or osm_uid= '8503294' or osm_uid= '87986' or osm_uid= '9112' or osm_uid= '917105' or osm_uid= '92274' or osm_uid= '94253' or osm_uid= '949952' or osm_uid= '95383' or osm_uid= '9796' or osm_uid= '9839' or osm_uid= '986333' or osm_uid= '991809' or osm_uid= '992965' or osm_uid= '994181' or osm_uid= '999' or osm_uid= '99999')





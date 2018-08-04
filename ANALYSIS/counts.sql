select 
(select count(*) as aerialway from nairobi_final_point2 where aerialway is not null),
(select count(*) as aeroway from nairobi_final_point where aeroway is not null),
(select count(*) as amenity from nairobi_final_point2 where amenity is not null),
(select count(*) as barrier from nairobi_final_point2 where barrier is not null),
(select count(*) as bicycle from nairobi_final_point2 where bicycle is not null),
(select count(*) as brand from nairobi_final_point2 where brand is not null),
(select count(*) as bridge from nairobi_final_point2 where bridge is not null),
(select count(*) as building from nairobi_final_point2 where building is not null),
(select count(*) as harbour from nairobi_final_point2 where harbour is not null),
(select count(*) as highway from nairobi_final_point2 where highway is not null),
(select count(*) as historic from nairobi_final_point2 where historic is not null),
(select count(*) as leisure from nairobi_final_point2 where leisure is not null),
(select count(*) as "lock" from nairobi_final_point2 where "lock" is not null),
(select count(*) as man_made from nairobi_final_point2 where man_made is not null),
(select count(*) as military from nairobi_final_point2 where military is not null),
(select count(*) as public_transport from nairobi_final_point2 where public_transport is not null),
(select count(*) as power_source from nairobi_final_point2 where power_source is not null),
(select count(*) as "natural" from nairobi_final_point2 where "natural" is not null),
(select count(*) as railway from nairobi_final_point2 where railway is not null),
(select count(*) as religion from nairobi_final_point2 where religion is not null),
(select count(*) as shop from nairobi_final_point2 where shop is not null),
(select count(*) as sport from nairobi_final_point2 where sport is not null),
(select count(*) as tourism from nairobi_final_point2 where tourism is not null),
(select count(*) as tunnel from nairobi_final_point2 where tunnel is not null),
(select count(*) as waterway from nairobi_final_point2 where waterway is not null),
(select count(*) as water from nairobi_final_point2 where water is not null),
(select count(*) as wood from nairobi_final_point2 where wood is not null);

select 
(select count(*) as aerialway from nairobi_final_polygon2 where aerialway is not null),
(select count(*) as aeroway from nairobi_final_polygon where aeroway is not null),
(select count(*) as amenity from nairobi_final_polygon2 where amenity is not null),
(select count(*) as barrier from nairobi_final_polygon2 where barrier is not null),
(select count(*) as bicycle from nairobi_final_polygon2 where bicycle is not null),
(select count(*) as brand from nairobi_final_polygon2 where brand is not null),
(select count(*) as bridge from nairobi_final_polygon2 where bridge is not null),
(select count(*) as building from nairobi_final_polygon2 where building is not null),
(select count(*) as harbour from nairobi_final_polygon2 where harbour is not null),
(select count(*) as highway from nairobi_final_polygon2 where highway is not null),
(select count(*) as historic from nairobi_final_polygon2 where historic is not null),
(select count(*) as leisure from nairobi_final_polygon2 where leisure is not null),
(select count(*) as "lock" from nairobi_final_polygon2 where "lock" is not null),
(select count(*) as man_made from nairobi_final_polygon2 where man_made is not null),
(select count(*) as military from nairobi_final_polygon2 where military is not null),
(select count(*) as public_transport from nairobi_final_polygon2 where public_transport is not null),
(select count(*) as power_source from nairobi_final_polygon2 where power_source is not null),
(select count(*) as "natural" from nairobi_final_polygon2 where "natural" is not null),
(select count(*) as railway from nairobi_final_polygon2 where railway is not null),
(select count(*) as religion from nairobi_final_polygon2 where religion is not null),
(select count(*) as shop from nairobi_final_polygon2 where shop is not null),
(select count(*) as sport from nairobi_final_polygon2 where sport is not null),
(select count(*) as tourism from nairobi_final_polygon2 where tourism is not null),
(select count(*) as tunnel from nairobi_final_polygon2 where tunnel is not null),
(select count(*) as waterway from nairobi_final_polygon2 where waterway is not null),
(select count(*) as water from nairobi_final_polygon2 where water is not null),
(select count(*) as wood from nairobi_final_polygon2 where wood is not null);

select 
(select count(*) as aerialway from nairobi_final_line2 where aerialway is not null),
(select count(*) as aeroway from nairobi_final_line where aeroway is not null),
(select count(*) as amenity from nairobi_final_line2 where amenity is not null),
(select count(*) as barrier from nairobi_final_line2 where barrier is not null),
(select count(*) as bicycle from nairobi_final_line2 where bicycle is not null),
(select count(*) as brand from nairobi_final_line2 where brand is not null),
(select count(*) as bridge from nairobi_final_line2 where bridge is not null),
(select count(*) as building from nairobi_final_line2 where building is not null),
(select count(*) as harbour from nairobi_final_line2 where harbour is not null),
(select count(*) as highway from nairobi_final_line2 where highway is not null),
(select count(*) as historic from nairobi_final_line2 where historic is not null),
(select count(*) as leisure from nairobi_final_line2 where leisure is not null),
(select count(*) as "lock" from nairobi_final_line2 where "lock" is not null),
(select count(*) as man_made from nairobi_final_line2 where man_made is not null),
(select count(*) as military from nairobi_final_line2 where military is not null),
(select count(*) as public_transport from nairobi_final_line2 where public_transport is not null),
(select count(*) as power_source from nairobi_final_line2 where power_source is not null),
(select count(*) as "natural" from nairobi_final_line2 where "natural" is not null),
(select count(*) as railway from nairobi_final_line2 where railway is not null),
(select count(*) as religion from nairobi_final_line2 where religion is not null),
(select count(*) as shop from nairobi_final_line2 where shop is not null),
(select count(*) as sport from nairobi_final_line2 where sport is not null),
(select count(*) as tourism from nairobi_final_line2 where tourism is not null),
(select count(*) as tunnel from nairobi_final_line2 where tunnel is not null),
(select count(*) as waterway from nairobi_final_line2 where waterway is not null),
(select count(*) as water from nairobi_final_line2 where water is not null),
(select count(*) as wood from nairobi_final_line2 where wood is not null);


--repeat for all below
select aerialway, count(*) from nairobi_final_line2 where aerialway is not null
group by aerialway
order by count desc 

select aeroway, count(*) from nairobi_final_line2 where aeroway is not null
group by aeroway
order by count desc 

select amenity, count(*) from nairobi_final_line2 where amenity is not null
group by amenity
order by count desc 

select barrier, count(*) from nairobi_final_line2 where barrier is not null
group by barrier
order by count desc 

select bicycle, count(*) from nairobi_final_line2 where bicycle is not null
group by bicycle
order by count desc 

select brand, count(*) from nairobi_final_line2 where brand is not null
group by brand
order by count desc 

select bridge, count(*) from nairobi_final_line2 where bridge is not null
group by bridge
order by count desc

select building, count(*) from nairobi_final_line2 where building is not null
group by building
order by count desc

select harbour, count(*) from nairobi_final_line2 where harbour is not null
group by harbour
order by count desc

select highway, count(*) from nairobi_final_line2 where highway is not null
group by highway
order by count desc

select historic, count(*) from nairobi_final_line2 where historic is not null
group by historic
order by count desc

select leisure, count(*) from nairobi_final_line2 where leisure is not null
group by leisure
order by count desc

select "lock", count(*) from nairobi_final_line2 where "lock" is not null
group by "lock"
order by count desc

select man_made, count(*) from nairobi_final_line2 where man_made is not null
group by man_made
order by count desc

select military, count(*) from nairobi_final_line2 where military is not null
group by military
order by count desc

select public_transport, count(*) from nairobi_final_line2 where public_transport is not null
group by public_transport
order by count desc

select power_source, count(*) from nairobi_final_line2 where power_source is not null
group by power_source
order by count desc

select "natural", count(*) from nairobi_final_line2 where "natural" is not null
group by "natural"
order by count desc

select railway, count(*) from nairobi_final_line2 where railway is not null
group by railway
order by count desc

select religion, count(*) from nairobi_final_line2 where religion is not null
group by religion
order by count desc

select shop, count(*) from nairobi_final_line2 where shop is not null
group by shop
order by count desc

select sport, count(*) from nairobi_final_line2 where sport is not null
group by sport
order by count desc

select tourism, count(*) from nairobi_final_line2 where tourism is not null
group by tourism
order by count desc

select tunnel, count(*) from nairobi_final_line2 where tunnel is not null
group by tunnel
order by count desc

select waterway, count(*) from nairobi_final_line2 where waterway is not null
group by waterway
order by count desc

select water, count(*) from nairobi_final_line2 where water is not null
group by water
order by count desc

select wood, count(*) from nairobi_final_line2 where wood is not null
group by wood
order by count desc



select 
(select count(*) as aerialway from manchester_final_point2 where aerialway is not null),
(select count(*) as aeroway from manchester_final_point where aeroway is not null),
(select count(*) as amenity from manchester_final_point2 where amenity is not null),
(select count(*) as barrier from manchester_final_point2 where barrier is not null),
(select count(*) as bicycle from manchester_final_point2 where bicycle is not null),
(select count(*) as brand from manchester_final_point2 where brand is not null),
(select count(*) as bridge from manchester_final_point2 where bridge is not null),
(select count(*) as building from manchester_final_point2 where building is not null),
(select count(*) as harbour from manchester_final_point2 where harbour is not null),
(select count(*) as highway from manchester_final_point2 where highway is not null),
(select count(*) as historic from manchester_final_point2 where historic is not null),
(select count(*) as leisure from manchester_final_point2 where leisure is not null),
(select count(*) as "lock" from manchester_final_point2 where "lock" is not null),
(select count(*) as man_made from manchester_final_point2 where man_made is not null),
(select count(*) as military from manchester_final_point2 where military is not null),
(select count(*) as public_transport from manchester_final_point2 where public_transport is not null),
(select count(*) as power_source from manchester_final_point2 where power_source is not null),
(select count(*) as "natural" from manchester_final_point2 where "natural" is not null),
(select count(*) as railway from manchester_final_point2 where railway is not null),
(select count(*) as religion from manchester_final_point2 where religion is not null),
(select count(*) as shop from manchester_final_point2 where shop is not null),
(select count(*) as sport from manchester_final_point2 where sport is not null),
(select count(*) as tourism from manchester_final_point2 where tourism is not null),
(select count(*) as tunnel from manchester_final_point2 where tunnel is not null),
(select count(*) as waterway from manchester_final_point2 where waterway is not null),
(select count(*) as water from manchester_final_point2 where water is not null),
(select count(*) as wood from manchester_final_point2 where wood is not null);

select 
(select count(*) as aerialway from manchester_final_polygon2 where aerialway is not null),
(select count(*) as aeroway from manchester_final_polygon where aeroway is not null),
(select count(*) as amenity from manchester_final_polygon2 where amenity is not null),
(select count(*) as barrier from manchester_final_polygon2 where barrier is not null),
(select count(*) as bicycle from manchester_final_polygon2 where bicycle is not null),
(select count(*) as brand from manchester_final_polygon2 where brand is not null),
(select count(*) as bridge from manchester_final_polygon2 where bridge is not null),
(select count(*) as building from manchester_final_polygon2 where building is not null),
(select count(*) as harbour from manchester_final_polygon2 where harbour is not null),
(select count(*) as highway from manchester_final_polygon2 where highway is not null),
(select count(*) as historic from manchester_final_polygon2 where historic is not null),
(select count(*) as leisure from manchester_final_polygon2 where leisure is not null),
(select count(*) as "lock" from manchester_final_polygon2 where "lock" is not null),
(select count(*) as man_made from manchester_final_polygon2 where man_made is not null),
(select count(*) as military from manchester_final_polygon2 where military is not null),
(select count(*) as public_transport from manchester_final_polygon2 where public_transport is not null),
(select count(*) as power_source from manchester_final_polygon2 where power_source is not null),
(select count(*) as "natural" from manchester_final_polygon2 where "natural" is not null),
(select count(*) as railway from manchester_final_polygon2 where railway is not null),
(select count(*) as religion from manchester_final_polygon2 where religion is not null),
(select count(*) as shop from manchester_final_polygon2 where shop is not null),
(select count(*) as sport from manchester_final_polygon2 where sport is not null),
(select count(*) as tourism from manchester_final_polygon2 where tourism is not null),
(select count(*) as tunnel from manchester_final_polygon2 where tunnel is not null),
(select count(*) as waterway from manchester_final_polygon2 where waterway is not null),
(select count(*) as water from manchester_final_polygon2 where water is not null),
(select count(*) as wood from manchester_final_polygon2 where wood is not null);

select 
(select count(*) as aerialway from manchester_final_line2 where aerialway is not null),
(select count(*) as aeroway from manchester_final_line where aeroway is not null),
(select count(*) as amenity from manchester_final_line2 where amenity is not null),
(select count(*) as barrier from manchester_final_line2 where barrier is not null),
(select count(*) as bicycle from manchester_final_line2 where bicycle is not null),
(select count(*) as brand from manchester_final_line2 where brand is not null),
(select count(*) as bridge from manchester_final_line2 where bridge is not null),
(select count(*) as building from manchester_final_line2 where building is not null),
(select count(*) as harbour from manchester_final_line2 where harbour is not null),
(select count(*) as highway from manchester_final_line2 where highway is not null),
(select count(*) as historic from manchester_final_line2 where historic is not null),
(select count(*) as leisure from manchester_final_line2 where leisure is not null),
(select count(*) as "lock" from manchester_final_line2 where "lock" is not null),
(select count(*) as man_made from manchester_final_line2 where man_made is not null),
(select count(*) as military from manchester_final_line2 where military is not null),
(select count(*) as public_transport from manchester_final_line2 where public_transport is not null),
(select count(*) as power_source from manchester_final_line2 where power_source is not null),
(select count(*) as "natural" from manchester_final_line2 where "natural" is not null),
(select count(*) as railway from manchester_final_line2 where railway is not null),
(select count(*) as religion from manchester_final_line2 where religion is not null),
(select count(*) as shop from manchester_final_line2 where shop is not null),
(select count(*) as sport from manchester_final_line2 where sport is not null),
(select count(*) as tourism from manchester_final_line2 where tourism is not null),
(select count(*) as tunnel from manchester_final_line2 where tunnel is not null),
(select count(*) as waterway from manchester_final_line2 where waterway is not null),
(select count(*) as water from manchester_final_line2 where water is not null),
(select count(*) as wood from manchester_final_line2 where wood is not null);



select aerialway, count(*) from manchester_final_line2 where aerialway is not null
group by aerialway
order by count desc 

select aeroway, count(*) from manchester_final_line2 where aeroway is not null
group by aeroway
order by count desc 

select amenity, count(*) from manchester_final_line2 where amenity is not null
group by amenity
order by count desc 

select barrier, count(*) from manchester_final_line2 where barrier is not null
group by barrier
order by count desc 

select bicycle, count(*) from manchester_final_line2 where bicycle is not null
group by bicycle
order by count desc 

select brand, count(*) from manchester_final_line2 where brand is not null
group by brand
order by count desc 

select bridge, count(*) from manchester_final_line2 where bridge is not null
group by bridge
order by count desc

select building, count(*) from manchester_final_line2 where building is not null
group by building
order by count desc

select harbour, count(*) from manchester_final_line2 where harbour is not null
group by harbour
order by count desc

select highway, count(*) from manchester_final_line2 where highway is not null
group by highway
order by count desc

select historic, count(*) from manchester_final_line2 where historic is not null
group by historic
order by count desc

select leisure, count(*) from manchester_final_line2 where leisure is not null
group by leisure
order by count desc

select "lock", count(*) from manchester_final_line2 where "lock" is not null
group by "lock"
order by count desc

select man_made, count(*) from manchester_final_line2 where man_made is not null
group by man_made
order by count desc

select military, count(*) from manchester_final_line2 where military is not null
group by military
order by count desc

select public_transport, count(*) from manchester_final_line2 where public_transport is not null
group by public_transport
order by count desc

select power_source, count(*) from manchester_final_line2 where power_source is not null
group by power_source
order by count desc

select "natural", count(*) from manchester_final_line2 where "natural" is not null
group by "natural"
order by count desc

select railway, count(*) from manchester_final_line2 where railway is not null
group by railway
order by count desc

select religion, count(*) from manchester_final_line2 where religion is not null
group by religion
order by count desc

select shop, count(*) from manchester_final_line2 where shop is not null
group by shop
order by count desc

select sport, count(*) from manchester_final_line2 where sport is not null
group by sport
order by count desc

select tourism, count(*) from manchester_final_line2 where tourism is not null
group by tourism
order by count desc

select tunnel, count(*) from manchester_final_line2 where tunnel is not null
group by tunnel
order by count desc

select waterway, count(*) from manchester_final_line2 where waterway is not null
group by waterway
order by count desc

select water, count(*) from manchester_final_line2 where water is not null
group by water
order by count desc

select wood, count(*) from manchester_final_line2 where wood is not null
group by wood
order by count desc





aerialway
aeroway 
amenity 
barrier 
bicycle 
brand 
bridge 
building 
harbour 
highway 
historic 
leisure
"lock" 
man_made 
military 
public_transport 
power_source 
"natural" 
railway 
religion
shop
sport 
tourism 
tunnel 
waterway 
water
wood

create table nairobi_final_poi2 as (
select * from nairobi_final_point2 where
"access" is not null or
"addr:housename" is not null or
"addr:housenumber" is not null or
"addr:place" is not null or
"addr:city" is not null or
"addr:country" is not null or
"addr:interpolation" is not null or
admin_level is not null or
aerialway is not null or
aeroway is not null or
amenity is not null or
area is not null or
barrier is not null or
bicycle is not null or
brand is not null or
bridge is not null or
boundary is not null or
building is not null or
capital is not null or
construction is not null or
covered is not null or
culvert is not null or
cutting is not null or
denomination is not null or
disused is not null or
ele is not null or
embankment is not null or
foot is not null or
"generator:source" is not null or
harbour is not null or
highway is not null or
historic is not null or
horse is not null or
intermittent is not null or
junction is not null or
landuse is not null or
layer is not null or
leisure is not null or
"lock" is not null or
man_made is not null or
military is not null or
motorcar is not null or
name is not null or
"natural" is not null or
office is not null or
oneway is not null or
"operator" is not null or
place is not null or
population is not null or
"power" is not null or
power_source is not null or
public_transport is not null or
railway is not null or
"ref" is not null or
religion is not null or
route is not null or
service is not null or
shop is not null or
sport is not null or
surface is not null or
toll is not null or
tourism is not null or
"tower:type" is not null or
tunnel is not null or
water is not null or
waterway is not null or
wetland is not null or
width is not null or
wood is not null
)

create table manchester_final_poi3 as (
select * from manchester_final_poi2 where
"access" is not null or
"addr:housename" is not null or
"addr:housenumber" is not null or
"addr:place" is not null or
"addr:city" is not null or
"addr:country" is not null or
"addr:interpolation" is not null or
admin_level is not null or
aerialway is not null or
aeroway is not null or
amenity is not null or
area is not null or
barrier is not null or
bicycle is not null or
brand is not null or
bridge is not null or
boundary is not null or
building is not null or
capital is not null or
construction is not null or
covered is not null or
culvert is not null or
cutting is not null or
denomination is not null or
disused is not null or
ele is not null or
embankment is not null or
foot is not null or
"generator:source" is not null or
harbour is not null or
highway is not null or
historic is not null or
horse is not null or
intermittent is not null or
junction is not null or
landuse is not null or
layer is not null or
leisure is not null or
"lock" is not null or
man_made is not null or
military is not null or
motorcar is not null or
name is not null or
"natural" is not null or
office is not null or
oneway is not null or
"operator" is not null or
place is not null or
population is not null or
"power" is not null or
power_source is not null or
public_transport is not null or
railway is not null or
"ref" is not null or
religion is not null or
route is not null or
service is not null or
shop is not null or
sport is not null or
surface is not null or
toll is not null or
tourism is not null or
"tower:type" is not null or
tunnel is not null or
water is not null or
waterway is not null or
wetland is not null or
width is not null or
wood is not null
)





select "access", count(*) from manc_final_polygon3 where "access" is not null
group by "access"
order by count desc

select "addr:housename", count(*) from manc_final_polygon3 where "addr:housename" is not null
group by "addr:housename"
order by count desc

select "addr:housenumber", count(*) from manc_final_polygon3 where "addr:housenumber" is not null
group by "addr:housenumber"
order by count desc

select "addr:place", count(*) from manc_final_polygon3 where "addr:place" is not null
group by "addr:place"
order by count desc

select "addr:city", count(*) from manc_final_polygon3 where "addr:city" is not null
group by "addr:city"
order by count desc

select "addr:country", count(*) from manc_final_polygon3 where "addr:country" is not null
group by "addr:country"
order by count desc

select "addr:interpolation", count(*) from manc_final_polygon3 where "addr:interpolation" is not null
group by "addr:interpolation"
order by count desc 

select admin_level, count(*) from manc_final_polygon3 where admin_level is not null
group by admin_level
order by count desc 

select aerialway, count(*) from manc_final_polygon3 where aerialway is not null
group by aerialway
order by count desc 

select aeroway, count(*) from manc_final_polygon3 where aeroway is not null
group by aeroway
order by count desc 

select amenity, count(*) from manc_final_polygon3 where amenity is not null
group by amenity
order by count desc 

select area, count(*) from manc_final_polygon3 where area is not null
group by area
order by count desc 

select barrier, count(*) from manc_final_polygon3 where barrier is not null
group by barrier
order by count desc 

select bicycle, count(*) from manc_final_polygon3 where bicycle is not null
group by bicycle
order by count desc 

select brand, count(*) from manc_final_polygon3 where brand is not null
group by brand
order by count desc 

select bridge, count(*) from manc_final_polygon3 where bridge is not null
group by bridge
order by count desc

select boundary, count(*) from manc_final_polygon3 where boundary is not null
group by boundary
order by count desc

select building, count(*) from manc_final_polygon3 where building is not null
group by building
order by count desc

select capital, count(*) from manc_final_polygon3 where capital is not null
group by capital
order by count desc

select construction, count(*) from manc_final_polygon3 where construction is not null
group by construction
order by count desc

select covered, count(*) from manc_final_polygon3 where covered is not null
group by covered
order by count desc

select culvert, count(*) from manc_final_polygon3 where culvert is not null
group by culvert
order by count desc

select cutting, count(*) from manc_final_polygon3 where cutting is not null
group by cutting
order by count desc

select denomination, count(*) from manc_final_polygon3 where denomination is not null
group by denomination
order by count desc

select disused, count(*) from manc_final_polygon3 where disused is not null
group by disused
order by count desc

select ele, count(*) from manc_final_polygon3 where ele is not null
group by ele
order by count desc

select embankment, count(*) from manc_final_polygon3 where embankment is not null
group by embankment
order by count desc

select foot, count(*) from manc_final_polygon3 where foot is not null
group by foot
order by count desc

select "generator:source", count(*) from manc_final_polygon3 where "generator:source" is not null
group by "generator:source"
order by count desc

select harbour, count(*) from manc_final_polygon3 where harbour is not null
group by harbour
order by count desc

select highway, count(*) from manc_final_polygon3 where highway is not null
group by highway
order by count desc

select historic, count(*) from manc_final_polygon3 where historic is not null
group by historic
order by count desc

select horse, count(*) from manc_final_polygon3 where horse is not null
group by horse
order by count desc

select intermittent, count(*) from manc_final_polygon3 where intermittent is not null
group by intermittent
order by count desc

select junction, count(*) from manc_final_polygon3 where junction is not null
group by junction
order by count desc

select landuse, count(*) from manc_final_polygon3 where landuse is not null
group by landuse
order by count desc

select layer, count(*) from manc_final_polygon3 where layer is not null
group by layer
order by count desc

select leisure, count(*) from manc_final_polygon3 where leisure is not null
group by leisure
order by count desc

select "lock", count(*) from manc_final_polygon3 where "lock" is not null
group by "lock"
order by count desc

select man_made, count(*) from manc_final_polygon3 where man_made is not null
group by man_made
order by count desc

select military, count(*) from manc_final_polygon3 where military is not null
group by military
order by count desc

select motorcar, count(*) from manc_final_polygon3 where motorcar is not null
group by motorcar
order by count desc

select "name", count(*) from manc_final_polygon3 where "name" is not null
group by "name"
order by count desc

select "natural", count(*) from manc_final_polygon3 where "natural" is not null
group by "natural"
order by count desc

select office, count(*) from manc_final_polygon3 where office is not null
group by office
order by count desc

select oneway, count(*) from manc_final_polygon3 where oneway is not null
group by oneway
order by count desc

select "operator", count(*) from manc_final_polygon3 where "operator" is not null
group by "operator"
order by count desc

select place, count(*) from manc_final_polygon3 where place is not null
group by place
order by count desc

select population, count(*) from manc_final_polygon3 where population is not null
group by population
order by count desc

select "power", count(*) from manc_final_polygon3 where  "power" is not null
group by  "power"
order by count desc

select power_source, count(*) from manc_final_polygon3 where power_source is not null
group by power_source
order by count desc

select public_transport, count(*) from manc_final_polygon3 where public_transport is not null
group by public_transport
order by count desc

select power_source, count(*) from manc_final_polygon3 where power_source is not null
group by power_source
order by count desc

select railway, count(*) from manc_final_polygon3 where railway is not null
group by railway
order by count desc

select "ref", count(*) from manc_final_polygon3 where "ref" is not null
group by "ref"
order by count desc

select religion, count(*) from manc_final_polygon3 where religion is not null
group by religion
order by count desc

select route, count(*) from manc_final_polygon3 where route is not null
group by route
order by count desc

select service, count(*) from manc_final_polygon3 where service is not null
group by service
order by count desc

select shop, count(*) from manc_final_polygon3 where shop is not null
group by shop
order by count desc

select sport, count(*) from manc_final_polygon3 where sport is not null
group by sport
order by count desc

select surface, count(*) from manc_final_polygon3 where surface is not null
group by surface
order by count desc

select toll, count(*) from manc_final_polygon3 where toll is not null
group by toll
order by count desc

select tourism, count(*) from manc_final_polygon3 where tourism is not null
group by tourism
order by count desc

select "tower:type", count(*) from manc_final_polygon3 where "tower:type" is not null
group by "tower:type"
order by count desc

select tunnel, count(*) from manc_final_polygon3 where tunnel is not null
group by tunnel
order by count desc

select water, count(*) from manc_final_polygon3 where water is not null
group by water
order by count desc

select waterway, count(*) from manc_final_polygon3 where waterway is not null
group by waterway
order by count desc

select wetland, count(*) from manc_final_polygon3 where wetland is not null
group by wetland
order by count desc

select width, count(*) from manc_final_polygon3 where width is not null
group by width
order by count desc

select wood, count(*) from manc_final_polygon3 where wood is not null
group by wood
order by count desc


"access" 
"addr:housename" 
"addr:housenumber" 
"addr:place" 
"addr:city" 
"addr:country" 
"addr:interpolation" 
admin_level 
aerialway 
aeroway 
amenity 
area 
barrier 
bicycle 
brand 
bridge 
boundary 
building 
capital 
construction 
covered 
culvert 
cutting 
denomination 
disused 
ele 
embankment 
foot 
"generator:source" 
harbour 
highway 
historic 
horse 
intermittent 
junction 
landuse 
layer 
leisure 
"lock" 
man_made 
military 
motorcar 
name 
"natural" 
office 
oneway 
"operator" 
place 
population 
"power" 
power_source 
public_transport 
railway 
"ref" 
religion 
route 
service 
shop 
sport 
surface 
toll 
tourism 
"tower:type" 
tunnel 
water 
waterway 
wetland 
width 
wood 
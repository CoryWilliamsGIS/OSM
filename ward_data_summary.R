library(rgdal)
library(dplyr)
library(ggplot2)
library(ggmap) 
library(RColorBrewer)
library(readxl)
library(corrplot)
library("readxl")



#Accessing PostgreSQL database
#tutorial: https://www.r-spatial.org/2017/07/14/large_scale_osm_in_r 
#load required package  
library(RPostgreSQL)

#load postgresql driver
driver <- dbDriver("PostgreSQL")

#create connection to postgresql database
#the connection variable will be used for all further operations
connection <- dbConnect(driver, dbname = "user12db",
                        host = "developer.cege.ucl.ac.uk", port = 33029,
                        user = "user12", password = "user12password")


#test if connection succesful (returns true)
dbExistsTable(connection, "m_bulkcheck_polygon")


################                                  ward analysis

#load relevant library
library("readxl")

#read in xslx file
N_wards <- read_excel("Ward Analysis_Nairobi.xlsx", sheet = "Sheet1")

#subset file into individual dataframes
begin <- N_wards[,1:6]
point_v1 <- N_wards[,7:8]
line_v1 <- N_wards[,9:10]
poly_v1 <- N_wards[,11:12]
buildings <- N_wards[,13:14]
building_editors <- N_wards[,15:16]
poi_poly <- N_wards[,17:18]
null_amenity <- N_wards[,19:20]
building_address <- N_wards[,21:22]
N_end <- N_wards[,c(1,23:28)]

#join back together by column in common
w1 <- left_join(begin, N_end, by=c("WARD"="WARD"))  #<-- DOUBLE UNDERSCORE
w1 <- left_join(w1, point_v1, by=c("WARD"="WARD__1"))  #<-- DOUBLE UNDERSCORE
w1 <- left_join(w1, line_v1, by=c("WARD"="WARD__2"))  #<-- DOUBLE UNDERSCORE
w1 <- left_join(w1, poly_v1, by=c("WARD"="WARD__3"))  #<-- DOUBLE UNDERSCORE
w1 <- left_join(w1, buildings, by=c("WARD"="WARD__4"))  #<-- DOUBLE UNDERSCORE
w1 <- left_join(w1, building_editors, by=c("WARD"="WARD__5"))  #<-- DOUBLE UNDERSCORE
w1 <- left_join(w1, poi_poly, by=c("WARD"="WARD__6"))  #<-- DOUBLE UNDERSCORE
w1 <- left_join(w1, null_amenity, by=c("WARD"="WARD__7"))  #<-- DOUBLE UNDERSCORE
w1 <- left_join(w1, building_address, by=c("WARD"="WARD__8"))  #<-- DOUBLE UNDERSCORE

#backup the original 
w2 <- w1

#change na to 0
w2[is.na(w2)] <- 0

#calculate statistics 

#total v1 edits
w2$total_v1 <- (w2$`Point v1`+w2$`Line v1`+w2$`Poly v1`)

#percentage v1 edits
w2$percent_v1 <- (w2$total_v1/w2$`total edits`)*100

#percentage polygons which are buildings
w2$percent_building <- (w2$Building/w2$Polygon_Count)*100

#percentage of poi with corresponding polygon
w2$percent_poi_poly <- (w2$poi_corresponding_poly/w2$Point_Count)*100

#percentage of poi which have null amenity 
w2$percent_null_amenity <- (w2$count_null_amenity_poi/w2$Point_Count)*100

#percent of buildings with low level addresses
w2$percent_building_address <- (w2$building_lowlvl_address/w2$Building)*100

#export as csv
write.csv(w2, file = "nairobi_ward_data_summary.csv")

#nairobi_wards_polys <- dbGetQuery(connection, "select * from nairobi_wards_polys")
#manchester_ward_polys <- dbGetQuery(connection, "select * from manchester_ward_polys")

#backup with csv
write.csv(nairobi_wards_polys, file = "nairobi_wards_polys")
write.csv(manchester_ward_polys, file = "manchester_ward_polys")

library("readxl")

#read in xslx file
M_wards <- read_excel("Ward_Analysis_Manchester.xlsx", sheet = "Sheet1")

#clean up duplicate ward names in different districts
M_wards[33, 1] = "Brooklands Ward Trafford"
M_wards[34, 1] = "Brooklands Ward Manchester"
M_wards[57, 1] = "Crompton Ward Oldham"
M_wards[58, 1] = "Crompton Ward Bolton"
M_wards[179, 1] = "st Marys ward bury"
M_wards[180, 1] = "st marys ward oldham"
M_wards[181, 1] = "st marys ward trafford"


#subset file into individual dataframes
M_begin <- M_wards[,1:6]
M_point_v1 <- M_wards[,7:8]
M_line_v1 <- M_wards[,9:10]
M_poly_v1 <- M_wards[,11:12]
M_buildings <- M_wards[,13:14]
M_building_editors <- M_wards[,15:16]
M_poi_poly <- M_wards[,17:18]
M_null_amenity <- M_wards[,19:20]
M_building_address <- M_wards[,21:22]
M_end <- M_wards[,c(1,23:28)]

#join back together by column in common
m1 <- left_join(M_begin, M_end, by=c("WARD"="WARD"))  #<-- DOUBLE UNDERSCORE
m1 <- left_join(m1, M_point_v1, by=c("WARD"="WARD__1"))  #<-- DOUBLE UNDERSCORE
m1 <- left_join(m1, M_line_v1, by=c("WARD"="WARD__2"))  #<-- DOUBLE UNDERSCORE
m1 <- left_join(m1, M_poly_v1, by=c("WARD"="WARD__3"))  #<-- DOUBLE UNDERSCORE
m1 <- left_join(m1, M_buildings, by=c("WARD"="WARD__4"))  #<-- DOUBLE UNDERSCORE
m1 <- left_join(m1, M_building_editors, by=c("WARD"="WARD__5"))  #<-- DOUBLE UNDERSCORE
m1 <- left_join(m1, M_poi_poly, by=c("WARD"="WARD__6"))  #<-- DOUBLE UNDERSCORE
m1 <- left_join(m1, M_null_amenity, by=c("WARD"="WARD__7"))  #<-- DOUBLE UNDERSCORE
m1 <- left_join(m1, M_building_address, by=c("WARD"="WARD__8"))  #<-- DOUBLE UNDERSCORE

#backup the original 
m2 <- m1

#change na to 0
m2[is.na(m2)] <- 0

#calculate statistics 

#total v1 edits
m2$total_v1 <- (m2$`Point v1`+m2$`Line v1`+m2$`Poly v1`)

#percentage v1 edits
m2$percent_v1 <- (m2$total_v1/m2$`total edits`)*100

#percentage polygons which are M_buildings
m2$percent_building <- (m2$Building/m2$Polygon_Count)*100

#percentage of poi with corresponding polygon
m2$percent_M_poi_poly <- (m2$poi_corresponding_poly/m2$Point_Count)*100

#percentage of poi which have null amenity 
m2$percent_M_null_amenity <- (m2$count_null_amenity_poi/m2$Point_Count)*100

#percent of M_buildings with low level addresses
m2$percent_M_building_address <- (m2$building_lowlvl_address/m2$Building)*100

#export as csv
write.csv(m2, file = "Manchester_ward_data_summary.csv")



#set relevant wd

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


#####################################REMOVING BULK IMPORTS####################################

##########################################MANCHESTER#########################################


#load manchester tables
m_bulkcheck_polygon <- dbGetQuery(connection, "select * from m_bulkcheck_polygon")
m_bulkcheck_point <- dbGetQuery(connection, "select * from m_bulkcheck_point")
m_bulkcheck_line <- dbGetQuery(connection, "select * from m_bulkcheck_line")

#left join
bb <- left_join(m_bulkcheck_point, m_bulkcheck_polygon, by=c("osm_uid"="osm_uid", "osm_timestamp"="osm_timestamp"))

#left join
bbb <- bb <- left_join(bb, m_bulkcheck_line, by=c("osm_uid"="osm_uid", "osm_timestamp"="osm_timestamp"))

#change column names
names(bbb)[3]<-"point"
names(bbb)[4]<-"poly"
names(bbb)[5]<-"line"

#replace na with 0
bbb[is.na(bbb)] <- 0

#add a daily total column for each user each day of edits
bbb$day_total <- (bbb$point+bbb$poly+bbb$line)


#option 1 ----------------------
#if more than 1000 edits per user per day, change day_total to na
bbb$day_total[bbb$day_total > 1000 & is.numeric(bbb$day_total)] <- NA

#remove na
bbb_nona <- na.omit(bbb)

#create dataframe of relevant columns with all bulk removes
manchester_minus_bulk <- bbb_nona[,1:3]
#write.csv(manchester_minus_bulk, file = "manchester_minus_bulk.csv")

#option 2 -----------------------
#backup dataframe
bbbx <- bbb
#create dataframe inlcuding only the rows which have na in the day_total column (>1000)
bbbx_na <- bbbx[is.na(bbbx$day_total),]

#double check 
sum(is.na(bbbx$day_total))

#create dataframe of relevant columns with just bulk
manchester_remove_bulk <- bbbx_na[,1:2]
#write.csv(manchester_remove_bulk, file = "manchester_remove_bulk.csv")

#######################################NAIROBI####################################
#load nairobi tables
n_bulkcheck_polygon <- dbGetQuery(connection, "select * from n_bulkcheck_polygon")
n_bulkcheck_point <- dbGetQuery(connection, "select * from n_bulkcheck_point")
n_bulkcheck_line <- dbGetQuery(connection, "select * from n_bulkcheck_line")

#join 2 tables
nn <- left_join(n_bulkcheck_point, n_bulkcheck_polygon, by=c("osm_uid"="osm_uid", "osm_timestamp"="osm_timestamp"))
#join third
nnn <- left_join(nn, n_bulkcheck_line, by=c("osm_uid"="osm_uid", "osm_timestamp"="osm_timestamp"))

#change column names
names(nnn)[3]<-"point"
names(nnn)[4]<-"poly"
names(nnn)[5]<-"line"

#replace na with -
nnn[is.na(nnn)] <- 0

#add total colum
nnn$day_total <- (nnn$point+nnn$poly+nnn$line)

nnn$day_total <- as.numeric(as.character(nnn$day_total))
#nnn[nnn$day_total >1000] <-

#replace any values in the day_total column >1000 with na
nnn$day_total[nnn$day_total > 1000 & is.numeric(nnn$day_total)] <- NA

#option1 ----------------
#remove na
nnn_nona <- na.omit(nnn)

#if more than 1000 edits per user per day, change day_total to na
nairobi_minus_bulk <- nnn_nona[,1:3]
#write.csv(nairobi_minus_bulk, file = "nairobi_minus_bulk.csv")

#backup df
nnnx <- nnn
#make df out of na rows online
nnnx_na <- nnnx[is.na(nnnx$day_total),]

#double check
sum(is.na(nnnx$day_total))

#create dataframe of relevant columns with just bul
nairobi_remove_bulk <- nnnx_na[,1:2]
#write.csv(nairobi_remove_bulk, file = "nairobi_remove_bulk.csv")





































#####NAIROBI#####


#point

#load in nairobi csv
n_count_total_point <- read_csv("n_count_total_point.csv")
n_count_within_point <- read_csv("n_count_within_point.csv")

#total counts per uid
#total <- nairobi_unique_count_total[,1:2]

#counts within nairobi per uid
#within <- n_count_within_point[,4:5]

#join by column in common
nairobi_combined <- left_join(n_count_total_point, n_count_within_point, by=c("osm_uid"="osm_uid"))

names(nairobi_combined)[2]<-"total"
names(nairobi_combined)[3]<-"within"

#remove rows with Na's
nairobi_combined_nona <- na.omit(nairobi_combined)

#calculate the percentage of edits within nairobi per uid
nairobi_combined_nona$percent_within <- (nairobi_combined_nona$within/nairobi_combined_nona$total)*100

#remove all uid's with less than 70% of their edits in the study region
nairobi_combined2 <- filter(nairobi_combined_nona, percent_within >= 70)

nairobi_uid_diss <- nairobi_combined2$id
write.csv(nairobi_uid_diss, file = "nairobi_uid_diss.csv")

#line

#load in nairobi csv
n_count_total_line <- read_csv("n_count_total_line.csv")
n_count_within_line <- read_csv("n_count_within_line.csv")

#join by column in common
ncombined <- left_join(n_count_total_line, n_count_within_line, by=c("osm_uid"="osm_uid"))

names(ncombined)[2]<-"total"
names(ncombined)[3]<-"within"

#remove rows with Na's
ncombined_nona <- na.omit(ncombined)

#calculate the percentage of edits within nairobi per uid
ncombined_nona$percent_within <- (ncombined_nona$within/ncombined_nona$total)*100

#remove all uid's with less than 70% of their edits in the study region
ncombined2 <- filter(ncombined_nona, percent_within >= 70)

#poly

#load in nairobi csv
n_count_total_poly <- read_csv("n_count_total_poly.csv")
n_count_within_poly <- read_csv("n_count_within_poly.csv")

#total counts per uid
#total <- nairobi_unique_count_total[,1:2]

#counts within nairobi per uid
#within <- n_count_within_point[,4:5]

#join by column in common
nair_combined <- left_join(n_count_total_poly, n_count_within_poly, by=c("osm_uid"="osm_uid"))

names(nair_combined)[2]<-"total"
names(nair_combined)[3]<-"within"

#remove rows with Na's
nair_combined_nona <- na.omit(nair_combined)

#calculate the percentage of edits within nairobi per uid
nair_combined_nona$percent_within <- (nair_combined_nona$within/nair_combined_nona$total)*100

#remove all uid's with less than 70% of their edits in the study region
nair_combined2 <- filter(nair_combined_nona, percent_within >= 70)


#Naiorbi total
total_combined <- left_join(n_count_total_point, n_count_total_line, by=c("osm_uid"="osm_uid"))
total_combined <- left_join(total_combined, n_count_total_poly, by=c("osm_uid"="osm_uid"))

#change column names
names(total_combined)[2]<-"point"
names(total_combined)[3]<-"line"
names(total_combined)[4]<-"poly"

#total
total_combined[is.na(total_combined)] <- 0
total_combined$total_total <- (total_combined$point+total_combined$line+total_combined$poly)

#within
within_combined <- left_join(n_count_within_point, n_count_within_line, by=c("osm_uid"="osm_uid"))
within_combined <- left_join(within_combined, n_count_within_poly, by=c("osm_uid"="osm_uid"))

#change column names 
names(within_combined)[2]<-"point_within"
names(within_combined)[3]<-"line_within"
names(within_combined)[4]<-"poly_within"

#change na's to 0
within_combined[is.na(within_combined)] <- 0

#calculate total
within_combined$total_total_within <- (within_combined$point_within+within_combined$line_within+within_combined$poly_within)

#both
#join
N1 <- left_join(total_combined, within_combined, by=c("osm_uid"="osm_uid"))

#change na to 0
N1[is.na(N1)] <- 0
#subset
N2 <- N1[, c(1, 5, 9)]

#Calculate percentage
N2$percent_within <- (N2$total_total_within/N2$total_total)*100

#filter 70%+
N3 <- filter(N2, percent_within >= 70)

nairobi_uid_filt<-N3$osm_uid
write.csv(nairobi_uid_filt, file = "nairobi__uid_filt.csv")

#############################################################################################################################


#####GREATER MANCHESTER#####


#point

#load in manchester csv
m_count_total_point <- read_csv("m_count_total_point.csv")
m_count_within_point <- read_csv("m_count_within_point.csv")

#join by column in common
manchester_combined <- left_join(m_count_total_point, m_count_within_point, by=c("osm_uid"="osm_uid"))

names(manchester_combined)[2]<-"total"
names(manchester_combined)[3]<-"within"

#remove rows with Na's
manchester_combined_nona <- na.omit(manchester_combined)

#calculate the percentage of edits within manchester per uid
manchester_combined_nona$percent_within <- (manchester_combined_nona$within/manchester_combined_nona$total)*100

#remove all uid's with less than 70% of their edits in the study region
manchester_combined2 <- filter(manchester_combined_nona, percent_within >= 70)


#line

#load in manchester csv
m_count_total_line <- read_csv("m_count_total_line.csv")
m_count_within_line <- read_csv("m_count_within_line.csv")

#join by column in common
mcombined <- left_join(m_count_total_line, m_count_within_line, by=c("osm_uid"="osm_uid"))

names(mcombined)[2]<-"total"
names(mcombined)[3]<-"within"

#remove rows with Na's
mcombined_nona <- na.omit(mcombined)

#calculate the percentage of edits within manchester per uid
mcombined_nona$percent_within <- (mcombined_nona$within/mcombined_nona$total)*100

#remove all uid's with less than 70% of their edits in the study region
mcombined2 <- filter(mcombined_nona, percent_within >= 70)

#poly

#load in manchester csv
m_count_total_poly <- read_csv("m_count_total_poly.csv")
m_count_within_poly <- read_csv("m_count_within_poly.csv")

#join by column in common
gm_combined <- left_join(m_count_total_poly, m_count_within_poly, by=c("osm_uid"="osm_uid"))

names(gm_combined)[2]<-"total"
names(gm_combined)[3]<-"within"

#remove rows with Na's
gm_combined_nona <- na.omit(nair_combined)

names(gm_combined_nona)[2]<-"total"
names(gm_combined_nona)[3]<-"within"

#calculate the percentage of edits within manchester per uid
gm_combined_nona$percent_within <- (gm_combined_nona$within/gm_combined_nona$total)*100

#remove all uid's with less than 70% of their edits in the study region
gm_combined2 <- filter(gm_combined_nona, percent_within >= 70)


#total
greater_manchester_total_combined <- left_join(m_count_total_point, m_count_total_line, by=c("osm_uid"="osm_uid")) #join point and line
greater_manchester_total_combined <- left_join(greater_manchester_total_combined, m_count_total_poly, by=c("osm_uid"="osm_uid")) #add poly

#change column names
names(greater_manchester_total_combined)[2]<-"point"
names(greater_manchester_total_combined)[3]<-"line"
names(greater_manchester_total_combined)[4]<-"poly"

#change na to 0
greater_manchester_total_combined[is.na(greater_manchester_total_combined)] <- 0

#total
greater_manchester_total_combined$total_total <- (greater_manchester_total_combined$point+greater_manchester_total_combined$line+greater_manchester_total_combined$poly)

###within
greater_manchester_within_combined <- left_join(m_count_within_point, m_count_within_line, by=c("osm_uid"="osm_uid"))
greater_manchester_within_combined <- left_join(greater_manchester_within_combined, m_count_within_poly, by=c("osm_uid"="osm_uid"))

#change column names
names(greater_manchester_within_combined)[2]<-"point_within"
names(greater_manchester_within_combined)[3]<-"line_within"
names(greater_manchester_within_combined)[4]<-"poly_within"

#change na's to 0
greater_manchester_within_combined[is.na(greater_manchester_within_combined)] <- 0

#total within
greater_manchester_within_combined$total_total_within <- (greater_manchester_within_combined$point_within+greater_manchester_within_combined$line_within+greater_manchester_within_combined$poly_within)

#both
#join
M1 <- left_join(greater_manchester_total_combined, greater_manchester_within_combined, by=c("osm_uid"="osm_uid"))
M1[is.na(M1)] <- 0
M2 <- gm_OMG[, c(1, 5, 9)]

M2$percent_within <- (M2$total_total_within/M2$total_total)*100

M3 <- filter(M2, percent_within >= 70)

manchester_uid_filt<-M3$osm_uid
write.csv(manchester_uid_filt, file = "manchester__uid_filt.csv")



































































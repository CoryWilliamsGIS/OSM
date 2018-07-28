#Clean up of the 'PROGRESS.r' code 


#RESOURCES USED:
#https://github.com/CoryWilliamsGIS/London-House-Prices/blob/master/LDN_House_Prices.R
#http://www.sthda.com/english/wiki/correlation-matrix-a-quick-start-guide-to-analyze-format-and-visualize-a-correlation-matrix-using-r-software
#http://www.sthda.com/english/wiki/visualize-correlation-matrix-using-correlogram


#NOTES:
#REMEMBER THE ISSUES WITH THE NAMES OF WARDS WERE DUE TO THE CHANGES IN WARD BOUNDARIES AND NAMES IN 2018
#THEREFORE DID NOT ALIGN WITH THE 2011 CENSUS 
#THEREFORE A PRE-2018 SHAPEFILE OF GREATER MANCHESTER WARDS HAD TO BE DOWNLOADED 
#THEN THE ISSUES WERE WITH DUPLICIATE NAMES OF WARDS 
#FOR EXAMPLE 'ST MARY'S' IS PRESENT THREE TIMES, WITH ONE IN OLDHAM, ONE IN MANCHESTER ETC.
#THESE WERE CHANGED TO INCLUDE THEIR RESPECTIVE LOCAL AUTHORITY NAME AND ALLOW FOR A SUCCESSFUL JOIN WITH THE SHAPEFILE


#MORE NOTES:
#SHOULD DEFO ADD MORE THINGS INTO THE DEPENDENT VARIABLES, SUCH AS TOTAL POINTS, LINES, POLYGONS ETC 
#*********THESE SUMMARY STATISTICS HAVE TO BE RECALCULATED USING THE NEW SHAPEFILES*********#
#*********ADD MORE INDEPENDENT VARIABLES... CASE STUDY DEPENDENT***********#
#*********!!!!!!!REMEMBER TO REMOVE MULTICOLLINEARITY!!!!!!!*************************

#LINEAR REGRESSION AND SPATIAL AUTOCORRELATION

#INSTALL RELEVANT PACKAGES
library(rgdal)
library(dplyr)
library(ggplot2)
library(ggmap) 
library(RColorBrewer)
library(readxl)
library(corrplot)
library("readxl")

#LOAD IN INDEPENDENT VARIABLE DATA
Nairobi <- read_excel("Case_study_common_data.xlsx", sheet = "Nairobi")   
GM_PCA <- read_excel("Case_study_common_data.xlsx", sheet = "GM_PCA")

#REMOVE UNNEEDED COLUMN
GM_PCA <- GM_PCA[,-1]

#LOAD IN DEPENDENT VARIABLE DATA 
Manchester_ward_tags <- read_excel("casestudy_ward_tags.xlsx", sheet = "New_Greater_Manchester")

#REARARRANGE TO FIX DUPLICATE DATA 
#WARD NAMES DUPLICATE AS OCCUR IN DIFFERENT CONSTITUENCIES
Manchester_ward_tags1 <- Manchester_ward_tags[, c(50,1:49)]

#WHEN THE WARD CODE IS THIS, ALTER THE NAMES TO THIS
#--E05000654 - crompton_bolton
#--E05000724 - crompton_oldham
#--E05000691 - brooklands_manchester
#--Brooklands - brooklands_trafford
#--E05000683 - st marys_bury
#--E05000735 -- st marys_oldham
#--E05000834 -- st marys_trafford

#CHANGE NAMES IN DEPENDENT VARIABLES
Manchester_ward_tags1[58,2] <-  "Crompton Bolton"
Manchester_ward_tags1[59,2] <-  "Crompton Oldham"
Manchester_ward_tags1[34,2] <-  "Brooklands Manchester"
Manchester_ward_tags1[35,2] <-  "Brooklands Trafford"
Manchester_ward_tags1[179,2] <-  "St Mary's Bury"
Manchester_ward_tags1[180,2] <-  "St Mary's Oldham"
Manchester_ward_tags1[181,2] <-  "St Mary's Trafford"

#REORGANISE
Manchester_ward_tags1 <- Manchester_ward_tags1[, c(1:50, 1)]
Manchester_ward_tags <- Manchester_ward_tags1
Manchester_ward_tags <- Manchester_ward_tags[,-1]

#CHANGE NAMES IN INDEPENDENT VARIABLES
GM_PCA[5,2] <-  "Crompton Bolton"
GM_PCA[75,2] <-  "Crompton Oldham"
GM_PCA[42,2] <-  "Brooklands Manchester"
GM_PCA[174,2] <-  "Brooklands Trafford"
GM_PCA[86,2] <-  "St Mary's Oldham"
GM_PCA[185,2] <-  "St Mary's Trafford"
GM_PCA[34,2] <-  "St Mary's Bury"

#SUBSET THE DEPENDANT VARIABLES DATA FRAME
m_tag_begin <- Manchester_ward_tags[,1]
m_tag_school <- Manchester_ward_tags[,2:3]
m_tag_college <- Manchester_ward_tags[,4:5]
m_tag_pub <- Manchester_ward_tags[,6:7]
m_tag_bar <- Manchester_ward_tags[,8:9]
m_tag_pharmacy <- Manchester_ward_tags[,10:11]
m_tag_hospital <- Manchester_ward_tags[,12:13]
m_tag_dentist <- Manchester_ward_tags[,14:15]
m_tag_clinic <- Manchester_ward_tags[,16:17]
m_tag_police <- Manchester_ward_tags[,18:19]
m_tag_bank <- Manchester_ward_tags[,20:21]
m_tag_atm <- Manchester_ward_tags[,22:23]
m_tag_restaurant <- Manchester_ward_tags[,24:25]
m_tag_fast_food <- Manchester_ward_tags[,26:27]
m_tag_toilets <- Manchester_ward_tags[,28:29]
m_tag_drinking_water <- Manchester_ward_tags[,30:31]
m_tag_place_of_worship <- Manchester_ward_tags[,32:33]
m_tag_bus_stop <- Manchester_ward_tags[,34:35]
m_tag_street_lamp <- Manchester_ward_tags[,36:37]
m_tag_hotel <- Manchester_ward_tags[,38:39]
m_tag_industrial <- Manchester_ward_tags[,40:41]
m_tag_apartment <- Manchester_ward_tags[,42:43]
m_tag_house <- Manchester_ward_tags[,44:45]
m_tag_church <- Manchester_ward_tags[,46:47]
m_tag_mosque <- Manchester_ward_tags[,48:49]

m_tag_drinking_water[is.na(m_tag_drinking_water)] <- 0

#JOIN BACK TOGETHER 

#FIRST COLUMN - ALL WARD NAMES
m_tag1 <- m_tag_begin

#JOIN EACH TAG
m_tag1 <- left_join(m_tag1, m_tag_school, by=c("ward"="ward1"))  
m_tag1 <- left_join(m_tag1, m_tag_college, by=c("ward"="ward2"))  
m_tag1 <- left_join(m_tag1, m_tag_pub, by=c("ward"="ward3"))  
m_tag1 <- left_join(m_tag1, m_tag_bar, by=c("ward"="ward4"))  
m_tag1 <- left_join(m_tag1, m_tag_pharmacy, by=c("ward"="ward5"))
m_tag1 <- left_join(m_tag1, m_tag_hospital, by=c("ward"="ward6"))  
m_tag1 <- left_join(m_tag1, m_tag_dentist, by=c("ward"="ward7"))  
m_tag1 <- left_join(m_tag1, m_tag_clinic, by=c("ward"="ward8"))  
m_tag1 <- left_join(m_tag1, m_tag_police, by=c("ward"="ward9"))  
m_tag1 <- left_join(m_tag1, m_tag_bank, by=c("ward"="ward10"))  
m_tag1 <- left_join(m_tag1, m_tag_atm, by=c("ward"="ward11"))  
m_tag1 <- left_join(m_tag1, m_tag_restaurant, by=c("ward"="ward12"))  
m_tag1 <- left_join(m_tag1, m_tag_fast_food, by=c("ward"="ward13"))  
m_tag1 <- left_join(m_tag1, m_tag_toilets, by=c("ward"="ward14"))  
#m_tag1 <- left_join(m_tag1, m_tag_drinking_water, by=c("ward"="ward15"))   #EMPTY - CAUSES AN ERROR
m_tag1 <- left_join(m_tag1, m_tag_place_of_worship, by=c("ward"="ward16"))  
m_tag1 <- left_join(m_tag1, m_tag_bus_stop, by=c("ward"="ward17"))  
m_tag1 <- left_join(m_tag1, m_tag_street_lamp, by=c("ward"="ward18"))  
m_tag1 <- left_join(m_tag1, m_tag_hotel, by=c("ward"="ward19"))  
m_tag1 <- left_join(m_tag1, m_tag_industrial, by=c("ward"="ward20"))  
m_tag1 <- left_join(m_tag1, m_tag_apartment, by=c("ward"="ward21"))  
m_tag1 <- left_join(m_tag1, m_tag_house, by=c("ward"="ward22"))  
m_tag1 <- left_join(m_tag1, m_tag_church, by=c("ward"="ward23"))  
m_tag1 <- left_join(m_tag1, m_tag_mosque, by=c("ward"="ward24"))

#CHANGE VARIABLE NAME  
m_tag2 <- m_tag1

#CHANGE NA TO 0
m_tag2[is.na(m_tag2)] <- 0

#EXPORT CSV
#write.csv(m_tag2, file = "Manchester_wards_whatismapped.csv")

#CHANGE VARIABLE NAMES
depdf <- m_tag2
indepdf <- GM_PCA

#SUCCESSFUL JOIN - NO DATA DELETED 
join <- left_join(indepdf, depdf, by=c("Ward name"="ward"))

#EXPORT CSV
#write.csv(join, file = "Manchester_wards_join.csv")

#CORRELATION MATRIX 
#http://www.sthda.com/english/wiki/correlation-matrix-a-quick-start-guide-to-analyze-format-and-visualize-a-correlation-matrix-using-r-software


#should defo add total point, line and polygon into the dependent variables
#count of buildings
#the more summary things



#CHANGE VARIABLE NAME
indepcor <- indepdf
depcor <- depdf
#INSTALL RELEVANT PACKAGE
library("Hmisc")
#REMOVE NON-NUMERIC COLUMNS (E.G. WARD NAME, CODE ETC)
indepcor <- indepcor[,-17:-18]
indepcor <- indepcor[,-1:-2]
indepcor2 <- rcorr(as.matrix(indepcor))
indepcor2
indepcor2$r

#ASSIGN THE CORRELATION TO THE RES VARIABLE AND ROUND IT TO THREE DECIMAL PLACES
res <- cor(indepcor)
round(res, 3)

#INSTALL RELEVANT PACKAGE
library("corrplot")

#SYMNUM = SYMBOLIC NUMBER CODER - REPLACES COEFFICIENTS WITH SYMBOLS
symnum(res, abbr.colnames = FALSE)

#PLOT CORRELATION PLOT
#THERE ARE MANY WAYS TO MAKE THIS LOOK MUCH BETTER IN THE RESOURCES AT THE TOP OF THIS DOCUMENT
#CAN BE USED TO SHOW WHY SPECIFIC VARIABLES REMOVED DUE TO HIGH DEPENDENCY (MULTICOLLINEARITY)
#not sure what the signif level doe stho
#correlation matrix between independent values
corrplot(indepcor2$r, type="upper", order="hclust", 
         p.mat = indepcor2$P, sig.level = 0.1, insig = "blank")

#same for dependent values (could be amazing diss did this - check?)
#View(depcor)
depcor <- depcor[,-1]
res2 <- cor(depcor)
depcor2 <- rcorr(as.matrix(depcor))
round(res2, 3)
symnum(res2, abbr.colnames = FALSE)
corrplot(depcor2$r , type="upper", order="hclust", 
         p.mat = depcor2$P, sig.level = 0.1, insig = "blank")


#MULTICOLLINEARITY SHOULD BE EMOVED NOW!!!



#SHOULD I BE RESCALING BEFORE IN DO LINEAR REGRESSION??????
#CHECK ASSUMPTIONS?!?!?!?
#MALWAI DISS
#rescale <- function(x) (x-min(x))/(max(x) - min(x)) * 100

#MULTIPLE LINEAR REGRESSION
#https://www.sheffield.ac.uk/polopoly_fs/1.536483!/file/MASH_multiple_regression_R.pdf


#LM WORKS LIKE:    lm(dependent~independent1+ independent2+ ...)

#CHANGE NAMES TO STOP ERRORS
names(join)[4]<-"pp_hh"
names(join)[5]<-"total_hh"

#MULTICOLLINEARITY SHOULD BE EMOVED NOW!!!

#REMEMBER TO ADD THE OTHER OSM STATISTICS WHEN YOU DECIDE WHICH TO USE*******************************
#REMEMBER TO ADD THE OTHER INDEPENDENT (DEMOGRAPHIC) VARIABLES YOU WANT TO USE***********************
#LINEAR REGRESSION FOR EACH OSM STATISTIC
lm_school <- lm(join$School~join$population+ join$pp_hh+ join$`general sex ratio (females to males)`+ join$`% of households owning house they live in`+ join$total_hh+ join$`% population U18`+ join$`% pop 18-64`+ join$`% pop over 64`+ join$`% households with 1-3 people`+ join$`% households with 4-6 people`+ join$`% households with 7+ people`)

lm_college <- lm(join$College~join$population+ join$pp_hh+ join$`general sex ratio (females to males)`+ join$`% of households owning house they live in`+ join$total_hh+ join$`% population U18`+ join$`% pop 18-64`+ join$`% pop over 64`+ join$`% households with 1-3 people`+ join$`% households with 4-6 people`+ join$`% households with 7+ people`)

lm_pub <- lm(join$Pub~join$population+ join$pp_hh+ join$`general sex ratio (females to males)`+ join$`% of households owning house they live in`+ join$total_hh+ join$`% population U18`+ join$`% pop 18-64`+ join$`% pop over 64`+ join$`% households with 1-3 people`+ join$`% households with 4-6 people`+ join$`% households with 7+ people`)

lm_bar <- lm(join$Bar~join$population+ join$pp_hh+ join$`general sex ratio (females to males)`+ join$`% of households owning house they live in`+ join$total_hh+ join$`% population U18`+ join$`% pop 18-64`+ join$`% pop over 64`+ join$`% households with 1-3 people`+ join$`% households with 4-6 people`+ join$`% households with 7+ people`)

lm_pharmacy <- lm(join$Pharmacy~join$population+ join$pp_hh+ join$`general sex ratio (females to males)`+ join$`% of households owning house they live in`+ join$total_hh+ join$`% population U18`+ join$`% pop 18-64`+ join$`% pop over 64`+ join$`% households with 1-3 people`+ join$`% households with 4-6 people`+ join$`% households with 7+ people`)

lm_hospital <- lm(join$Hospital~join$population+ join$pp_hh+ join$`general sex ratio (females to males)`+ join$`% of households owning house they live in`+ join$total_hh+ join$`% population U18`+ join$`% pop 18-64`+ join$`% pop over 64`+ join$`% households with 1-3 people`+ join$`% households with 4-6 people`+ join$`% households with 7+ people`)

lm_clinic <- lm(join$Clinic~join$population+ join$pp_hh+ join$`general sex ratio (females to males)`+ join$`% of households owning house they live in`+ join$total_hh+ join$`% population U18`+ join$`% pop 18-64`+ join$`% pop over 64`+ join$`% households with 1-3 people`+ join$`% households with 4-6 people`+ join$`% households with 7+ people`)

lm_police <- lm(join$Police~join$population+ join$pp_hh+ join$`general sex ratio (females to males)`+ join$`% of households owning house they live in`+ join$total_hh+ join$`% population U18`+ join$`% pop 18-64`+ join$`% pop over 64`+ join$`% households with 1-3 people`+ join$`% households with 4-6 people`+ join$`% households with 7+ people`)

lm_dentist <- lm(join$Dentist~join$population+ join$pp_hh+ join$`general sex ratio (females to males)`+ join$`% of households owning house they live in`+ join$total_hh+ join$`% population U18`+ join$`% pop 18-64`+ join$`% pop over 64`+ join$`% households with 1-3 people`+ join$`% households with 4-6 people`+ join$`% households with 7+ people`)

lm_bank <- lm(join$Bank~join$population+ join$pp_hh+ join$`general sex ratio (females to males)`+ join$`% of households owning house they live in`+ join$total_hh+ join$`% population U18`+ join$`% pop 18-64`+ join$`% pop over 64`+ join$`% households with 1-3 people`+ join$`% households with 4-6 people`+ join$`% households with 7+ people`)

lm_atm <- lm(join$ATM~join$population+ join$pp_hh+ join$`general sex ratio (females to males)`+ join$`% of households owning house they live in`+ join$total_hh+ join$`% population U18`+ join$`% pop 18-64`+ join$`% pop over 64`+ join$`% households with 1-3 people`+ join$`% households with 4-6 people`+ join$`% households with 7+ people`)

lm_restaurant <- lm(join$Restaurant~join$population+ join$pp_hh+ join$`general sex ratio (females to males)`+ join$`% of households owning house they live in`+ join$total_hh+ join$`% population U18`+ join$`% pop 18-64`+ join$`% pop over 64`+ join$`% households with 1-3 people`+ join$`% households with 4-6 people`+ join$`% households with 7+ people`)

lm_fastfood <- lm(join$`Fast Food`~join$population+ join$pp_hh+ join$`general sex ratio (females to males)`+ join$`% of households owning house they live in`+ join$total_hh+ join$`% population U18`+ join$`% pop 18-64`+ join$`% pop over 64`+ join$`% households with 1-3 people`+ join$`% households with 4-6 people`+ join$`% households with 7+ people`)

lm_toilets <- lm(join$Toilets~join$population+ join$pp_hh+ join$`general sex ratio (females to males)`+ join$`% of households owning house they live in`+ join$total_hh+ join$`% population U18`+ join$`% pop 18-64`+ join$`% pop over 64`+ join$`% households with 1-3 people`+ join$`% households with 4-6 people`+ join$`% households with 7+ people`)

lm_placeofworship <- lm(join$`Place of Worship`~join$population+ join$pp_hh+ join$`general sex ratio (females to males)`+ join$`% of households owning house they live in`+ join$total_hh+ join$`% population U18`+ join$`% pop 18-64`+ join$`% pop over 64`+ join$`% households with 1-3 people`+ join$`% households with 4-6 people`+ join$`% households with 7+ people`)

lm_busstop <- lm(join$Bus_Stop~join$population+ join$pp_hh+ join$`general sex ratio (females to males)`+ join$`% of households owning house they live in`+ join$total_hh+ join$`% population U18`+ join$`% pop 18-64`+ join$`% pop over 64`+ join$`% households with 1-3 people`+ join$`% households with 4-6 people`+ join$`% households with 7+ people`)

lm_streetlmap <- lm(join$`Street Lamp`~join$population+ join$pp_hh+ join$`general sex ratio (females to males)`+ join$`% of households owning house they live in`+ join$total_hh+ join$`% population U18`+ join$`% pop 18-64`+ join$`% pop over 64`+ join$`% households with 1-3 people`+ join$`% households with 4-6 people`+ join$`% households with 7+ people`)

lm_hotel <- lm(join$Hotel~join$population+ join$pp_hh+ join$`general sex ratio (females to males)`+ join$`% of households owning house they live in`+ join$total_hh+ join$`% population U18`+ join$`% pop 18-64`+ join$`% pop over 64`+ join$`% households with 1-3 people`+ join$`% households with 4-6 people`+ join$`% households with 7+ people`)

lm_industrial <- lm(join$Industrial~join$population+ join$pp_hh+ join$`general sex ratio (females to males)`+ join$`% of households owning house they live in`+ join$total_hh+ join$`% population U18`+ join$`% pop 18-64`+ join$`% pop over 64`+ join$`% households with 1-3 people`+ join$`% households with 4-6 people`+ join$`% households with 7+ people`)

lm_apartments <- lm(join$Apartments~join$population+ join$pp_hh+ join$`general sex ratio (females to males)`+ join$`% of households owning house they live in`+ join$total_hh+ join$`% population U18`+ join$`% pop 18-64`+ join$`% pop over 64`+ join$`% households with 1-3 people`+ join$`% households with 4-6 people`+ join$`% households with 7+ people`)

lm_house <- lm(join$House~join$population+ join$pp_hh+ join$`general sex ratio (females to males)`+ join$`% of households owning house they live in`+ join$total_hh+ join$`% population U18`+ join$`% pop 18-64`+ join$`% pop over 64`+ join$`% households with 1-3 people`+ join$`% households with 4-6 people`+ join$`% households with 7+ people`)

lm_church <- lm(join$Church~join$population+ join$pp_hh+ join$`general sex ratio (females to males)`+ join$`% of households owning house they live in`+ join$total_hh+ join$`% population U18`+ join$`% pop 18-64`+ join$`% pop over 64`+ join$`% households with 1-3 people`+ join$`% households with 4-6 people`+ join$`% households with 7+ people`)

lm_mosque <- lm(join$Mosque~join$population+ join$pp_hh+ join$`general sex ratio (females to males)`+ join$`% of households owning house they live in`+ join$total_hh+ join$`% population U18`+ join$`% pop 18-64`+ join$`% pop over 64`+ join$`% households with 1-3 people`+ join$`% households with 4-6 people`+ join$`% households with 7+ people`)

#SUMMARISE THE REGRESSION
#currently the summary returns NA for 2 variables due to singularities
#the reason for this is due to high multicollinearity amoung the independent variables
#this will be removed 
summary(lm_school)
summary(lm_college)
summary(lm_pub)
summary(lm_pharmacy)
summary(lm_hospital)
summary(lm_clinic)
summary(lm_police)
summary(lm_dentist)
summary(lm_bank)
summary(lm_atm)
summary(lm_restaurant)
summary(lm_fastfood)
summary(lm_toilets)
summary(lm_placeofworship)
summary(lm_busstop)
summary(lm_streetlmap)
summary(lm_hotel)
summary(lm_industrial)
summary(lm_apartments)
summary(lm_house)
summary(lm_church)
summary(lm_mosque)



#======MALAWI - KEEPING CODE IN AS MAY BE USEFUL=======================================
#MAKES A COOL IMAGE (MALAWI DISS) BUT NOT SURE WHAT IT SHOWS.....
#IT IS A TEST FOR MULTICOLLINEARITY BUT I PREFER MINE ABOVE
#pairs.panels(indepcor,cor=TRUE,lm=TRUE,hist.col="cyan",method="pearson",scale=FALSE,pch = 20, cex = 1)
#cor.plot(indepcor,colors=TRUE,main="Correlation plot (matrix)")
#look into what this step function does...something to do with variable choice?
#stepmodel1 <- step(lm_restaurant)
#summary(stepmodel1)
#plot(stepmodel1,scale="adjr2",main="y = sovi")
#varimp(stepmodel1, scale=FALSE)
#library(rmarkdown)
#library(partykit)
#library(C50)
#library(leaps)
#library(psych)

#SHOULD I BE RESCALING BEFORE IN DO LINEAR REGRESSION??????
#CHECK ASSUMPTIONS?!?!?!?
#MALWAI DISS
#rescale <- function(x) (x-min(x))/(max(x) - min(x)) * 100






#SPATIAL AUTOCORRELATION!!

#INSTALL RELEVANT PACKAGES
library(sp)    
library(rgdal)
library(rgeos)
library(tmap)    
library(spatstat)
library(maptools)
library(classInt)
library(RColorBrewer)
library(dplyr)

#LOAD THE SHAPEFILE (THIS ONE THE DUPLICATE NAME HAVE BEEN EDITED IN QGIS TO ALLOW FOR A SUCCESSFUL JOIN)
GM_wardshp1 <- readOGR(dsn=".", layer = "gm_wardsshp1")
#PLOT
plot(GM_wardshp1)

#REMOVE UNNEEDED COLUMNS
join <- join[,-17:-18]
#CHANGE COLUMN NAME TO ALLOW FOR SUCCESSFUL JOIN TO SHAPEFILE
colnames(join)[2] <- "name"

#JOIN THE DATAFRAME CONTAINING DEPENDENT AND INDEPENDENT VARIABLES ONTO THE SHAPEFILE
jointrial <- merge(GM_wardshp1, join)

#TEST - PLOT AN EXAMPLE INDEPENDENT VARIABLE
plot(jointrial$`% of households owning house they live in`)

#ASSIGN EXAMPLE BREAKS AND PRINT THEM
breaks <- classIntervals(jointrial$total_hh, n=6, style = "fisher")
print(breaks)

#EXAMPLE CODE FOR A MAP
tm_shape(jointrial)+
  tm_fill("total_hh", title="total", pallete="Reds")+
  tm_borders(alpha =.8)+
  tm_layout("Total Households", 
            legend.title.size = 1.2,
            legend.text.size = 0.9, 
            legend.position = c("left", "bottom"))


#MORANS I

#LOAD RELEVANT PACKAGE
library(spdep)

#CALCULATE A NEIGHOURS LIST FOR EACH POLYGON
neighbours <- poly2nb(jointrial)

#PLOT GREATER MANCHESTER, THEN THE NEIGHBOURS IN RED 
plot(jointrial, col="grey")
plot(neighbours, coordinates(jointrial), add = TRUE, col='red')

#CREATE LISTW AND PERFORM MORAN TEST ON THE TOTAL HOUSEHOLDS IN EACH WARD (EXAMPLE)
listw <- nb2listw(neighbours)
listw
moran.test(jointrial$total_hh, listw)

#CREATE A LOCAL MORAN OUTPUT
local <- localmoran(x = jointrial$total_hh, listw = nb2listw(neighbours, style = "W"))

#BIND THE RESULT TO THE MAP
local_moran_map <- cbind(jointrial, local)

#MAP THE RESULT - EXAMPLE
tm_shape(local_moran_map) + tm_fill(col = "Ii", style = "quantile", title = "Local Moran Statistic")+
  tm_layout("Spatial Autocorrelation of Total Households",
            legend.title.size=1.2,
            legend.text.size=1,
            legend.position=c("left","bottom"))


#NOW REPEAT FOR 

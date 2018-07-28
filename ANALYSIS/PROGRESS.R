library(rgdal)
library(dplyr)
library(ggplot2)
library(ggmap) 
library(RColorBrewer)
library(readxl)
library(corrplot)
library("readxl")


Nairobi <- read_excel("Case_study_common_data.xlsx", sheet = "Nairobi")   
GM_PCA <- read_excel("Case_study_common_data.xlsx", sheet = "GM_PCA")
GM_PCA <- GM_PCA[,-1]

#GM_PCA <- GM_PCA[,-15:-16]
#res <- cor(GM_PCA)
#res <- round(res, 3)


Manchester_ward_tags <- read_excel("casestudy_ward_tags.xlsx", sheet = "New_Greater_Manchester")
Manchester_ward_tags1 <- Manchester_ward_tags[, c(50,1:49)]




#--E05000654 - crompton_bolton
#--E05000724 - crompton_oldham
#--E05000691 - brooklands_manchester
#--Brooklands - brooklands_trafford
#--E05000683 - st marys_bury
#--E05000735 -- st marys_oldham
#--E05000834 -- st marys_trafford

#chage in gm_pca
#c
Manchester_ward_tags1[58,2] <-  "Crompton Bolton"
Manchester_ward_tags1[59,2] <-  "Crompton Oldham"
Manchester_ward_tags1[34,2] <-  "Brooklands Manchester"
Manchester_ward_tags1[35,2] <-  "Brooklands Trafford"
Manchester_ward_tags1[179,2] <-  "St Mary's Bury"
Manchester_ward_tags1[180,2] <-  "St Mary's Oldham"
Manchester_ward_tags1[181,2] <-  "St Mary's Trafford"
Manchester_ward_tags1 <- Manchester_ward_tags1[, c(1:50, 1)]
Manchester_ward_tags <- Manchester_ward_tags1
Manchester_ward_tags <- Manchester_ward_tags[,-1]

GM_PCA[5,2] <-  "Crompton Bolton"
GM_PCA[75,2] <-  "Crompton Oldham"
GM_PCA[42,2] <-  "Brooklands Manchester"
GM_PCA[174,2] <-  "Brooklands Trafford"
GM_PCA[86,2] <-  "St Mary's Oldham"
GM_PCA[185,2] <-  "St Mary's Trafford"
GM_PCA[34,2] <-  "St Mary's Bury"

#Mags, GM_PCA[,2:3], by=c("ward"="Ward name"))



#Manchester
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

#join back together, 

#first column - al wards
m_tag1 <- m_tag_begin

#join each tag 
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
#m_tag1 <- left_join(m_tag1, m_tag_drinking_water, by=c("ward"="ward15"))  
m_tag1 <- left_join(m_tag1, m_tag_place_of_worship, by=c("ward"="ward16"))  
m_tag1 <- left_join(m_tag1, m_tag_bus_stop, by=c("ward"="ward17"))  
m_tag1 <- left_join(m_tag1, m_tag_street_lamp, by=c("ward"="ward18"))  
m_tag1 <- left_join(m_tag1, m_tag_hotel, by=c("ward"="ward19"))  
m_tag1 <- left_join(m_tag1, m_tag_industrial, by=c("ward"="ward20"))  
m_tag1 <- left_join(m_tag1, m_tag_apartment, by=c("ward"="ward21"))  
m_tag1 <- left_join(m_tag1, m_tag_house, by=c("ward"="ward22"))  
m_tag1 <- left_join(m_tag1, m_tag_church, by=c("ward"="ward23"))  
m_tag1 <- left_join(m_tag1, m_tag_mosque, by=c("ward"="ward24"))

#backup the original 
m_tag2 <- m_tag1

#change na to 0
m_tag2[is.na(m_tag2)] <- 0

write.csv(m_tag2, file = "Manchester_wards_whatismapped.csv")

depdf <- m_tag2
indepdf <- GM_PCA

#depdf <- names(depdf)[1] <- "ward"
#indepdf <- names(indepdf)[2] <- "ward"
#depdf <- as.numeric(depdf)
#indepdf <- as.numeric(indepdf)

#depdf <- as.data.frame(depdf)
#indepdf <- as.data.frame(indepdf)
#xxxxx <- merge(x = depdf, y = indepdf, by = "ward", all = TRUE)

#is.data.frame(depdf)

#?left_join


#not joining because the names are not the same on the dataframes
#also remember to change the ward ones for the duplicate names in diff area

#wardlist <- gsub("\\s*\\w*$", "", depdf$ward)
#depdf <- as.data.frame(depdf)
#wardlist
#depdf$ward <- wardlist
#wardlist2 <- gsub("\\s*\\w*$", "", indepdf$`Ward code`)
#indepdf$ `Ward code`<- wardlist2

join <- left_join(indepdf, depdf, by=c("Ward name"="ward"))

#write.csv(join, file = "Manchester_wards_join.csv")

#correlation matrix 
#http://www.sthda.com/english/wiki/correlation-matrix-a-quick-start-guide-to-analyze-format-and-visualize-a-correlation-matrix-using-r-software


#should defo add total point, line and polygon into the dependent variables
#count of buildings
#the more summary things




indepcor <- indepdf
depcor <- depdf
library("Hmisc")
indepcor <- indepcor[,-17:-18]
indepcor <- indepcor[,-1:-2]
indepcor2 <- rcorr(as.matrix(indepcor))
indepcor2
indepcor2$r

res <- cor(indepcor)
round(res, 3)

library("corrplot")



symnum(res, abbr.colnames = FALSE)

corrplot(res, type = "upper", order = "hclust", 
         tl.col = "black", tl.srt = 45)

#this produces a nice plot
#can be used to explain why certain things removed
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



#regression
#https://www.sheffield.ac.uk/polopoly_fs/1.536483!/file/MASH_multiple_regression_R.pdf



#lm(dependent~independent1+ independent2+ ...)
#working
#reg2 <- lm(join$School~join$population+ join$`general sex ratio (females to males)`+ join$`Persons per household (avg hh size)`+ join$)
#summary(reg2)

#reg2 <- lm(join$School~join$population+ join$`Persons per household (avg hh size)`+ join$`general sex ratio (females to males)`+ join$`Total people age 5-14`+ join$`total people aged 15-17`+ 

#join$population+
#join$`Persons per household (avg hh size)`+
#join$`general sex ratio (females to males)`+
#join$`Total people age 5-14`
#join$`total people aged 15-17`
#join$`total people aged 25 and over`
#join$`% of households owning house they live in`+
#join$`total households`+
#join$`% population U18`+
#join$`% pop 18-64`+
#join$`% pop over 64`+
#join$`% households with 1-3 people`+
#join$`% households with 4-6 people`+
#join$`% households with 7+ people`+

names(join)[4]<-"pp_hh"
names(join)[5]<-"total_hh"

#basic regression - re run for each osm statistic... use summary() to get the summary
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

#currently the summary returns NA for 2 variables due to singularities
#the reason for this is due to high multicollinearity amoung the independent variables
#this will be removed 



#so you got a basic linear regression working 
#now you have to add the case study specific variables.... including lots for manchester to highlight specific variables
#need to attempt it at constituency level 
#need to do spatial autocorrelation
#



pairs.panels(indepcor,cor=TRUE,lm=TRUE,hist.col="cyan",method="pearson",scale=FALSE,pch = 20, cex = 1)
cor.plot(indepcor,colors=TRUE,main="Correlation plot (matrix)")

#look into what this step function does...something to do with variable choice?
stepmodel1 <- step(lm_restaurant)
summary(stepmodel1)

plot(stepmodel1,scale="adjr2",main="y = sovi")

varimp(stepmodel1, scale=FALSE)

###malawi 
install.packages("rmarkdown")
install.packages("partykit")
install.packages("C50")
install.packages("leaps")
install.packages("psych")

library(rmarkdown)
library(partykit)
library(C50)
library(leaps)
library(psych)


rescale <- function(x) (x-min(x))/(max(x) - min(x)) * 100






#spatial autocorrelation morans I

library(sp)    
library(rgdal)
library(rgeos)
library(tmap)    
library(spatstat)
library(maptools)
library(classInt)
library(RColorBrewer)
library(dplyr)


GM_wardshp1 <- readOGR(dsn=".", layer = "gm_wardsshp1")
plot(GM_wardshp1)


join <- join[,-17:-18]

colnames(join)[2] <- "name"
#GM
#n_occur <- data.frame(table(GM_PCA$`Ward name`))
#n_occur[n_occur$Freq > 1, ]



jointrial <- merge(GM_wardshp1, join)

plot(jointrial$`% of households owning house they live in`)

breaks <- classIntervals(jointrial$total_hh, n=6, style = "fisher")
print(breaks)

#example map!!!!
tm_shape(jointrial)+
  tm_fill("total_hh", title="total", pallete="Reds")+
  tm_borders(alpha =.8)+
  tm_layout("Total Households", 
            legend.title.size = 1.2,
            legend.text.size = 0.9, 
            legend.position = c("left", "bottom"))


#spatial autocorrelation

library(spdep)

#calculate nearest neighbour

#calculate a neighbours list for each polygon
neighbours <- poly2nb(jointrial)

#plot greater manchester, adding the neighbours list on top
plot(jointrial, col="grey")
plot(neighbours, coordinates(jointrial), add = TRUE, col='red')

#create listw and perform moran test 
listw <- nb2listw(neighbours)
listw
moran.test(jointrial$total_hh, listw)

#create a local moran output
local <- localmoran(x = jointrial$total_hh, listw = nb2listw(neighbours, style = "W"))

#bind the result to the map
local_moran_map <- cbind(jointrial, local)

#map the result
tm_shape(local_moran_map) + tm_fill(col = "Ii", style = "quantile", title = "Local Moran Statistic")+
  tm_layout("Spatial Autocorrelation of Total Households",
            legend.title.size=1.2,
            legend.text.size=1,
            legend.position=c("left","bottom"))


#indepdf[,1] <- lapply(indepdf, gsub, pattern="'", replacement="")
#indepdf <- apply(indepdf, 1, gsub, pattern = "'", replacement = "")
#indepdf <- as.data.frame(indepdf)

#depdf$ward[depdf$ward == "Crompton Ward"] <- "Crompton"
#indepdf$`Ward name`[indepdf$`Ward name` == "St Mary's"] <- "St Marys"
#depdf$ward[depdf$ward == "st marys ward"] <- "St Marys"
#depdf$ward[depdf$ward == "Miles Platting & Newton Heath"] <- "Miles Platting and Newton Heath"
#depdf$ward[depdf$ward == "Bramhall South and Woodford"] <- "Bramhall South"
#depdf$ward[depdf$ward == "Marple South and High Lane"] <- "Marple South"
#depdf$ward[depdf$ward == "Ashton St. Michael's"] <- "Ashton St Michaels"
#indepdf$`Ward name`[indepdf$`Ward name` == "Ashton St Michael's"] <- "Ashton St Michaels"
#indepdf$`Ward name`[indepdf$`Ward name` == "St Mary's"] <- "St Marys"
#indepdf$`Ward name`[indepdf$`Ward name` == "St James'"] <- "St James"
#depdf$ward[depdf$ward == "St. James'"] <- "St James"
#depdf$ward[depdf$ward == "Brooklands Ward"] <- "Brooklands"
#depdf$ward[depdf$ward == "Bucklow-St. Martins"] <- "Bucklow-St Martins"
#depdf$ward[depdf$ward == "St. Peter's"] <- "St Peters"
#indepdf$`Ward name`[indepdf$`Ward name` == "St Peter's"] <- "St Peters"
#indepdf$`Ward name`[indepdf$`Ward name` == "Gorton & Abbey Hey Ward"] <- "Gorton & Abbey Hey"


join <- left_join(indepdf, depdf, by=c("Ward name"="ward"))
join <- join[,-17:-18]




#check the matches for the join by exporting the new manc wards to the old file above and attempting to join it....
# re reun the nairobi scrips 






Bucklow-St. Martins

Brooklans
Bucklow-St Martins




#depdf$ward[depdf$ward == "Ancoats & Beswick"] <- "Ancoats & Clayton"
#depdf$ward[depdf$ward == "Bradshaw"] <- "Bradford"




#st marys
#ancoats
#bradford
#brooklands
#city centre
#gorton north, gorton south
#st james
#st marys


##picadilly and deansgate replaced the city centre
#bradford, bradshaw, haliwell
#ancoats & beswick... ancoats & clayton
#ancoats & clayton and bradford replaced by ancoats & beswick


#ancoats & clayton and bradford --> therefore merge the results of these
#gorton North and South --> Gorton & Abbey Hey# merge the result of these


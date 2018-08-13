#install.packages("caret")
library(caret)
#install.packages("pls")
library(pls)
library(rgdal)
library(dplyr)
library(ggplot2)
library(ggmap)
library(RColorBrewer)
library(readxl)
library(corrplot)
library("readxl")


#Nairobi <- read_excel("Case_study_common_data.xlsx", sheet = "Nairobi")
GM_PCA <-
  read_excel("Case_study_common_data.xlsx", sheet = "GM_PCA")
GM_PCA <- GM_PCA[, -1]
gm_sum <-
  read_excel("Manchester_ward_data_summary.xlsx", sheet = "Manchester_ward_data_summary")

#GM_PCA <- GM_PCA[,-15:-16]
#res <- cor(GM_PCA)
#res <- round(res, 3)


Manchester_ward_tags <-
  read_excel("casestudy_ward_tags.xlsx", sheet = "New_Greater_Manchester")
Manchester_ward_tags1 <- Manchester_ward_tags[, c(50, 1:49)]

#distinct users per ward
#read in excel file which you have exported each in
m_uid <- read_excel("m_uid_poi1.xlsx", sheet = "overalll")
#count unique per ward
#remember to minus one from each column value as blank / NA is counted as 1 unique value
gmz <- lengths(lapply(m_uid, unique))
#better to copy and paste
#copy and paste into excel using the formula =RIGHT(A1,SUM(LEN(A1) - LEN(SUBSTITUTE(A1, {"0","1","2","3","4","5","6","7","8","9"},"")))) to extract the number
as.data.frame(gmz)


#--E05000654 - crompton_bolton
#--E05000724 - crompton_oldham
#--E05000691 - brooklands_manchester
#--Brooklands - brooklands_trafford
#--E05000683 - st marys_bury
#--E05000735 -- st marys_oldham
#--E05000834 -- st marys_trafford

#chage in gm_pca
#c
Manchester_ward_tags1[58, 2] <-  "Crompton Bolton"
Manchester_ward_tags1[59, 2] <-  "Crompton Oldham"
Manchester_ward_tags1[34, 2] <-  "Brooklands Manchester"
Manchester_ward_tags1[35, 2] <-  "Brooklands Trafford"
Manchester_ward_tags1[179, 2] <-  "St Mary's Bury"
Manchester_ward_tags1[180, 2] <-  "St Mary's Oldham"
Manchester_ward_tags1[181, 2] <-  "St Mary's Trafford"
Manchester_ward_tags1 <- Manchester_ward_tags1[, c(1:50, 1)]
Manchester_ward_tags <- Manchester_ward_tags1
Manchester_ward_tags <- Manchester_ward_tags[, -1]

GM_PCA[5, 2] <-  "Crompton Bolton"
GM_PCA[75, 2] <-  "Crompton Oldham"
GM_PCA[42, 2] <-  "Brooklands Manchester"
GM_PCA[174, 2] <-  "Brooklands Trafford"
GM_PCA[86, 2] <-  "St Mary's Oldham"
GM_PCA[185, 2] <-  "St Mary's Trafford"
GM_PCA[34, 2] <-  "St Mary's Bury"

#Mags, GM_PCA[,2:3], by=c("ward"="Ward name"))



#Manchester
m_tag_begin <- Manchester_ward_tags[, 1]
m_tag_school <- Manchester_ward_tags[, 2:3]
m_tag_college <- Manchester_ward_tags[, 4:5]
m_tag_pub <- Manchester_ward_tags[, 6:7]
m_tag_bar <- Manchester_ward_tags[, 8:9]
m_tag_pharmacy <- Manchester_ward_tags[, 10:11]
m_tag_hospital <- Manchester_ward_tags[, 12:13]
m_tag_dentist <- Manchester_ward_tags[, 14:15]
m_tag_clinic <- Manchester_ward_tags[, 16:17]
m_tag_police <- Manchester_ward_tags[, 18:19]
m_tag_bank <- Manchester_ward_tags[, 20:21]
m_tag_atm <- Manchester_ward_tags[, 22:23]
m_tag_restaurant <- Manchester_ward_tags[, 24:25]
m_tag_fast_food <- Manchester_ward_tags[, 26:27]
m_tag_toilets <- Manchester_ward_tags[, 28:29]
m_tag_drinking_water <- Manchester_ward_tags[, 30:31]
m_tag_place_of_worship <- Manchester_ward_tags[, 32:33]
m_tag_bus_stop <- Manchester_ward_tags[, 34:35]
m_tag_street_lamp <- Manchester_ward_tags[, 36:37]
m_tag_hotel <- Manchester_ward_tags[, 38:39]
m_tag_industrial <- Manchester_ward_tags[, 40:41]
m_tag_apartment <- Manchester_ward_tags[, 42:43]
m_tag_house <- Manchester_ward_tags[, 44:45]
m_tag_church <- Manchester_ward_tags[, 46:47]
m_tag_mosque <- Manchester_ward_tags[, 48:49]
m_tag_unique_users <- gm_sum[, 1:6]

m_tag_drinking_water[is.na(m_tag_drinking_water)] <- 0

#join back together,

#first column - al wards
m_const_tag1 <- m_tag_begin

#join each tag
m_tag1 <- left_join(m_tag1, m_tag_unique_users, by = c("ward" = "WARD"))
m_tag1 <- left_join(m_tag1, m_tag_school, by = c("ward" = "ward1"))
m_tag1 <- left_join(m_tag1, m_tag_college, by = c("ward" = "ward2"))
m_tag1 <- left_join(m_tag1, m_tag_pub, by = c("ward" = "ward3"))
m_tag1 <- left_join(m_tag1, m_tag_bar, by = c("ward" = "ward4"))
m_tag1 <- left_join(m_tag1, m_tag_pharmacy, by = c("ward" = "ward5"))
m_tag1 <- left_join(m_tag1, m_tag_hospital, by = c("ward" = "ward6"))
m_tag1 <- left_join(m_tag1, m_tag_dentist, by = c("ward" = "ward7"))
m_tag1 <- left_join(m_tag1, m_tag_clinic, by = c("ward" = "ward8"))
m_tag1 <- left_join(m_tag1, m_tag_police, by = c("ward" = "ward9"))
m_tag1 <- left_join(m_tag1, m_tag_bank, by = c("ward" = "ward10"))
m_tag1 <- left_join(m_tag1, m_tag_atm, by = c("ward" = "ward11"))
m_tag1 <-
  left_join(m_tag1, m_tag_restaurant, by = c("ward" = "ward12"))
m_tag1 <-
  left_join(m_tag1, m_tag_fast_food, by = c("ward" = "ward13"))
m_tag1 <- left_join(m_tag1, m_tag_toilets, by = c("ward" = "ward14"))
#m_tag1 <- left_join(m_tag1, m_tag_drinking_water, by=c("ward"="ward15"))
m_tag1 <-
  left_join(m_tag1, m_tag_place_of_worship, by = c("ward" = "ward16"))
m_tag1 <- left_join(m_tag1, m_tag_bus_stop, by = c("ward" = "ward17"))
m_tag1 <-
  left_join(m_tag1, m_tag_street_lamp, by = c("ward" = "ward18"))
m_tag1 <- left_join(m_tag1, m_tag_hotel, by = c("ward" = "ward19"))
m_tag1 <-
  left_join(m_tag1, m_tag_industrial, by = c("ward" = "ward20"))
m_tag1 <-
  left_join(m_tag1, m_tag_apartment, by = c("ward" = "ward21"))
m_tag1 <- left_join(m_tag1, m_tag_house, by = c("ward" = "ward22"))
m_tag1 <- left_join(m_tag1, m_tag_church, by = c("ward" = "ward23"))
m_tag1 <- left_join(m_tag1, m_tag_mosque, by = c("ward" = "ward24"))


#backup the original
m_tag2 <- m_tag1

#change na to 0
m_tag2[is.na(m_tag2)] <- 0

#write.csv(m_tag2, file = "Manchester_wards_whatismapped.csv")

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

join <- left_join(indepdf, depdf, by = c("Ward name" = "ward"))

#write.csv(join, file = "Manchester_wards_join.csv")

#correlation matrix
#http://www.sthda.com/english/wiki/correlation-matrix-a-quick-start-guide-to-analyze-format-and-visualize-a-correlation-matrix-using-r-software


#should defo add total point, line and polygon into the dependent variables
#count of buildings
#the more summary things

rescale <- function(x)
  (x - min(x)) / (max(x) - min(x)) * 100
indepdf$highest_qual_level4_plus <-
  as.numeric(indepdf$highest_qual_level4_plus)

population <- indepdf$population
population <- rescale(as.numeric(population))
indepdf$population <- population
indepdf$car_or_van <- rescale(as.numeric(indepdf$car_or_van))
indepdf$highest_qual_level4_plus <-
  rescale(as.numeric(indepdf$highest_qual_level4_plus))
indepdf$christian_count <-
  rescale(as.numeric(indepdf$christian_count))
indepdf$Muslim_count <- rescale(indepdf$muslim_count)





indepcor <- indepdf
depcor <- depdf
library("Hmisc")
#indepcor <- indepcor[,-17:-18]
indepcor <- indepcor[, -1:-2]
indepcor2 <- rcorr(as.matrix(indepcor))
indepcor2
indepcor2$r
mr <- as.data.frame(indepcor2$r)
#View(mr)
indepcor <-
  indepcor[c(-2, -3, -5:-7,-12,-13), c(-2, -3, -5:-7,-12,-13)]
indepdf <- indepdf
#View(indepdf)

#write.csv(mr, file = "gm_ward_indep_cor.csv")

#ADD ADDITIONAL VARIABLES TO MANCHESTER!!!!!! MAKE USE OF GREAT DATA IN UK



res <- cor(indepcor)
round(res, 3)

library("corrplot")



#symnum(res, abbr.colnames = FALSE)

corrplot(
  res,
  type = "upper",
  order = "hclust",
  tl.col = "black",
  tl.srt = 45
)

#this produces a nice plot
#can be used to explain why certain things removed
#not sure what the signif level doe stho
#correlation matrix between independent values
corrplot(
  indepcor2$r,
  type = "upper",
  order = "hclust",
  p.mat = indepcor2$P,
  sig.level = 0.1,
  insig = "blank"
)

#same for dependent values (could be amazing diss did this - check?)
#View(depcor)
depcor <- depcor[, -1]
res2 <- cor(depcor)
depcor2 <- rcorr(as.matrix(depcor))
round(res2, 3)
symnum(res2, abbr.colnames = FALSE)

#best one yet - just edit names to make them shorter!!!!
corrplot(
  depcor2$r ,
  type = "upper",
  order = "hclust",
  p.mat = depcor2$P,
  sig.level = 0.1,
  insig = "blank"
)



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

names(join)[4] <- "pp_hh"
names(join)[5] <- "total_hh"

#basic regression - re run for each osm statistic... use summary() to get the summary
lm_school <-
  lm(
    join$School ~ join$population + join$pp_hh + join$`general sex ratio (females to males)` + join$`% of households owning house they live in` + join$total_hh + join$`% population U18` + join$`% pop 18-64` + join$`% pop over 64` + join$`% households with 1-3 people` + join$`% households with 4-6 people` + join$`% households with 7+ people`
  )
lm_college <-
  lm(
    join$College ~ join$population + join$pp_hh + join$`general sex ratio (females to males)` + join$`% of households owning house they live in` + join$total_hh + join$`% population U18` + join$`% pop 18-64` + join$`% pop over 64` + join$`% households with 1-3 people` + join$`% households with 4-6 people` + join$`% households with 7+ people`
  )
lm_pub <-
  lm(
    join$Pub ~ join$population + join$pp_hh + join$`general sex ratio (females to males)` + join$`% of households owning house they live in` + join$total_hh + join$`% population U18` + join$`% pop 18-64` + join$`% pop over 64` + join$`% households with 1-3 people` + join$`% households with 4-6 people` + join$`% households with 7+ people`
  )
lm_bar <-
  lm(
    join$Bar ~ join$population + join$pp_hh + join$`general sex ratio (females to males)` + join$`% of households owning house they live in` + join$total_hh + join$`% population U18` + join$`% pop 18-64` + join$`% pop over 64` + join$`% households with 1-3 people` + join$`% households with 4-6 people` + join$`% households with 7+ people`
  )
lm_pharmacy <-
  lm(
    join$Pharmacy ~ join$population + join$pp_hh + join$`general sex ratio (females to males)` + join$`% of households owning house they live in` + join$total_hh + join$`% population U18` + join$`% pop 18-64` + join$`% pop over 64` + join$`% households with 1-3 people` + join$`% households with 4-6 people` + join$`% households with 7+ people`
  )
lm_hospital <-
  lm(
    join$Hospital ~ join$population + join$pp_hh + join$`general sex ratio (females to males)` + join$`% of households owning house they live in` + join$total_hh + join$`% population U18` + join$`% pop 18-64` + join$`% pop over 64` + join$`% households with 1-3 people` + join$`% households with 4-6 people` + join$`% households with 7+ people`
  )
lm_clinic <-
  lm(
    join$Clinic ~ join$population + join$pp_hh + join$`general sex ratio (females to males)` + join$`% of households owning house they live in` + join$total_hh + join$`% population U18` + join$`% pop 18-64` + join$`% pop over 64` + join$`% households with 1-3 people` + join$`% households with 4-6 people` + join$`% households with 7+ people`
  )
lm_police <-
  lm(
    join$Police ~ join$population + join$pp_hh + join$`general sex ratio (females to males)` + join$`% of households owning house they live in` + join$total_hh + join$`% population U18` + join$`% pop 18-64` + join$`% pop over 64` + join$`% households with 1-3 people` + join$`% households with 4-6 people` + join$`% households with 7+ people`
  )
lm_dentist <-
  lm(
    join$Dentist ~ join$population + join$pp_hh + join$`general sex ratio (females to males)` + join$`% of households owning house they live in` + join$total_hh + join$`% population U18` + join$`% pop 18-64` + join$`% pop over 64` + join$`% households with 1-3 people` + join$`% households with 4-6 people` + join$`% households with 7+ people`
  )
lm_bank <-
  lm(
    join$Bank ~ join$population + join$pp_hh + join$`general sex ratio (females to males)` + join$`% of households owning house they live in` + join$total_hh + join$`% population U18` + join$`% pop 18-64` + join$`% pop over 64` + join$`% households with 1-3 people` + join$`% households with 4-6 people` + join$`% households with 7+ people`
  )
lm_atm <-
  lm(
    join$ATM ~ join$population + join$pp_hh + join$`general sex ratio (females to males)` + join$`% of households owning house they live in` + join$total_hh + join$`% population U18` + join$`% pop 18-64` + join$`% pop over 64` + join$`% households with 1-3 people` + join$`% households with 4-6 people` + join$`% households with 7+ people`
  )
lm_restaurant <-
  lm(
    join$Restaurant ~ join$population + join$pp_hh + join$`general sex ratio (females to males)` + join$`% of households owning house they live in` + join$total_hh + join$`% population U18` + join$`% pop 18-64` + join$`% pop over 64` + join$`% households with 1-3 people` + join$`% households with 4-6 people` + join$`% households with 7+ people`
  )
lm_fastfood <-
  lm(
    join$`Fast Food` ~ join$population + join$pp_hh + join$`general sex ratio (females to males)` + join$`% of households owning house they live in` + join$total_hh + join$`% population U18` + join$`% pop 18-64` + join$`% pop over 64` + join$`% households with 1-3 people` + join$`% households with 4-6 people` + join$`% households with 7+ people`
  )
lm_toilets <-
  lm(
    join$Toilets ~ join$population + join$pp_hh + join$`general sex ratio (females to males)` + join$`% of households owning house they live in` + join$total_hh + join$`% population U18` + join$`% pop 18-64` + join$`% pop over 64` + join$`% households with 1-3 people` + join$`% households with 4-6 people` + join$`% households with 7+ people`
  )
lm_placeofworship <-
  lm(
    join$`Place of Worship` ~ join$population + join$pp_hh + join$`general sex ratio (females to males)` + join$`% of households owning house they live in` + join$total_hh + join$`% population U18` + join$`% pop 18-64` + join$`% pop over 64` + join$`% households with 1-3 people` + join$`% households with 4-6 people` + join$`% households with 7+ people`
  )
lm_busstop <-
  lm(
    join$Bus_Stop ~ join$population + join$pp_hh + join$`general sex ratio (females to males)` + join$`% of households owning house they live in` + join$total_hh + join$`% population U18` + join$`% pop 18-64` + join$`% pop over 64` + join$`% households with 1-3 people` + join$`% households with 4-6 people` + join$`% households with 7+ people`
  )
lm_streetlmap <-
  lm(
    join$`Street Lamp` ~ join$population + join$pp_hh + join$`general sex ratio (females to males)` + join$`% of households owning house they live in` + join$total_hh + join$`% population U18` + join$`% pop 18-64` + join$`% pop over 64` + join$`% households with 1-3 people` + join$`% households with 4-6 people` + join$`% households with 7+ people`
  )
lm_hotel <-
  lm(
    join$Hotel ~ join$population + join$pp_hh + join$`general sex ratio (females to males)` + join$`% of households owning house they live in` + join$total_hh + join$`% population U18` + join$`% pop 18-64` + join$`% pop over 64` + join$`% households with 1-3 people` + join$`% households with 4-6 people` + join$`% households with 7+ people`
  )
lm_industrial <-
  lm(
    join$Industrial ~ join$population + join$pp_hh + join$`general sex ratio (females to males)` + join$`% of households owning house they live in` + join$total_hh + join$`% population U18` + join$`% pop 18-64` + join$`% pop over 64` + join$`% households with 1-3 people` + join$`% households with 4-6 people` + join$`% households with 7+ people`
  )
lm_apartments <-
  lm(
    join$Apartments ~ join$population + join$pp_hh + join$`general sex ratio (females to males)` + join$`% of households owning house they live in` + join$total_hh + join$`% population U18` + join$`% pop 18-64` + join$`% pop over 64` + join$`% households with 1-3 people` + join$`% households with 4-6 people` + join$`% households with 7+ people`
  )
lm_house <-
  lm(
    join$House ~ join$population + join$pp_hh + join$`general sex ratio (females to males)` + join$`% of households owning house they live in` + join$total_hh + join$`% population U18` + join$`% pop 18-64` + join$`% pop over 64` + join$`% households with 1-3 people` + join$`% households with 4-6 people` + join$`% households with 7+ people`
  )
lm_church <-
  lm(
    join$Church ~ join$population + join$pp_hh + join$`general sex ratio (females to males)` + join$`% of households owning house they live in` + join$total_hh + join$`% population U18` + join$`% pop 18-64` + join$`% pop over 64` + join$`% households with 1-3 people` + join$`% households with 4-6 people` + join$`% households with 7+ people`
  )
lm_mosque <-
  lm(
    join$Mosque ~ join$population + join$pp_hh + join$`general sex ratio (females to males)` + join$`% of households owning house they live in` + join$total_hh + join$`% population U18` + join$`% pop 18-64` + join$`% pop over 64` + join$`% households with 1-3 people` + join$`% households with 4-6 people` + join$`% households with 7+ people`
  )

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


#clean up
rm(
  lm_atm,
  lm_apartments,
  lm_bank,
  lm_bar,
  lm_busstop,
  lm_church,
  lm_clinic,
  lm_college,
  lm_dentist,
  lm_drinkingwater,
  lm_fastfood,
  lm_ftdensity,
  lm_hospital,
  lm_hotel,
  lm_house,
  lm_industrial,
  lm_line,
  lm_mosque,
  lm_osmuid,
  lm_pharmacy,
  lm_placeofworship,
  lm_point,
  lm_police,
  lm_polygon,
  lm_pub,
  lm_restaurant,
  lm_school,
  lm_streetlamp,
  lm_toilets,
  lm_totaledits
)

rm(
  m_tag_apartment,
  m_tag_atm,
  m_tag_bank,
  m_tag_bar,
  m_tag_begin,
  m_tag_bus_stop,
  m_tag_church,
  m_tag_clinic,
  m_tag_college,
  m_tag_dentist,
  m_tag_drinking_water,
  m_tag_fast_food,
  m_tag_hospital,
  m_tag_hotel,
  m_tag_house,
  m_tag_industrial,
  m_tag_mosque,
  m_tag_pharmacy,
  m_tag_place_of_worship,
  m_tag_police,
  m_tag_pub,
  m_tag_restaurant,
  m_tag_school,
  m_tag_street_lamp,
  m_tag_toilets,
  m_tag_unique_users
)


#currently the summary returns NA for 2 variables due to singularities
#the reason for this is due to high multicollinearity amoung the independent variables
#this will be removed



#so you got a basic linear regression working
#now you have to add the case study specific variables.... including lots for manchester to highlight specific variables
#need to attempt it at constituency level
#need to do spatial autocorrelation
#



pairs.panels(
  indepcor,
  cor = TRUE,
  lm = TRUE,
  hist.col = "cyan",
  method = "pearson",
  scale = FALSE,
  pch = 20,
  cex = 1
)
cor.plot(indepcor, colors = TRUE, main = "Correlation plot (matrix)")

#look into what this step function does...something to do with variable choice?
stepmodel1 <- step(lm_restaurant)
summary(stepmodel1)

plot(stepmodel1, scale = "adjr2", main = "y = sovi")

varimp(stepmodel1, scale = FALSE)

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

#cite malawai
rescale <- function(x)
  (x - min(x)) / (max(x) - min(x)) * 100






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


GM_wardshp1 <- readOGR(dsn = ".", layer = "gm_wardsshp1")
plot(GM_wardshp1)


join <- join[, -17:-18]

colnames(join)[2] <- "name"
#GM
#n_occur <- data.frame(table(GM_PCA$`Ward name`))
#n_occur[n_occur$Freq > 1, ]



jointrial <- merge(GM_wardshp1, join)

plot(jointrial$`% of households owning house they live in`)

breaks <- classIntervals(jointrial$total_hh, n = 6, style = "fisher")
print(breaks)

#example map!!!!
tm_shape(jointrial) +
  tm_fill("total_hh", title = "total", pallete = "Reds") +
  tm_borders(alpha = .8) +
  tm_layout(
    "Total Households",
    legend.title.size = 1.2,
    legend.text.size = 0.9,
    legend.position = c("left", "bottom")
  )


#spatial autocorrelation

library(spdep)

#calculate nearest neighbour

#calculate a neighbours list for each polygon
neighbours <- poly2nb(jointrial)


#plot greater manchester, adding the neighbours list on top
plot(jointrial, col = "grey")
plot(neighbours,
     coordinates(jointrial),
     add = TRUE,
     col = 'red')


#create m_const_listw and perform moran test
listw <- nb2listw(neighbours)
listw
moran.test(lm_totaledits$residuals, listw)
moran.test(lm_point$residuals, listw)
moran.test(lm_line$residuals, listw)
moran.test(lm_polygon$residuals, listw)
moran.test(lm_ft_density$residuals, listw)
moran.test(lm_school$residuals, listw)
moran.test(lm_college$residuals, listw)
moran.test(lm_pub$residuals, listw)
moran.test(lm_bar$residuals, listw)
moran.test(lm_pharmacy$residuals, listw)
moran.test(lm_hospital$residuals, listw)
moran.test(lm_dentist$residuals, listw)
moran.test(lm_clinic$residuals, listw)
moran.test(lm_police$residuals, listw)
moran.test(lm_bank$residuals, listw)
moran.test(lm_atm$residuals, listw)
moran.test(lm_restaurant$residuals, listw)
moran.test(lm_fastfood$residuals, listw)
moran.test(lm_toilets$residuals, listw)
moran.test(lm_drinkingwater$residuals, listw)
moran.test(lm_placeofworship$residuals, listw)
moran.test(lm_busstop$residuals, listw)
moran.test(lm_streetlmap$residuals, listw)
moran.test(lm_hotel$residuals, listw)
moran.test(lm_industrial$residuals, listw)
moran.test(lm_apartments$residuals, listw)
moran.test(lm_house$residuals, listw)
moran.test(lm_church$residuals, listw)
moran.test(lm_mosque$residuals, listw)



lm_mosque <- lm(
  join$Mosque ~
    join$population +
    join$pp_hh +
    join$`general sex ratio (females to males)` +
    join$`% of households owning house they live in` +
    join$total_hh +
    join$`% population U18` +
    join$`% pop 18-64` +
    join$`% pop over 64` +
    join$`% households with 1-3 people` +
    join$`% households with 4-6 people` +
    join$`% households with 7+ people`
)


geary.test(join$population, listw)

moran.test(join$population, listw)
moran.test(join$pp_hh, listw)
moran.test(join$`general sex ratio (females to males)`, listw)
moran.test(join$`% of households owning house they live in`, listw)
moran.test(join$total_hh, listw)
moran.test(join$`% population U18`, listw)
moran.test(join$`% pop 18-64`, listw)
moran.test(join$`% pop over 64`, listw)
moran.test(join$`% households with 1-3 people`, listw)
moran.test(join$`% households with 4-6 people`, listw)
moran.test(join$`% households with 7+ people`, listw)

moran.plot(join$population, listw)
plot(moran.mc(join$population, listw, nsim = 100))

#moran.test()#create a local moran output
local <-
  localmoran(x = join$population,
             listw = nb2listw(neighbours, style = "W"))

#bind the result to the map
local_moran_map <- cbind(jointrial, local)

#map the result
tm_shape(local_moran_map) + tm_fill(col = "Ii", style = "quantile", title = "Local Moran Statistic") +
  tm_layout(
    "Spatial Autocorrelation of population",
    legend.title.size = 1.2,
    legend.text.size = 1,
    legend.position = c("left", "bottom")
  )




#======================================================================
#MANCHESTER CONSTITUENCIES

manc_dep <-
  read_excel("manchester_const_dep.xlsx", sheet = "Sheet1")
manc_indep <-
  read_excel("Manchester_const_indep.xlsx", sheet = "Sheet1")


m_tag_begin <- manc_dep[, 1:7]
m_tag_school <- manc_dep[, 8:9]
m_tag_college <- manc_dep[, 10:11]
m_tag_pub <- manc_dep[, 12:13]
m_tag_bar <- manc_dep[, 14:15]
m_tag_pharmacy <- manc_dep[, 16:17]
m_tag_hospital <- manc_dep[, 18:19]
m_tag_dentist <- manc_dep[, 20:21]
m_tag_clinic <- manc_dep[, 22:23]
m_tag_police <- manc_dep[, 24:25]
m_tag_bank <- manc_dep[, 26:27]
m_tag_atm <- manc_dep[, 28:29]
m_tag_restaurant <- manc_dep[, 30:31]
m_tag_fast_food <- manc_dep[, 32:33]
m_tag_toilets <- manc_dep[, 34:35]
#m_tag_drinking_water <- manc_dep[,36:37]
m_tag_place_of_worship <- manc_dep[, 36:37]
m_tag_bus_stop <- manc_dep[, 38:39]
m_tag_street_lamp <- manc_dep[, 40:41]
m_tag_hotel <- manc_dep[, 42:43]
m_tag_industrial <- manc_dep[, 44:45]
m_tag_apartment <- manc_dep[, 46:47]
m_tag_house <- manc_dep[, 48:49]
m_tag_church <- manc_dep[, 50:51]
m_tag_mosque <- manc_dep[, 52:53]
m_tag_unique_users <- gm_sum[, 1:6]

m_const_tag1 <- m_tag_begin
m_const_tag1 <-
  left_join(m_const_tag1, m_tag_school, by = c("name" = "name0"))
m_const_tag1 <-
  left_join(m_const_tag1, m_tag_college, by = c("name" = "name1"))
m_const_tag1 <-
  left_join(m_const_tag1, m_tag_pub, by = c("name" = "name2"))
m_const_tag1 <-
  left_join(m_const_tag1, m_tag_bar, by = c("name" = "name3"))
m_const_tag1 <-
  left_join(m_const_tag1, m_tag_pharmacy, by = c("name" = "name4"))
m_const_tag1 <-
  left_join(m_const_tag1, m_tag_hospital, by = c("name" = "name5"))
m_const_tag1 <-
  left_join(m_const_tag1, m_tag_dentist, by = c("name" = "name6"))
m_const_tag1 <-
  left_join(m_const_tag1, m_tag_clinic, by = c("name" = "name7"))
m_const_tag1 <-
  left_join(m_const_tag1, m_tag_police, by = c("name" = "name8"))
m_const_tag1 <-
  left_join(m_const_tag1, m_tag_bank, by = c("name" = "name9"))
m_const_tag1 <-
  left_join(m_const_tag1, m_tag_atm, by = c("name" = "name10"))
m_const_tag1 <-
  left_join(m_const_tag1, m_tag_restaurant, by = c("name" = "name11"))
m_const_tag1 <-
  left_join(m_const_tag1, m_tag_fast_food, by = c("name" = "name12"))
m_const_tag1 <-
  left_join(m_const_tag1, m_tag_toilets, by = c("name" = "name13"))
#m_const_tag1 <- left_join(m_const_tag1, m_tag_drinking_water, by=c("name"="name15"))
m_const_tag1 <-
  left_join(m_const_tag1, m_tag_place_of_worship, by = c("name" = "name15"))
m_const_tag1 <-
  left_join(m_const_tag1, m_tag_bus_stop, by = c("name" = "name16"))
m_const_tag1 <-
  left_join(m_const_tag1, m_tag_street_lamp, by = c("name" = "name17"))
m_const_tag1 <-
  left_join(m_const_tag1, m_tag_hotel, by = c("name" = "name18"))
m_const_tag1 <-
  left_join(m_const_tag1, m_tag_industrial, by = c("name" = "name19"))
m_const_tag1 <-
  left_join(m_const_tag1, m_tag_apartment, by = c("name" = "name20"))
m_const_tag1 <-
  left_join(m_const_tag1, m_tag_house, by = c("name" = "name21"))
m_const_tag1 <-
  left_join(m_const_tag1, m_tag_church, by = c("name" = "name22"))
m_const_tag1 <-
  left_join(m_const_tag1, m_tag_mosque, by = c("name" = "name23"))

m_const_tag2 <- m_const_tag1

m_const_tag2[is.na(m_const_tag2)] <- 0

#write.csv(m_const_tag2, file = "Manchester_consts_whatismapped.csv")


dep_const_df <- m_const_tag2
dep_const_df[6, 1] <- "Blackley and Broughton"

indep_const_df <- manc_indep
indep_const_df <- indep_const_df[, -2]

manc_const_join <-
  left_join(dep_const_df, indep_const_df, by = c("name" = "geography"))

#write.csv(manc_const_join, file = "Manchester_consts_join.csv")

rescale <- function(x)
  (x - min(x)) / (max(x) - min(x)) * 100

#rescale indicators --> remember this step will be removef if it produces better results?
#manc_const_join$population <- rescale(as.numeric(manc_const_join$population))
#manc_const_join$car_or_van <- rescale(as.numeric(manc_const_join$car_or_van))
#manc_const_join$highest_qual_level4_plus <- rescale(as.numeric(manc_const_join$highest_qual_level4_plus))
#manc_const_join$christian_count <- rescale(as.numeric(manc_const_join$christian_count))
#manc_const_join$muslim_count <- rescale(as.numeric(manc_const_join$muslim_count))
#manc_const_join$female_lone_parent, <- rescale(as.numeric(manc_const_join$female_lone_parent))



indepcor_const <- manc_const_join[, 31:42]
#View(indepcor_const)
indepcor_const2 <- rcorr(as.matrix(indepcor_const))
mr_const <- as.data.frame(indepcor_const2$r)
#View(mr_const)
indepcor_const <- indepcor_const[-5, -5]
#good amount of variables left in....
#currently the ward stuff is not completed to a good standard including muslim counts etc
#in the constituency correlation matrix, a few variables were correlaed to ~0.8 but chose to left in
#lets see if this has an affect on the lm()


lm_osmuid <- lm(
  manc_const_join$users ~ manc_const_join$population +
    manc_const_join$`% pop 18-64` +
    manc_const_join$`% population U18` +
    manc_const_join$`sex_ratio f_to_m` +
    manc_const_join$`% of households owning house they live in` +
    manc_const_join$`% employment rate` +
    manc_const_join$car_or_van +
    manc_const_join$highest_qual_level4_plus +
    manc_const_join$christian_count +
    manc_const_join$muslim_count +
    manc_const_join$female_lone_parent
)

lm_totaledits <- lm(
  manc_const_join$total_edits ~ manc_const_join$population +
    manc_const_join$`% pop 18-64` +
    manc_const_join$`% population U18` +
    manc_const_join$`sex_ratio f_to_m` +
    manc_const_join$`% of households owning house they live in` +
    manc_const_join$`% employment rate` +
    manc_const_join$car_or_van +
    manc_const_join$highest_qual_level4_plus +
    manc_const_join$christian_count +
    manc_const_join$muslim_count +
    manc_const_join$female_lone_parent
)
lm_point <- lm(
  manc_const_join$point ~ manc_const_join$population +
    manc_const_join$`% pop 18-64` +
    manc_const_join$`% population U18` +
    manc_const_join$`sex_ratio f_to_m` +
    manc_const_join$`% of households owning house they live in` +
    manc_const_join$`% employment rate` +
    manc_const_join$car_or_van +
    manc_const_join$highest_qual_level4_plus +
    manc_const_join$christian_count +
    manc_const_join$muslim_count +
    manc_const_join$female_lone_parent
)

lm_line <- lm(
  manc_const_join$line ~ manc_const_join$population +
    manc_const_join$`% pop 18-64` +
    manc_const_join$`% population U18` +
    manc_const_join$`sex_ratio f_to_m` +
    manc_const_join$`% of households owning house they live in` +
    manc_const_join$`% employment rate` +
    manc_const_join$car_or_van +
    manc_const_join$highest_qual_level4_plus +
    manc_const_join$christian_count +
    manc_const_join$muslim_count +
    manc_const_join$female_lone_parent
)

lm_polygon <- lm(
  manc_const_join$polygon ~ manc_const_join$population +
    manc_const_join$`% pop 18-64` +
    manc_const_join$`% population U18` +
    manc_const_join$`sex_ratio f_to_m` +
    manc_const_join$`% of households owning house they live in` +
    manc_const_join$`% employment rate` +
    manc_const_join$car_or_van +
    manc_const_join$highest_qual_level4_plus +
    manc_const_join$christian_count +
    manc_const_join$muslim_count +
    manc_const_join$female_lone_parent
)

lm_ftdensity <- lm(
  manc_const_join$ft_density ~ manc_const_join$population +
    manc_const_join$`% pop 18-64` +
    manc_const_join$`% population U18` +
    manc_const_join$`sex_ratio f_to_m` +
    manc_const_join$`% of households owning house they live in` +
    manc_const_join$`% employment rate` +
    manc_const_join$car_or_van +
    manc_const_join$highest_qual_level4_plus +
    manc_const_join$christian_count +
    manc_const_join$muslim_count +
    manc_const_join$female_lone_parent
)

lm_school <- lm(
  manc_const_join$School ~ manc_const_join$population +
    manc_const_join$`% pop 18-64` +
    manc_const_join$`% population U18` +
    manc_const_join$`sex_ratio f_to_m` +
    manc_const_join$`% of households owning house they live in` +
    manc_const_join$`% employment rate` +
    manc_const_join$car_or_van +
    manc_const_join$highest_qual_level4_plus +
    manc_const_join$christian_count +
    manc_const_join$muslim_count +
    manc_const_join$female_lone_parent
)

lm_college <- lm(
  manc_const_join$College ~ manc_const_join$population +
    manc_const_join$`% pop 18-64` +
    manc_const_join$`% population U18` +
    manc_const_join$`sex_ratio f_to_m` +
    manc_const_join$`% of households owning house they live in` +
    manc_const_join$`% employment rate` +
    manc_const_join$car_or_van +
    manc_const_join$highest_qual_level4_plus +
    manc_const_join$christian_count +
    manc_const_join$muslim_count +
    manc_const_join$female_lone_parent
)

lm_pub <- lm(
  manc_const_join$Pub ~ manc_const_join$population +
    manc_const_join$`% pop 18-64` +
    manc_const_join$`% population U18` +
    manc_const_join$`sex_ratio f_to_m` +
    manc_const_join$`% of households owning house they live in` +
    manc_const_join$`% employment rate` +
    manc_const_join$car_or_van +
    manc_const_join$highest_qual_level4_plus +
    manc_const_join$christian_count +
    manc_const_join$muslim_count +
    manc_const_join$female_lone_parent
)

lm_bar <- lm(
  manc_const_join$Bar ~ manc_const_join$population +
    manc_const_join$`% pop 18-64` +
    manc_const_join$`% population U18` +
    manc_const_join$`sex_ratio f_to_m` +
    manc_const_join$`% of households owning house they live in` +
    manc_const_join$`% employment rate` +
    manc_const_join$car_or_van +
    manc_const_join$highest_qual_level4_plus +
    manc_const_join$christian_count +
    manc_const_join$muslim_count +
    manc_const_join$female_lone_parent
)

lm_pharmacy <- lm(
  manc_const_join$Pharmacy ~ manc_const_join$population +
    manc_const_join$`% pop 18-64` +
    manc_const_join$`% population U18` +
    manc_const_join$`sex_ratio f_to_m` +
    manc_const_join$`% of households owning house they live in` +
    manc_const_join$`% employment rate` +
    manc_const_join$car_or_van +
    manc_const_join$highest_qual_level4_plus +
    manc_const_join$christian_count +
    manc_const_join$muslim_count +
    manc_const_join$female_lone_parent
)

lm_hospital <- lm(
  manc_const_join$Hospital ~ manc_const_join$population +
    manc_const_join$`% pop 18-64` +
    manc_const_join$`% population U18` +
    manc_const_join$`sex_ratio f_to_m` +
    manc_const_join$`% of households owning house they live in` +
    manc_const_join$`% employment rate` +
    manc_const_join$car_or_van +
    manc_const_join$highest_qual_level4_plus +
    manc_const_join$christian_count +
    manc_const_join$muslim_count +
    manc_const_join$female_lone_parent
)

lm_dentist <- lm(
  manc_const_join$Dentist ~ manc_const_join$population +
    manc_const_join$`% pop 18-64` +
    manc_const_join$`% population U18` +
    manc_const_join$`sex_ratio f_to_m` +
    manc_const_join$`% of households owning house they live in` +
    manc_const_join$`% employment rate` +
    manc_const_join$car_or_van +
    manc_const_join$highest_qual_level4_plus +
    manc_const_join$christian_count +
    manc_const_join$muslim_count +
    manc_const_join$female_lone_parent
)

lm_clinic <- lm(
  manc_const_join$Clinic ~ manc_const_join$population +
    manc_const_join$`% pop 18-64` +
    manc_const_join$`% population U18` +
    manc_const_join$`sex_ratio f_to_m` +
    manc_const_join$`% of households owning house they live in` +
    manc_const_join$`% employment rate` +
    manc_const_join$car_or_van +
    manc_const_join$highest_qual_level4_plus +
    manc_const_join$christian_count +
    manc_const_join$muslim_count +
    manc_const_join$female_lone_parent
)

lm_police <- lm(
  manc_const_join$Police ~ manc_const_join$population +
    manc_const_join$`% pop 18-64` +
    manc_const_join$`% population U18` +
    manc_const_join$`sex_ratio f_to_m` +
    manc_const_join$`% of households owning house they live in` +
    manc_const_join$`% employment rate` +
    manc_const_join$car_or_van +
    manc_const_join$highest_qual_level4_plus +
    manc_const_join$christian_count +
    manc_const_join$muslim_count +
    manc_const_join$female_lone_parent
)

lm_bank <- lm(
  manc_const_join$Bank ~ manc_const_join$population +
    manc_const_join$`% pop 18-64` +
    manc_const_join$`% population U18` +
    manc_const_join$`sex_ratio f_to_m` +
    manc_const_join$`% of households owning house they live in` +
    manc_const_join$`% employment rate` +
    manc_const_join$car_or_van +
    manc_const_join$highest_qual_level4_plus +
    manc_const_join$christian_count +
    manc_const_join$muslim_count +
    manc_const_join$female_lone_parent
)

lm_atm <- lm(
  manc_const_join$ATM ~ manc_const_join$population +
    manc_const_join$`% pop 18-64` +
    manc_const_join$`% population U18` +
    manc_const_join$`sex_ratio f_to_m` +
    manc_const_join$`% of households owning house they live in` +
    manc_const_join$`% employment rate` +
    manc_const_join$car_or_van +
    manc_const_join$highest_qual_level4_plus +
    manc_const_join$christian_count +
    manc_const_join$muslim_count +
    manc_const_join$female_lone_parent
)

lm_restaurant <- lm(
  manc_const_join$Restaurant ~ manc_const_join$population +
    manc_const_join$`% pop 18-64` +
    manc_const_join$`% population U18` +
    manc_const_join$`sex_ratio f_to_m` +
    manc_const_join$`% of households owning house they live in` +
    manc_const_join$`% employment rate` +
    manc_const_join$car_or_van +
    manc_const_join$highest_qual_level4_plus +
    manc_const_join$christian_count +
    manc_const_join$muslim_count +
    manc_const_join$female_lone_parent
)

lm_fastfood <- lm(
  manc_const_join$`Fast Food` ~ manc_const_join$population +
    manc_const_join$`% pop 18-64` +
    manc_const_join$`% population U18` +
    manc_const_join$`sex_ratio f_to_m` +
    manc_const_join$`% of households owning house they live in` +
    manc_const_join$`% employment rate` +
    manc_const_join$car_or_van +
    manc_const_join$highest_qual_level4_plus +
    manc_const_join$christian_count +
    manc_const_join$muslim_count +
    manc_const_join$female_lone_parent
)

lm_toilets <- lm(
  manc_const_join$Toilets ~ manc_const_join$population +
    manc_const_join$`% pop 18-64` +
    manc_const_join$`% population U18` +
    manc_const_join$`sex_ratio f_to_m` +
    manc_const_join$`% of households owning house they live in` +
    manc_const_join$`% employment rate` +
    manc_const_join$car_or_van +
    manc_const_join$highest_qual_level4_plus +
    manc_const_join$christian_count +
    manc_const_join$muslim_count +
    manc_const_join$female_lone_parent
)


lm_placeofworship <- lm(
  manc_const_join$`Place of Worship` ~ manc_const_join$population +
    manc_const_join$`% pop 18-64` +
    manc_const_join$`% population U18` +
    manc_const_join$`sex_ratio f_to_m` +
    manc_const_join$`% of households owning house they live in` +
    manc_const_join$`% employment rate` +
    manc_const_join$car_or_van +
    manc_const_join$highest_qual_level4_plus +
    manc_const_join$christian_count +
    manc_const_join$muslim_count +
    manc_const_join$female_lone_parent
)

lm_busstop <- lm(
  manc_const_join$Bus_Stop ~ manc_const_join$population +
    manc_const_join$`% pop 18-64` +
    manc_const_join$`% population U18` +
    manc_const_join$`sex_ratio f_to_m` +
    manc_const_join$`% of households owning house they live in` +
    manc_const_join$`% employment rate` +
    manc_const_join$car_or_van +
    manc_const_join$highest_qual_level4_plus +
    manc_const_join$christian_count +
    manc_const_join$muslim_count +
    manc_const_join$female_lone_parent
)

lm_streetlamp <- lm(
  manc_const_join$`Street Lamp` ~ manc_const_join$population +
    manc_const_join$`% pop 18-64` +
    manc_const_join$`% population U18` +
    manc_const_join$`sex_ratio f_to_m` +
    manc_const_join$`% of households owning house they live in` +
    manc_const_join$`% employment rate` +
    manc_const_join$car_or_van +
    manc_const_join$highest_qual_level4_plus +
    manc_const_join$christian_count +
    manc_const_join$muslim_count +
    manc_const_join$female_lone_parent
)

lm_hotel <- lm(
  manc_const_join$Hotel ~ manc_const_join$population +
    manc_const_join$`% pop 18-64` +
    manc_const_join$`% population U18` +
    manc_const_join$`sex_ratio f_to_m` +
    manc_const_join$`% of households owning house they live in` +
    manc_const_join$`% employment rate` +
    manc_const_join$car_or_van +
    manc_const_join$highest_qual_level4_plus +
    manc_const_join$christian_count +
    manc_const_join$muslim_count +
    manc_const_join$female_lone_parent
)

lm_industrial <- lm(
  manc_const_join$Industrial ~ manc_const_join$population +
    manc_const_join$`% pop 18-64` +
    manc_const_join$`% population U18` +
    manc_const_join$`sex_ratio f_to_m` +
    manc_const_join$`% of households owning house they live in` +
    manc_const_join$`% employment rate` +
    manc_const_join$car_or_van +
    manc_const_join$highest_qual_level4_plus +
    manc_const_join$christian_count +
    manc_const_join$muslim_count +
    manc_const_join$female_lone_parent
)

lm_apartments <- lm(
  manc_const_join$Apartments ~ manc_const_join$population +
    manc_const_join$`% pop 18-64` +
    manc_const_join$`% population U18` +
    manc_const_join$`sex_ratio f_to_m` +
    manc_const_join$`% of households owning house they live in` +
    manc_const_join$`% employment rate` +
    manc_const_join$car_or_van +
    manc_const_join$highest_qual_level4_plus +
    manc_const_join$christian_count +
    manc_const_join$muslim_count +
    manc_const_join$female_lone_parent
)

lm_house <- lm(
  manc_const_join$House ~ manc_const_join$population +
    manc_const_join$`% pop 18-64` +
    manc_const_join$`% population U18` +
    manc_const_join$`sex_ratio f_to_m` +
    manc_const_join$`% of households owning house they live in` +
    manc_const_join$`% employment rate` +
    manc_const_join$car_or_van +
    manc_const_join$highest_qual_level4_plus +
    manc_const_join$christian_count +
    manc_const_join$muslim_count +
    manc_const_join$female_lone_parent
)

lm_church <- lm(
  manc_const_join$Church ~ manc_const_join$population +
    manc_const_join$`% pop 18-64` +
    manc_const_join$`% population U18` +
    manc_const_join$`sex_ratio f_to_m` +
    manc_const_join$`% of households owning house they live in` +
    manc_const_join$`% employment rate` +
    manc_const_join$car_or_van +
    manc_const_join$highest_qual_level4_plus +
    manc_const_join$christian_count +
    manc_const_join$muslim_count +
    manc_const_join$female_lone_parent
)

lm_mosque <- lm(
  manc_const_join$Mosque ~ manc_const_join$population +
    manc_const_join$`% pop 18-64` +
    manc_const_join$`% population U18` +
    manc_const_join$`sex_ratio f_to_m` +
    manc_const_join$`% of households owning house they live in` +
    manc_const_join$`% employment rate` +
    manc_const_join$car_or_van +
    manc_const_join$highest_qual_level4_plus +
    manc_const_join$christian_count +
    manc_const_join$muslim_count +
    manc_const_join$female_lone_parent
)



summary(lm_osmuid)
summary(lm_totaledits)
summary(lm_point)
summary(lm_line)
summary(lm_polygon)
summary(lm_ftdensity)
summary(lm_school)
summary(lm_college)
summary(lm_pub)
summary(lm_bar)
summary(lm_pharmacy)
summary(lm_hospital)
summary(lm_dentist)
summary(lm_clinic)
summary(lm_police)
summary(lm_bank)
summary(lm_atm)
summary(lm_restaurant)
summary(lm_fastfood)
summary(lm_toilets)
#summary(lm_drinkingwater)
summary(lm_placeofworship)
summary(lm_busstop)
summary(lm_streetlamp)
summary(lm_hotel)
summary(lm_industrial)
summary(lm_apartments)
summary(lm_house)
summary(lm_church)
summary(lm_mosque)
summary(lm_totaledits)
summary(lm_point)
summary(lm_line)
summary(lm_polygon)
summary(lm_school)
summary(lm_college)
summary(lm_pub)
summary(lm_bar)
summary(lm_pharmacy)
summary(lm_hospital)
summary(lm_dentist)
summary(lm_clinic)
summary(lm_police)
summary(lm_bank)
summary(lm_atm)
summary(lm_restaurant)
summary(lm_fastfood)
summary(lm_toilets)
summary(lm_placeofworship)
summary(lm_busstop)
summary(lm_streetlamp)
summary(lm_hotel)
summary(lm_industrial)
summary(lm_apartments)
summary(lm_house)
summary(lm_church)
summary(lm_mosque)



#SPATIAL AUTOCORRELATION

#TESTS WILL BE CARRIED OUT WITH RESIDUALS
#WITH INDEPENDENT --> WITH AND WITHOUT SPATIAL AUTOCORRELATION



manc_const_shp1 <-
  readOGR(dsn = ".", layer = "Greater_Manchester_Parlimentary_Const1")
plot(manc_const_shp1)

m_drops_const <-
  c(
    "AREA_CODE",
    "DESCRIPTIO",
    "FILE_NAME",
    "NUMBER",
    "NUMBER0",
    "POLYGON_ID",
    "UNIT_ID",
    "HECTARES",
    "AREA",
    "TYPE_CODE",
    "DESCRIPT0",
    "TYPE_COD0",
    "DESCRIPT1"
  )
manc_const_shp1 <-
  manc_const_shp1[, !(names(manc_const_shp1) %in% m_drops_const)]
#manc_const_shp1@data


colnames(manc_const_join)[1] <- "NAME"
m_const_jointrial <- merge(manc_const_shp1, manc_const_join)


m_const_neighbours <- poly2nb(m_const_jointrial)
plot(m_const_jointrial)
plot(
  m_const_neighbours,
  coordinates(m_const_jointrial),
  add = TRUE,
  col = 'red'
)

m_const_listw <- nb2listw(m_const_neighbours)

#global moran - independent variables
#lots of tests close to zero...
moran.test(manc_const_join$population, m_const_listw)
moran.test(manc_const_join$`% pop 18-64`, m_const_listw)
moran.test(manc_const_join$`% population U18`, m_const_listw)
moran.test(manc_const_join$`sex_ratio f_to_m`, m_const_listw)
moran.test(manc_const_join$`% of households owning house they live in`,
           m_const_listw)
moran.test(manc_const_join$`% employment rate`, m_const_listw)
moran.test(manc_const_join$car_or_van, m_const_listw)
moran.test(manc_const_join$highest_qual_level4_plus, m_const_listw)
moran.test(manc_const_join$christian_count, m_const_listw)
moran.test(manc_const_join$muslim_count, m_const_listw)
moran.test(manc_const_join$female_lone_parent, m_const_listw)

#global moran - lm() residuals
#probably weaker than before...
moran.test(lm_totaledits$residuals, m_const_listw)
moran.test(lm_point$residuals, m_const_listw)
moran.test(lm_line$residuals, m_const_listw)
moran.test(lm_polygon$residuals, m_const_listw)
#moran.test(lm_ft_density$residuals, m_const_listw)
moran.test(lm_school$residuals, m_const_listw)
moran.test(lm_college$residuals, m_const_listw)
moran.test(lm_pub$residuals, m_const_listw)
moran.test(lm_bar$residuals, m_const_listw)
moran.test(lm_pharmacy$residuals, m_const_listw)
moran.test(lm_hospital$residuals, m_const_listw)
moran.test(lm_dentist$residuals, m_const_listw)
moran.test(lm_clinic$residuals, m_const_listw)
moran.test(lm_police$residuals, m_const_listw)
moran.test(lm_bank$residuals, m_const_listw)
moran.test(lm_atm$residuals, m_const_listw)
moran.test(lm_restaurant$residuals, m_const_listw)
moran.test(lm_fastfood$residuals, m_const_listw)
moran.test(lm_toilets$residuals, m_const_listw)
#moran.test(lm_drinkingwater$residuals, m_const_listw)
moran.test(lm_placeofworship$residuals, m_const_listw)
moran.test(lm_busstop$residuals, m_const_listw)
moran.test(lm_streetlamp$residuals, m_const_listw)
moran.test(lm_hotel$residuals, m_const_listw)
moran.test(lm_industrial$residuals, m_const_listw)
moran.test(lm_apartments$residuals, m_const_listw)
moran.test(lm_house$residuals, m_const_listw)
moran.test(lm_church$residuals, m_const_listw)
moran.test(lm_mosque$residuals, m_const_listw)



#=================================================
#TRIALING RUNNING THIS CODE WITHOUT THE RESCALING ABOVE!!

#global moran - independent variables
#lots of tests close to zero...
moran.test(manc_const_join$population, m_const_listw)
moran.test(manc_const_join$`% pop 18-64`, m_const_listw)
moran.test(manc_const_join$`% population U18`, m_const_listw)
moran.test(manc_const_join$`sex_ratio f_to_m`, m_const_listw)
moran.test(manc_const_join$`% of households owning house they live in`,
           m_const_listw)
moran.test(manc_const_join$`% employment rate`, m_const_listw)
moran.test(manc_const_join$car_or_van, m_const_listw)
moran.test(manc_const_join$highest_qual_level4_plus, m_const_listw)
moran.test(manc_const_join$christian_count, m_const_listw)
moran.test(manc_const_join$muslim_count, m_const_listw)
moran.test(manc_const_join$female_lone_parent, m_const_listw)

#global moran - lm() residuals
#probably weaker than before...
moran.test(lm_totaledits$residuals, m_const_listw)
moran.test(lm_point$residuals, m_const_listw)
moran.test(lm_line$residuals, m_const_listw)
moran.test(lm_polygon$residuals, m_const_listw)
#moran.test(lm_ft_density$residuals, m_const_listw)
moran.test(lm_school$residuals, m_const_listw)
moran.test(lm_college$residuals, m_const_listw)
moran.test(lm_pub$residuals, m_const_listw)
moran.test(lm_bar$residuals, m_const_listw)
moran.test(lm_pharmacy$residuals, m_const_listw)
moran.test(lm_hospital$residuals, m_const_listw)
moran.test(lm_dentist$residuals, m_const_listw)
moran.test(lm_clinic$residuals, m_const_listw)
moran.test(lm_police$residuals, m_const_listw)
moran.test(lm_bank$residuals, m_const_listw)
moran.test(lm_atm$residuals, m_const_listw)
moran.test(lm_restaurant$residuals, m_const_listw)
moran.test(lm_fastfood$residuals, m_const_listw)
moran.test(lm_toilets$residuals, m_const_listw)
#moran.test(lm_drinkingwater$residuals, m_const_listw)
moran.test(lm_placeofworship$residuals, m_const_listw)
moran.test(lm_busstop$residuals, m_const_listw)
moran.test(lm_streetlamp$residuals, m_const_listw)
moran.test(lm_hotel$residuals, m_const_listw)
moran.test(lm_industrial$residuals, m_const_listw)
moran.test(lm_apartments$residuals, m_const_listw)
moran.test(lm_house$residuals, m_const_listw)
moran.test(lm_church$residuals, m_const_listw)
moran.test(lm_mosque$residuals, m_const_listw)


#dependent variables
moran.test(manc_const_join$users, m_const_listw)
moran.test(manc_const_join$total_edits, m_const_listw)
moran.test(manc_const_join$point, m_const_listw)
moran.test(manc_const_join$line, m_const_listw)
moran.test(manc_const_join$polygon, m_const_listw)
moran.test(manc_const_join$ft_density, m_const_listw)
moran.test(manc_const_join$School, m_const_listw)
moran.test(manc_const_join$College, m_const_listw)
moran.test(manc_const_join$Pub, m_const_listw)
moran.test(manc_const_join$Bar, m_const_listw)
moran.test(manc_const_join$Pharmacy, m_const_listw)
moran.test(manc_const_join$Hospital, m_const_listw)
moran.test(manc_const_join$Dentist, m_const_listw)
moran.test(manc_const_join$Clinic, m_const_listw)
moran.test(manc_const_join$Police, m_const_listw)
moran.test(manc_const_join$Bank, m_const_listw)
moran.test(manc_const_join$ATM, m_const_listw)
moran.test(manc_const_join$Restaurant, m_const_listw)
moran.test(manc_const_join$`Fast Food`, m_const_listw)
moran.test(manc_const_join$Toilets, m_const_listw)
moran.test(manc_const_join$`Place of Worship`, m_const_listw)
moran.test(manc_const_join$Bus_Stop, m_const_listw)
moran.test(manc_const_join$`Street Lamp`, m_const_listw)
moran.test(manc_const_join$Hotel, m_const_listw)
moran.test(manc_const_join$Industrial, m_const_listw)
moran.test(manc_const_join$Apartments)
moran.test(manc_const_join$House, m_const_listw)
moran.test(manc_const_join$Church, m_const_listw)
moran.test(manc_const_join$Mosque, m_const_listw)


#no spatial autocorrelation between dependent, independent (scaled or unscaled) or lm(residualS)
#http://rstatistics.net/how-to-test-a-regression-model-for-heteroscedasticity-and-if-present-how-to-correct-it/
library(lmtest)


#p value > 0.05 = HETEROSKETASTIC
bptest(lm_osmuid)
bptest(lm_totaledits)
bptest(lm_point)
bptest(lm_line)
bptest(lm_polygon)
bptest(lm_ftdensity)
bptest(lm_school)
bptest(lm_college)
bptest(lm_pub)
bptest(lm_bar)
bptest(lm_pharmacy)
bptest(lm_hospital)
bptest(lm_dentist)
bptest(lm_clinic)
bptest(lm_police)
bptest(lm_bank)
bptest(lm_atm)
bptest(lm_restaurant)
bptest(lm_fastfood)
bptest(lm_toilets)
#bptest(lm_drinkingwater)
bptest(lm_placeofworship)
bptest(lm_busstop)
bptest(lm_streetlamp)
bptest(lm_hotel)
bptest(lm_industrial)
bptest(lm_apartments)
bptest(lm_house)
bptest(lm_church)
bptest(lm_mosque) #####HETEROSKEDASITY



#GEOGRAPHICALLY WEIGHTED REGRESSION

library("rgeos")
library("tmap")

#produce plots of linear regression - NOT GWR - move up later
par(mfrow = c(2, 2))
plot(lm_osmuid)

#backup

manc_const_join2 <- manc_const_join
m_const_jointrial2 <- m_const_jointrial
#map the residuals
resids <- residuals(lm_osmuid)
map.resids <-
  cbind(m_const_jointrial2,  resids) #bind residuals to shapefile
names(map.resids)[44] <- "resids" #rename the column
#colnames(map.resids@data)
#plot the residulas for n_lm_osmuid
qtm(map.resids, fill = "resids")



#calculate kernal bandwidth
library("spgwr")

gwrbandwidth <- gwr.sel(
  m_const_jointrial2$users ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)

gwrbandwidth.lm_osmuid <- gwr.sel(
  m_const_jointrial2$users ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)

gwrbandwidth.lm_totaledits <- gwr.sel(
  m_const_jointrial2$total_edits ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)

gwrbandwidth.lm_point <- gwr.sel(
  m_const_jointrial2$point ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)

gwrbandwidth.lm_line <- gwr.sel(
  m_const_jointrial2$line ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)

gwrbandwidth.lm_polygon <- gwr.sel(
  m_const_jointrial2$polygon ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)

gwrbandwidth.lm_ftdensity <- gwr.sel(
  m_const_jointrial2$ft_density ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)

gwrbandwidth.lm_school <- gwr.sel(
  m_const_jointrial2$School ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)

gwrbandwidth.lm_college <- gwr.sel(
  m_const_jointrial2$College ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)

gwrbandwidth.lm_pub <- gwr.sel(
  m_const_jointrial2$Pub ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)

gwrbandwidth.lm_bar <- gwr.sel(
  m_const_jointrial2$Bar ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)

gwrbandwidth.lm_pharmacy <- gwr.sel(
  m_const_jointrial2$Pharmacy ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)

gwrbandwidth.lm_hospital <- gwr.sel(
  m_const_jointrial2$Hospital ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)

gwrbandwidth.lm_dentist <- gwr.sel(
  m_const_jointrial2$Dentist ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)

gwrbandwidth.lm_clinic <- gwr.sel(
  m_const_jointrial2$Clinic ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)

gwrbandwidth.lm_police <- gwr.sel(
  m_const_jointrial2$Police ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)

gwrbandwidth.lm_bank <- gwr.sel(
  m_const_jointrial2$Bank ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)

gwrbandwidth.lm_atm <- gwr.sel(
  m_const_jointrial2$ATM ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)

gwrbandwidth.lm_restaurant <- gwr.sel(
  m_const_jointrial2$Restaurant ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)

gwrbandwidth.lm_fastfood <- gwr.sel(
  m_const_jointrial2$`Fast Food` ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)

gwrbandwidth.lm_toilets <- gwr.sel(
  m_const_jointrial2$Toilets ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)


gwrbandwidth.lm_placeofworship <- gwr.sel(
  m_const_jointrial2$`Place of Worship` ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)

gwrbandwidth.lm_busstop <- gwr.sel(
  m_const_jointrial2$Bus_Stop ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)

gwrbandwidth.lm_streetlamp <- gwr.sel(
  m_const_jointrial2$`Street Lamp` ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)

gwrbandwidth.lm_hotel <- gwr.sel(
  m_const_jointrial2$Hotel ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)

gwrbandwidth.lm_industrial <- gwr.sel(
  m_const_jointrial2$Industrial ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)

gwrbandwidth.lm_apartments <- gwr.sel(
  m_const_jointrial2$Apartments ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)

gwrbandwidth.lm_house <- gwr.sel(
  m_const_jointrial2$House ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)

gwrbandwidth.lm_church <- gwr.sel(
  m_const_jointrial2$Church ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)

gwrbandwidth.lm_mosque <- gwr.sel(
  m_const_jointrial2$Mosque ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = T
)






gwr.model <- gwr(
  m_const_jointrial2$users ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth,
  hatmatrix = TRUE,
  se.fit = TRUE
)


####################################################


gwrmodel.lm_osmuid <- gwr(
  m_const_jointrial2$users ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth.lm_osmuid,
  hatmatrix = TRUE,
  se.fit = TRUE
)

gwrmodel.lm_totaledits <- gwr(
  m_const_jointrial2$total_edits ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth.lm_totaledits,
  hatmatrix = TRUE,
  se.fit = TRUE
)

gwrmodel.lm_point <- gwr(
  m_const_jointrial2$point ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth.lm_point,
  hatmatrix = TRUE,
  se.fit = TRUE
)

gwrmodel.lm_line <- gwr(
  m_const_jointrial2$line ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth.lm_line,
  hatmatrix = TRUE,
  se.fit = TRUE
)

gwrmodel.lm_polygon <- gwr(
  m_const_jointrial2$polygon ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth.lm_polygon,
  hatmatrix = TRUE,
  se.fit = TRUE
)

gwrmodel.lm_ftdensity <- gwr(
  m_const_jointrial2$ft_density ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth.lm_ftdensity,
  hatmatrix = TRUE,
  se.fit = TRUE
)

gwrmodel.lm_school <- gwr(
  m_const_jointrial2$School ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth.lm_school,
  hatmatrix = TRUE,
  se.fit = TRUE
)

gwrmodel.lm_college <- gwr(
  m_const_jointrial2$College ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth.lm_college,
  hatmatrix = TRUE,
  se.fit = TRUE
)

gwrmodel.lm_pub <- gwr(
  m_const_jointrial2$Pub ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth.lm_pub,
  hatmatrix = TRUE,
  se.fit = TRUE
)

gwrmodel.lm_bar <- gwr(
  m_const_jointrial2$Bar ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth.lm_bar,
  hatmatrix = TRUE,
  se.fit = TRUE
)

gwrmodel.lm_pharmacy <- gwr(
  m_const_jointrial2$Pharmacy ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth.lm_pharmacy,
  hatmatrix = TRUE,
  se.fit = TRUE
)

gwrmodel.lm_hospital <- gwr(
  m_const_jointrial2$Hospital ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth.lm_hospital,
  hatmatrix = TRUE,
  se.fit = TRUE
)

gwrmodel.lm_dentist <- gwr(
  m_const_jointrial2$Dentist ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth.lm_dentist,
  hatmatrix = TRUE,
  se.fit = TRUE
)

gwrmodel.lm_clinic <- gwr(
  m_const_jointrial2$Clinic ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth.lm_clinic,
  hatmatrix = TRUE,
  se.fit = TRUE
)

gwrmodel.lm_police <- gwr(
  m_const_jointrial2$Police ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth.lm_police,
  hatmatrix = TRUE,
  se.fit = TRUE
)

gwrmodel.lm_bank <- gwr(
  m_const_jointrial2$Bank ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth.lm_bank,
  hatmatrix = TRUE,
  se.fit = TRUE
)

gwrmodel.lm_atm <- gwr(
  m_const_jointrial2$ATM ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth.lm_atm,
  hatmatrix = TRUE,
  se.fit = TRUE
)

gwrmodel.lm_restaurant <- gwr(
  m_const_jointrial2$Restaurant ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth.lm_restaurant,
  hatmatrix = TRUE,
  se.fit = TRUE
)

gwrmodel.lm_fastfood <- gwr(
  m_const_jointrial2$`Fast Food` ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth.lm_fastfood,
  hatmatrix = TRUE,
  se.fit = TRUE
)

gwrmodel.lm_toilets <- gwr(
  m_const_jointrial2$Toilets ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth.lm_toilets,
  hatmatrix = TRUE,
  se.fit = TRUE
)


gwrmodel.lm_placeofworship <- gwr(
  m_const_jointrial2$`Place of Worship` ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth.lm_placeofworship,
  hatmatrix = TRUE,
  se.fit = TRUE
)

gwrmodel.lm_busstop <- gwr(
  m_const_jointrial2$Bus_Stop ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth.lm_busstop,
  hatmatrix = TRUE,
  se.fit = TRUE
)

gwrmodel.lm_streetlamp <- gwr(
  m_const_jointrial2$`Street Lamp` ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth.lm_streetlamp,
  hatmatrix = TRUE,
  se.fit = TRUE
)

gwrmodel.lm_hotel <- gwr(
  m_const_jointrial2$Hotel ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth.lm_hotel,
  hatmatrix = TRUE,
  se.fit = TRUE
)

gwrmodel.lm_industrial <- gwr(
  m_const_jointrial2$Industrial ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth.lm_industrial,
  hatmatrix = TRUE,
  se.fit = TRUE
)

gwrmodel.lm_apartments <- gwr(
  m_const_jointrial2$Apartments ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth.lm_apartments,
  hatmatrix = TRUE,
  se.fit = TRUE
)

gwrmodel.lm_house <- gwr(
  m_const_jointrial2$House ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth.lm_house,
  hatmatrix = TRUE,
  se.fit = TRUE
)

gwrmodel.lm_church <- gwr(
  m_const_jointrial2$Church ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth.lm_church,
  hatmatrix = TRUE,
  se.fit = TRUE
)

gwrmodel.lm_mosque <- gwr(
  m_const_jointrial2$Mosque ~ m_const_jointrial2$population +
    m_const_jointrial2$`% pop 18-64` +
    m_const_jointrial2$`% population U18` +
    m_const_jointrial2$`sex_ratio f_to_m` +
    m_const_jointrial2$`% of households owning house they live in` +
    m_const_jointrial2$`% employment rate` +
    m_const_jointrial2$car_or_van +
    m_const_jointrial2$highest_qual_level4_plus +
    m_const_jointrial2$christian_count +
    m_const_jointrial2$muslim_count +
    m_const_jointrial2$female_lone_parent,
  data = m_const_jointrial2,
  adapt = gwrbandwidth.lm_mosque,
  hatmatrix = TRUE,
  se.fit = TRUE
)


#print the results
gwrmodel.lm_osmuid
gwrmodel.lm_totaledits
gwrmodel.lm_point
gwrmodel.lm_line
gwrmodel.lm_polygon
gwrmodel.lm_ftdensity
gwrmodel.lm_school
gwrmodel.lm_college
gwrmodel.lm_pub
gwrmodel.lm_bar
gwrmodel.lm_pharmacy
gwrmodel.lm_hospital
gwrmodel.lm_dentist
gwrmodel.lm_clinic
gwrmodel.lm_police
gwrmodel.lm_bank
gwrmodel.lm_atm
gwrmodel.lm_restaurant
gwrmodel.lm_fastfood
gwrmodel.lm_placeofworship
gwrmodel.lm_busstop
gwrmodel.lm_streetlamp
gwrmodel.lm_hotel
gwrmodel.lm_industrial
gwrmodel.lm_apartments
gwrmodel.lm_house
gwrmodel.lm_church
gwrmodel.lm_mosque




results.gwrmodel.lm_osmuid <- as.data.frame(gwrmodel.lm_osmuid$SDF)
results.gwrmodel.lm_totaledits <-
  as.data.frame(gwrmodel.lm_totaledits$SDF)
results.gwrmodel.lm_point <- as.data.frame(gwrmodel.lm_point$SDF)
results.gwrmodel.lm_line <- as.data.frame(gwrmodel.lm_line$SDF)
results.gwrmodel.lm_polygon <-
  as.data.frame(gwrmodel.lm_polygon$SDF)
results.gwrmodel.lm_ftdensity <-
  as.data.frame(gwrmodel.lm_ftdensity$SDF)
results.gwrmodel.lm_school <- as.data.frame(gwrmodel.lm_school$SDF)
results.gwrmodel.lm_college <-
  as.data.frame(gwrmodel.lm_college$SDF)
results.gwrmodel.lm_pub <- as.data.frame(gwrmodel.lm_pub$SDF)
results.gwrmodel.lm_bar <- as.data.frame(gwrmodel.lm_bar$SDF)
results.gwrmodel.lm_pharmacy <-
  as.data.frame(gwrmodel.lm_pharmacy$SDF)
results.gwrmodel.lm_hospital <-
  as.data.frame(gwrmodel.lm_hospital$SDF)
results.gwrmodel.lm_dentist <-
  as.data.frame(gwrmodel.lm_dentist$SDF)
results.gwrmodel.lm_clinic <- as.data.frame(gwrmodel.lm_clinic$SDF)
results.gwrmodel.lm_police <- as.data.frame(gwrmodel.lm_police$SDF)
results.gwrmodel.lm_bank <- as.data.frame(gwrmodel.lm_bank$SDF)
results.gwrmodel.lm_atm <- as.data.frame(gwrmodel.lm_atm$SDF)
results.gwrmodel.lm_restaurant <-
  as.data.frame(gwrmodel.lm_restaurant$SDF)
results.gwrmodel.lm_fastfood <-
  as.data.frame(gwrmodel.lm_fastfood$SDF)
results.gwrmodel.lm_placeofworship <-
  as.data.frame(gwrmodel.lm_placeofworship$SDF)
results.gwrmodel.lm_busstop <-
  as.data.frame(gwrmodel.lm_busstop$SDF)
results.gwrmodel.lm_streetlamp <-
  as.data.frame(gwrmodel.lm_streetlamp$SDF)
results.gwrmodel.lm_hotel <- as.data.frame(gwrmodel.lm_hotel$SDF)
results.gwrmodel.lm_industrial <-
  as.data.frame(gwrmodel.lm_industrial$SDF)
results.gwrmodel.lm_apartments <-
  as.data.frame(gwrmodel.lm_apartments$SDF)
results.gwrmodel.lm_house <- as.data.frame(gwrmodel.lm_house$SDF)
results.gwrmodel.lm_church <- as.data.frame(gwrmodel.lm_church$SDF)
results.gwrmodel.lm_mosque <- as.data.frame(gwrmodel.lm_mosque$SDF)


gwr.map.lm_osmuid <-
  cbind(m_const_jointrial2, as.matrix(results.gwrmodel.lm_osmuid))
gwr.map.lm_totaledits <-
  cbind(m_const_jointrial2,
        as.matrix(results.gwrmodel.lm_totaledits))
gwr.map.lm_point <-
  cbind(m_const_jointrial2, as.matrix(results.gwrmodel.lm_point))
gwr.map.lm_line <-
  cbind(m_const_jointrial2, as.matrix(results.gwrmodel.lm_line))
gwr.map.lm_polygon <-
  cbind(m_const_jointrial2, as.matrix(results.gwrmodel.lm_polygon))
gwr.map.lm_ftdensity <-
  cbind(m_const_jointrial2,
        as.matrix(results.gwrmodel.lm_ftdensity))
gwr.map.lm_school <-
  cbind(m_const_jointrial2, as.matrix(results.gwrmodel.lm_school))
gwr.map.lm_college <-
  cbind(m_const_jointrial2, as.matrix(results.gwrmodel.lm_college))
gwr.map.lm_pub <-
  cbind(m_const_jointrial2, as.matrix(results.gwrmodel.lm_pub))
gwr.map.lm_bar <-
  cbind(m_const_jointrial2, as.matrix(results.gwrmodel.lm_bar))
gwr.map.lm_pharmacy <-
  cbind(m_const_jointrial2, as.matrix(results.gwrmodel.lm_pharmacy))
gwr.map.lm_hospital <-
  cbind(m_const_jointrial2, as.matrix(results.gwrmodel.lm_hospital))
gwr.map.lm_dentist <-
  cbind(m_const_jointrial2, as.matrix(results.gwrmodel.lm_dentist))
gwr.map.lm_clinic <-
  cbind(m_const_jointrial2, as.matrix(results.gwrmodel.lm_clinic))
gwr.map.lm_police <-
  cbind(m_const_jointrial2, as.matrix(results.gwrmodel.lm_police))
gwr.map.lm_bank <-
  cbind(m_const_jointrial2, as.matrix(results.gwrmodel.lm_bank))
gwr.map.lm_atm <-
  cbind(m_const_jointrial2, as.matrix(results.gwrmodel.lm_atm))
gwr.map.lm_restaurant <-
  cbind(m_const_jointrial2,
        as.matrix(results.gwrmodel.lm_restaurant))
gwr.map.lm_fastfood <-
  cbind(m_const_jointrial2, as.matrix(results.gwrmodel.lm_fastfood))
gwr.map.lm_placeofworship <-
  cbind(m_const_jointrial2,
        as.matrix(results.gwrmodel.lm_placeofworship))
gwr.map.lm_busstop <-
  cbind(m_const_jointrial2, as.matrix(results.gwrmodel.lm_busstop))
gwr.map.lm_streetlamp <-
  cbind(m_const_jointrial2,
        as.matrix(results.gwrmodel.lm_streetlamp))
gwr.map.lm_hotel <-
  cbind(m_const_jointrial2, as.matrix(results.gwrmodel.lm_hotel))
gwr.map.lm_industrial <-
  cbind(m_const_jointrial2,
        as.matrix(results.gwrmodel.lm_industrial))
gwr.map.lm_apartments <-
  cbind(m_const_jointrial2,
        as.matrix(results.gwrmodel.lm_apartments))
gwr.map.lm_house <-
  cbind(m_const_jointrial2, as.matrix(results.gwrmodel.lm_house))
gwr.map.lm_church <-
  cbind(m_const_jointrial2, as.matrix(results.gwrmodel.lm_church))
gwr.map.lm_mosque <-
  cbind(m_const_jointrial2, as.matrix(results.gwrmodel.lm_mosque))



#preliminary map
#look into making fantastic maps
#perhaps a function to create it for each one, keeping it consistent etc
#ggplot is better but look into alternatives
qtm(gwr.map.lm_apartments, fill = "localR2")

#also look into sptial autocorrelation of gwr coefficients

BFC02.gwr.test(gwr.model)

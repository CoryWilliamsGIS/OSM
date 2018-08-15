#nairobi constituency tests
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


Nairobi2 <- read_excel("nairobi_const2.xlsx", sheet = "Sheet1")   

n_dep <- read_excel("nairobi_const_dep.xlsx", sheet = "Sheet2") 
n_const_sum <- read_excel("nairobi_const_dep.xlsx", sheet = "Sheet1") 

#n_const_sum

Nairobi2 <- Nairobi2[, c(-3,-4,-5,-10,-11,-12,-12:-15)]

#dependent variables



n_const_tag_begin <- n_dep[,1]
n_const_tag_school <- n_dep[,2:3]
n_const_tag_college <- n_dep[,4:5]
n_const_tag_pub <- n_dep[,6:7]
n_const_tag_bar <- n_dep[,8:9]
n_const_tag_pharmacy <- n_dep[,10:11]
n_const_tag_hospital <- n_dep[,12:13]
n_const_tag_dentist <- n_dep[,14:15]
n_const_tag_clinic <- n_dep[,16:17]
n_const_tag_police <- n_dep[,18:19]
n_const_tag_bank <- n_dep[,20:21]
n_const_tag_atm <- n_dep[,22:23]
n_const_tag_restaurant <- n_dep[,24:25]
n_const_tag_fast_food <- n_dep[,26:27]
n_const_tag_toilets <- n_dep[,28:29]
n_const_tag_drinking_water <- n_dep[,30:31]
n_const_tag_place_of_worship <- n_dep[,32:33]
n_const_tag_bus_stop <- n_dep[,34:35]
n_const_tag_street_lamp <- n_dep[,36:37]
n_const_tag_hotel <- n_dep[,38:39]
n_const_tag_industrial <- n_dep[,40:41]
n_const_tag_apartment <- n_dep[,42:43]
n_const_tag_house <- n_dep[,44:45]
n_const_tag_church <- n_dep[,46:47]
n_const_tag_mosque <- n_dep[,48:49]
n_const_tag_unique_users <- n_const_sum[,c(1,2:6)]

n_const_tag1 <- n_const_tag_begin#join each tag 
n_const_tag1 <- left_join(n_const_tag1, n_const_tag_unique_users, by=c("CONSTITUEN"="CONSTITUEN"))
n_const_tag1 <- left_join(n_const_tag1, n_const_tag_school, by=c("CONSTITUEN"="constituen1"))  
n_const_tag1 <- left_join(n_const_tag1, n_const_tag_college, by=c("CONSTITUEN"="constituen2"))  
n_const_tag1 <- left_join(n_const_tag1, n_const_tag_pub, by=c("CONSTITUEN"="constituen3"))  
n_const_tag1 <- left_join(n_const_tag1, n_const_tag_bar, by=c("CONSTITUEN"="constituen4"))  
n_const_tag1 <- left_join(n_const_tag1, n_const_tag_pharmacy, by=c("CONSTITUEN"="constituen5"))
n_const_tag1 <- left_join(n_const_tag1, n_const_tag_hospital, by=c("CONSTITUEN"="constituen6"))  
n_const_tag1 <- left_join(n_const_tag1, n_const_tag_dentist, by=c("CONSTITUEN"="constituen7"))  
n_const_tag1 <- left_join(n_const_tag1, n_const_tag_clinic, by=c("CONSTITUEN"="constituen8"))  
n_const_tag1 <- left_join(n_const_tag1, n_const_tag_police, by=c("CONSTITUEN"="constituen9"))  
n_const_tag1 <- left_join(n_const_tag1, n_const_tag_bank, by=c("CONSTITUEN"="constituen10"))  
n_const_tag1 <- left_join(n_const_tag1, n_const_tag_atm, by=c("CONSTITUEN"="constituen11"))  
n_const_tag1 <- left_join(n_const_tag1, n_const_tag_restaurant, by=c("CONSTITUEN"="constituen12"))  
n_const_tag1 <- left_join(n_const_tag1, n_const_tag_fast_food, by=c("CONSTITUEN"="constituen13"))  
n_const_tag1 <- left_join(n_const_tag1, n_const_tag_toilets, by=c("CONSTITUEN"="constituen14"))  
n_const_tag1 <- left_join(n_const_tag1, n_const_tag_drinking_water, by=c("CONSTITUEN"="constituen15"))  
n_const_tag1 <- left_join(n_const_tag1, n_const_tag_place_of_worship, by=c("CONSTITUEN"="constituen16"))  
n_const_tag1 <- left_join(n_const_tag1, n_const_tag_bus_stop, by=c("CONSTITUEN"="constituen17"))  
n_const_tag1 <- left_join(n_const_tag1, n_const_tag_street_lamp, by=c("CONSTITUEN"="constituen18"))  
n_const_tag1 <- left_join(n_const_tag1, n_const_tag_hotel, by=c("CONSTITUEN"="constituen19"))  
n_const_tag1 <- left_join(n_const_tag1, n_const_tag_industrial, by=c("CONSTITUEN"="constituen20"))  
n_const_tag1 <- left_join(n_const_tag1, n_const_tag_apartment, by=c("CONSTITUEN"="constituen21"))  
n_const_tag1 <- left_join(n_const_tag1, n_const_tag_house, by=c("CONSTITUEN"="constituen22"))  
n_const_tag1 <- left_join(n_const_tag1, n_const_tag_church, by=c("CONSTITUEN"="constituen23"))  
n_const_tag1 <- left_join(n_const_tag1, n_const_tag_mosque, by=c("CONSTITUEN"="constituen24"))

n_const_tag2 <- n_const_tag1


n_const_tag2[is.na(n_const_tag2)] <- 0

n_const_depdf <- n_const_tag2
n_const_indepdf <- Nairobi2

rescale <- function(x) (x-min(x))/(max(x) - min(x)) * 100
names(n_const_sum)[8] <- "ft_density"
nairobi_const_indepdf$ft_density <- n_const_sum$ft_density
rs_total_pop <- rescale(as.numeric(n_const_indepdf$population))
n_const_indepdf$population <- rs_total_pop
pop_density <- Nairobi2$population / n_const_sum$`Area (km2)`
n_const_indepdf$pop_density <- pop_density
n_const_indepdf$pp_hh <- as.numeric(Nairobi2$population)/as.numeric(Nairobi2$tot_hh)


nairobi_const_join <- left_join(n_const_indepdf, n_const_depdf, by=c("CONSTITUEN"="CONSTITUEN"))
nairobi_const_join$ft_density <- n_const_sum$ft_density
#n_const_indepdf$pp_hh <- as.numeric(Nairobi2$population)/as.numeric(Nairobi2$tot_hh)



n_const_indepcor <- n_const_indepdf
n_const_depcor <- n_const_depdf
#library("Hmisc")
n_const_indepcor <- n_const_indepcor[,-1]
n_const_indepcor2 <- rcorr(as.matrix(n_const_indepcor))
n_const_indepcor2
r <- as.data.frame(n_const_indepcor2$r)
View(r)
#change from character df to numeric matrix
n_const_indepcor <- data.frame(sapply(n_const_indepcor, function(x) as.numeric(as.character(x))))
n_res <- cor(n_const_indepcor)
round(n_res, 3)

#Nairobi2$employment_rate <- (Nairobi2$tot_working_ppl/Nairobi2$population)*100
# x <- rcorr(as.matrix(Nairobi2[,2:29]))
# xx <- as.data.frame(x$r)
# View(xx)
# xx <- xx[-2:-4,-2:-4]
# xx<- xx[c(-9,-4,-6,-12,-19,-21,-22:-23), c(-9,-4,-6,-12,-19,-21,-22:-23)]
# xx <- xx[-6,-6]
# xx <- xx[-17,-17]


x <- rcorr(as.matrix(n_const_indepdf[,2:31]))
xx <- as.data.frame(x$r)
View(xx)
xx <- xx[-2:-4,-2:-4]
xx<- xx[c(-9,-4,-6,-12,-19,-21,-22,-23), c(-9,-4,-6,-12,-19,-21,-22,-23)]

#total male, female, hh, 

#8, potential =9, 4 and 6, 12, 19, 21, 22,23,24

library("corrplot")





# rescale <- function(x) (x-min(x))/(max(x) - min(x)) * 100
# names(n_const_sum)[8] <- "ft_density"
#
# rs_total_pop <- rescale(as.numeric(nairobi_const_join$population))
# nairobi_const_indepdf$population <- rs_total_pop
# pop_density <- nairobi_const_join$population / n_const_sum$`Area (km2)`
# nairobi_const_indepdf$pop_density <- pop_density



####################
nairobi_const_join2 <- nairobi_const_join


#names(n_const_sum)[8] <- "ft_density"
#nairobi_const_join2$ft_density <- n_const_sum$ft_density
#nairobi_const_join2$employment_rate <- (nairobi_const_join2$tot_working_ppl / nairobi_const_join2$population)*100
#rs_total_pop <- rescale(as.numeric(nairobi_const_join2$population))
#nairobi_const_join2$population <- rs_total_pop
#pop_density <- nairobi_const_join$population / n_const_sum$`Area (km2)`
#rescale(pop_density)
#nairobi_const_join2$pop_density <- pop_density
names(nairobi_const_join2)[24] <- "education level index"

#names(nairobi_const_join2)[61] <- "% Employment Rate"
nairobi_const_bkup <- nairobi_const_join2



nairobi_const_join3 <- data.frame(sapply(nairobi_const_join2, function(x) as.numeric(as.character(x))))
#colnames(nairobi_const_join3) <- colnames(nairobi_const_join2)
nairobi_names <- colnames(nairobi_const_join2)
colnames(nairobi_const_join3) <- nairobi_names
nairobi_const_join3$CONSTITUEN <- nairobi_const_join2$CONSTITUEN
#nairobi_const_join3 <- nairobi_const_join3[,-1]
#nairobi_const_join3 <- nairobi_const_join3[,-28]
nairobi_const_join3 <- as.data.frame(nairobi_const_join3)
is.data.frame(nairobi_const_join3)

#nairobi_const_join3 <- as.matrix(nairobi_const_join3)
#population' 
#sex, 
#18-64,
#1-3hh, 
#female, 
#safe water,
#sanitation, 
#tenure,
#pov line,
#primary school, 
#secon school, 
#education, 
#employ, 
#pop dens,
#livestocl


n_lm_totaledits <-
  lm(
    nairobi_const_join3$`total edits` ~ nairobi_const_join3$population +
      nairobi_const_join3$`general sex ratio (females to males)` +
      nairobi_const_join3$`% of primary school attendance (6-13)` +
      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
      nairobi_const_join3$`education level index` +
      nairobi_const_join3$`% households owning own livestock` +
      nairobi_const_join3$`% pop 18-64` +
      nairobi_const_join3$`% households with 1-3 people` +
      nairobi_const_join3$`% of female headed households` +
      nairobi_const_join3$`% of households owning house they live in` +
      nairobi_const_join3$employment_rate +
      nairobi_const_join3$`% access to safe water source` + 
      nairobi_const_join3$`% access to improved sanitation` + 
      nairobi_const_join3$pop_density+
      nairobi_const_join3$`% of people living below the poverty line`
  )

n_lm_point <-
  lm(
    nairobi_const_join3$Point_Count ~ nairobi_const_join3$population +
      nairobi_const_join3$`general sex ratio (females to males)` +
      nairobi_const_join3$`% of primary school attendance (6-13)` +
      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
      nairobi_const_join3$`education level index` +
      nairobi_const_join3$`% households owning own livestock` +
      nairobi_const_join3$`% pop 18-64` +
      nairobi_const_join3$`% households with 1-3 people` +
      nairobi_const_join3$`% of female headed households` +
      nairobi_const_join3$`% of households owning house they live in` +
      nairobi_const_join3$employment_rate +
      nairobi_const_join3$`% access to safe water source` + 
      nairobi_const_join3$`% access to improved sanitation` + 
      nairobi_const_join3$pop_density
  )

n_lm_line <-
  lm(
    nairobi_const_join3$Line_Count ~ nairobi_const_join3$population +
      nairobi_const_join3$`general sex ratio (females to males)` +
      nairobi_const_join3$`% of primary school attendance (6-13)` +
      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
      nairobi_const_join3$`education level index` +
      nairobi_const_join3$`% households owning own livestock` +
      nairobi_const_join3$`% pop 18-64` +
      nairobi_const_join3$`% households with 1-3 people` +
      nairobi_const_join3$`% of female headed households` +
      nairobi_const_join3$`% of households owning house they live in` +
      nairobi_const_join3$employment_rate +
      nairobi_const_join3$`% access to safe water source` + 
      nairobi_const_join3$`% access to improved sanitation` + 
      nairobi_const_join3$pop_density
  )

n_lm_polygon <-
  lm(
    nairobi_const_join3$Polygon_Count ~ nairobi_const_join3$population +
      nairobi_const_join3$`general sex ratio (females to males)` +
      nairobi_const_join3$`% of primary school attendance (6-13)` +
      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
      nairobi_const_join3$`education level index` +
      nairobi_const_join3$`% households owning own livestock` +
      nairobi_const_join3$`% pop 18-64` +
      nairobi_const_join3$`% households with 1-3 people` +
      nairobi_const_join3$`% of female headed households` +
      nairobi_const_join3$`% of households owning house they live in` +
      nairobi_const_join3$employment_rate +
      nairobi_const_join3$`% access to safe water source` + 
      nairobi_const_join3$`% access to improved sanitation` + 
      nairobi_const_join3$pop_density
  )

n_lm_ft_density <-
  lm(
    nairobi_const_join3$ft_density ~ nairobi_const_join3$population +
      nairobi_const_join3$`general sex ratio (females to males)` +
      nairobi_const_join3$`% of primary school attendance (6-13)` +
      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
      nairobi_const_join3$`education level index` +
      nairobi_const_join3$`% households owning own livestock` +
      nairobi_const_join3$`% pop 18-64` +
      nairobi_const_join3$`% households with 1-3 people` +
      nairobi_const_join3$`% of female headed households` +
      nairobi_const_join3$`% of households owning house they live in` +
      nairobi_const_join3$employment_rate +
      nairobi_const_join3$`% access to safe water source` + 
      nairobi_const_join3$`% access to improved sanitation` + 
      nairobi_const_join3$pop_density
  )

n_lm_school <-
  lm(
    nairobi_const_join3$School ~ nairobi_const_join3$population +
      nairobi_const_join3$`general sex ratio (females to males)` +
      nairobi_const_join3$`% of primary school attendance (6-13)` +
      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
      nairobi_const_join3$`education level index` +
      nairobi_const_join3$`% households owning own livestock` +
      nairobi_const_join3$`% pop 18-64` +
      nairobi_const_join3$`% households with 1-3 people` +
      nairobi_const_join3$`% of female headed households` +
      nairobi_const_join3$`% of households owning house they live in` +
      nairobi_const_join3$employment_rate +
      nairobi_const_join3$`% access to safe water source` + 
      nairobi_const_join3$`% access to improved sanitation` + 
      nairobi_const_join3$pop_density
  )

n_lm_college <-
  lm(
    nairobi_const_join3$College ~ nairobi_const_join3$population +
      nairobi_const_join3$`general sex ratio (females to males)` +
      nairobi_const_join3$`% of primary school attendance (6-13)` +
      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
      nairobi_const_join3$`education level index` +
      nairobi_const_join3$`% households owning own livestock` +
      nairobi_const_join3$`% pop 18-64` +
      nairobi_const_join3$`% households with 1-3 people` +
      nairobi_const_join3$`% of female headed households` +
      nairobi_const_join3$`% of households owning house they live in` +
      nairobi_const_join3$employment_rate +
      nairobi_const_join3$`% access to safe water source` + 
      nairobi_const_join3$`% access to improved sanitation` + 
      nairobi_const_join3$pop_density
  )

n_lm_pub <-
  lm(
    nairobi_const_join3$Pub ~ nairobi_const_join3$population +
      nairobi_const_join3$`general sex ratio (females to males)` +
      nairobi_const_join3$`% of primary school attendance (6-13)` +
      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
      nairobi_const_join3$`education level index` +
      nairobi_const_join3$`% households owning own livestock` +
      nairobi_const_join3$`% pop 18-64` +
      nairobi_const_join3$`% households with 1-3 people` +
      nairobi_const_join3$`% of female headed households` +
      nairobi_const_join3$`% of households owning house they live in` +
      nairobi_const_join3$employment_rate +
      nairobi_const_join3$`% access to safe water source` + 
      nairobi_const_join3$`% access to improved sanitation` + 
      nairobi_const_join3$pop_density
  )


n_lm_bar <-
  lm(
    nairobi_const_join3$Bar ~ nairobi_const_join3$population +
      nairobi_const_join3$`general sex ratio (females to males)` +
      nairobi_const_join3$`% of primary school attendance (6-13)` +
      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
      nairobi_const_join3$`education level index` +
      nairobi_const_join3$`% households owning own livestock` +
      nairobi_const_join3$`% pop 18-64` +
      nairobi_const_join3$`% households with 1-3 people` +
      nairobi_const_join3$`% of female headed households` +
      nairobi_const_join3$`% of households owning house they live in` +
      nairobi_const_join3$employment_rate +
      nairobi_const_join3$`% access to safe water source` + 
      nairobi_const_join3$`% access to improved sanitation` + 
      nairobi_const_join3$pop_density
  )

n_lm_pharmacy <-
  lm(
    nairobi_const_join3$Pharmacy ~ nairobi_const_join3$population +
      nairobi_const_join3$`general sex ratio (females to males)` +
      nairobi_const_join3$`% of primary school attendance (6-13)` +
      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
      nairobi_const_join3$`education level index` +
      nairobi_const_join3$`% households owning own livestock` +
      nairobi_const_join3$`% pop 18-64` +
      nairobi_const_join3$`% households with 1-3 people` +
      nairobi_const_join3$`% of female headed households` +
      nairobi_const_join3$`% of households owning house they live in` +
      nairobi_const_join3$employment_rate +
      nairobi_const_join3$`% access to safe water source` + 
      nairobi_const_join3$`% access to improved sanitation` + 
      nairobi_const_join3$pop_density
  )

n_lm_hospital <-
  lm(
    nairobi_const_join3$Hospital ~ nairobi_const_join3$population +
      nairobi_const_join3$`general sex ratio (females to males)` +
      nairobi_const_join3$`% of primary school attendance (6-13)` +
      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
      nairobi_const_join3$`education level index` +
      nairobi_const_join3$`% households owning own livestock` +
      nairobi_const_join3$`% pop 18-64` +
      nairobi_const_join3$`% households with 1-3 people` +
      nairobi_const_join3$`% of female headed households` +
      nairobi_const_join3$`% of households owning house they live in` +
      nairobi_const_join3$employment_rate +
      nairobi_const_join3$`% access to safe water source` + 
      nairobi_const_join3$`% access to improved sanitation` + 
      nairobi_const_join3$pop_density
  )

n_lm_dentist <-
  lm(
    nairobi_const_join3$Dentist ~ nairobi_const_join3$population +
      nairobi_const_join3$`general sex ratio (females to males)` +
      nairobi_const_join3$`% of primary school attendance (6-13)` +
      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
      nairobi_const_join3$`education level index` +
      nairobi_const_join3$`% households owning own livestock` +
      nairobi_const_join3$`% pop 18-64` +
      nairobi_const_join3$`% households with 1-3 people` +
      nairobi_const_join3$`% of female headed households` +
      nairobi_const_join3$`% of households owning house they live in` +
      nairobi_const_join3$employment_rate +
      nairobi_const_join3$`% access to safe water source` + 
      nairobi_const_join3$`% access to improved sanitation` + 
      nairobi_const_join3$pop_density
  )

n_lm_clinic <-
  lm(
    nairobi_const_join3$Clinic ~ nairobi_const_join3$population +
      nairobi_const_join3$`general sex ratio (females to males)` +
      nairobi_const_join3$`% of primary school attendance (6-13)` +
      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
      nairobi_const_join3$`education level index` +
      nairobi_const_join3$`% households owning own livestock` +
      nairobi_const_join3$`% pop 18-64` +
      nairobi_const_join3$`% households with 1-3 people` +
      nairobi_const_join3$`% of female headed households` +
      nairobi_const_join3$`% of households owning house they live in` +
      nairobi_const_join3$employment_rate ++
      nairobi_const_join3$`% access to safe water source` + 
      nairobi_const_join3$`% access to improved sanitation` + 
      nairobi_const_join3$pop_density
  )


n_lm_police <-
  lm(
    nairobi_const_join3$Police ~ nairobi_const_join3$population +
      nairobi_const_join3$`general sex ratio (females to males)` +
      nairobi_const_join3$`% of primary school attendance (6-13)` +
      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
      nairobi_const_join3$`education level index` +
      nairobi_const_join3$`% households owning own livestock` +
      nairobi_const_join3$`% pop 18-64` +
      nairobi_const_join3$`% households with 1-3 people` +
      nairobi_const_join3$`% of female headed households` +
      nairobi_const_join3$`% of households owning house they live in` +
      nairobi_const_join3$employment_rate +
      nairobi_const_join3$`% access to safe water source` + 
      nairobi_const_join3$`% access to improved sanitation` + 
      nairobi_const_join3$pop_density
  )

n_lm_bank <-
  lm(
    nairobi_const_join3$Bank ~ nairobi_const_join3$population +
      nairobi_const_join3$`general sex ratio (females to males)` +
      nairobi_const_join3$`% of primary school attendance (6-13)` +
      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
      nairobi_const_join3$`education level index` +
      nairobi_const_join3$`% households owning own livestock` +
      nairobi_const_join3$`% pop 18-64` +
      nairobi_const_join3$`% households with 1-3 people` +
      nairobi_const_join3$`% of female headed households` +
      nairobi_const_join3$`% of households owning house they live in` +
      nairobi_const_join3$employment_rate +
      nairobi_const_join3$`% access to safe water source` + 
      nairobi_const_join3$`% access to improved sanitation` + 
      nairobi_const_join3$pop_density
  )


n_lm_atm <-
  lm(
    nairobi_const_join3$ATM ~ nairobi_const_join3$population +
      nairobi_const_join3$`general sex ratio (females to males)` +
      nairobi_const_join3$`% of primary school attendance (6-13)` +
      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
      nairobi_const_join3$`education level index` +
      nairobi_const_join3$`% households owning own livestock` +
      nairobi_const_join3$`% pop 18-64` +
      nairobi_const_join3$`% households with 1-3 people` +
      nairobi_const_join3$`% of female headed households` +
      nairobi_const_join3$`% of households owning house they live in` +
      nairobi_const_join3$employment_rate +
      nairobi_const_join3$`% access to safe water source` + 
      nairobi_const_join3$`% access to improved sanitation` + 
      nairobi_const_join3$pop_density
  )

  n_lm_restaurant <-
  lm(
    nairobi_const_join3$Restaurant ~ nairobi_const_join3$population +
      nairobi_const_join3$`general sex ratio (females to males)` +
      nairobi_const_join3$`% of primary school attendance (6-13)` +
      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
      nairobi_const_join3$`education level index` +
      nairobi_const_join3$`% households owning own livestock` +
      nairobi_const_join3$`% pop 18-64` +
      nairobi_const_join3$`% households with 1-3 people` +
      nairobi_const_join3$`% of female headed households` +
      nairobi_const_join3$`% of households owning house they live in` +
      nairobi_const_join3$employment_rate +
      nairobi_const_join3$`% access to safe water source` + 
      nairobi_const_join3$`% access to improved sanitation` + 
      nairobi_const_join3$pop_density
  )

n_lm_fastfood <-
  lm(
    nairobi_const_join3$`Fast Food` ~ nairobi_const_join3$population +
      nairobi_const_join3$`general sex ratio (females to males)` +
      nairobi_const_join3$`% of primary school attendance (6-13)` +
      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
      nairobi_const_join3$`education level index` +
      nairobi_const_join3$`% households owning own livestock` +
      nairobi_const_join3$`% pop 18-64` +
      nairobi_const_join3$`% households with 1-3 people` +
      nairobi_const_join3$`% of female headed households` +
      nairobi_const_join3$`% of households owning house they live in` +
      nairobi_const_join3$employment_rate +
      nairobi_const_join3$`% access to safe water source` + 
      nairobi_const_join3$`% access to improved sanitation` + 
      nairobi_const_join3$pop_density
  )

n_lm_toilets <-
  lm(
    nairobi_const_join3$Toilets ~ nairobi_const_join3$population +
      nairobi_const_join3$`general sex ratio (females to males)` +
      nairobi_const_join3$`% of primary school attendance (6-13)` +
      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
      nairobi_const_join3$`education level index` +
      nairobi_const_join3$`% households owning own livestock` +
      nairobi_const_join3$`% pop 18-64` +
      nairobi_const_join3$`% households with 1-3 people` +
      nairobi_const_join3$`% of female headed households` +
      nairobi_const_join3$`% of households owning house they live in` +
      nairobi_const_join3$employment_rate +
      nairobi_const_join3$`% access to safe water source` + 
      nairobi_const_join3$`% access to improved sanitation` + 
      nairobi_const_join3$pop_density
  )

n_lm_drinkingwater <-
  lm(
    nairobi_const_join3$`Drinking Water` ~ nairobi_const_join3$population +
      nairobi_const_join3$`general sex ratio (females to males)` +
      nairobi_const_join3$`% of primary school attendance (6-13)` +
      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
      nairobi_const_join3$`education level index` +
      nairobi_const_join3$`% households owning own livestock` +
      nairobi_const_join3$`% pop 18-64` +
      nairobi_const_join3$`% households with 1-3 people` +
      nairobi_const_join3$`% of female headed households` +
      nairobi_const_join3$`% of households owning house they live in` +
      nairobi_const_join3$employment_rate +
      nairobi_const_join3$`% access to safe water source` + 
      nairobi_const_join3$`% access to improved sanitation` + 
      nairobi_const_join3$pop_density
  )

n_lm_placeofworship <-
  lm(
    nairobi_const_join3$`Place of Worship` ~ nairobi_const_join3$population +
      nairobi_const_join3$`general sex ratio (females to males)` +
      nairobi_const_join3$`% of primary school attendance (6-13)` +
      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
      nairobi_const_join3$`education level index` +
      nairobi_const_join3$`% households owning own livestock` +
      nairobi_const_join3$`% pop 18-64` +
      nairobi_const_join3$`% households with 1-3 people` +
      nairobi_const_join3$`% of female headed households` +
      nairobi_const_join3$`% of households owning house they live in` +
      nairobi_const_join3$employment_rate +
      nairobi_const_join3$`% access to safe water source` + 
      nairobi_const_join3$`% access to improved sanitation` + 
      nairobi_const_join3$pop_density
  )


n_lm_busstop <-
  lm(
    nairobi_const_join3$Bus_Stop ~ nairobi_const_join3$population +
      nairobi_const_join3$`general sex ratio (females to males)` +
      nairobi_const_join3$`% of primary school attendance (6-13)` +
      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
      nairobi_const_join3$`education level index` +
      nairobi_const_join3$`% households owning own livestock` +
      nairobi_const_join3$`% pop 18-64` +
      nairobi_const_join3$`% households with 1-3 people` +
      nairobi_const_join3$`% of female headed households` +
      nairobi_const_join3$`% of households owning house they live in` +
      nairobi_const_join3$employment_rate +
      nairobi_const_join3$`% access to safe water source` + 
      nairobi_const_join3$`% access to improved sanitation` + 
      nairobi_const_join3$pop_density
  )


n_lm_streetlmap <-
  lm(
    nairobi_const_join3$`Street Lamp`~ nairobi_const_join3$population +
      nairobi_const_join3$`general sex ratio (females to males)` +
      nairobi_const_join3$`% of primary school attendance (6-13)` +
      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
      nairobi_const_join3$`education level index` +
      nairobi_const_join3$`% households owning own livestock` +
      nairobi_const_join3$`% pop 18-64` +
      nairobi_const_join3$`% households with 1-3 people` +
      nairobi_const_join3$`% of female headed households` +
      nairobi_const_join3$`% of households owning house they live in` +
      nairobi_const_join3$employment_rate +
      nairobi_const_join3$`% access to safe water source` + 
      nairobi_const_join3$`% access to improved sanitation` + 
      nairobi_const_join3$pop_density
  )


n_lm_hotel <-
  lm(
    nairobi_const_join3$Hotel ~ nairobi_const_join3$population +
      nairobi_const_join3$`general sex ratio (females to males)` +
      nairobi_const_join3$`% of primary school attendance (6-13)` +
      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
      nairobi_const_join3$`education level index` +
      nairobi_const_join3$`% households owning own livestock` +
      nairobi_const_join3$`% pop 18-64` +
      nairobi_const_join3$`% households with 1-3 people` +
      nairobi_const_join3$`% of female headed households` +
      nairobi_const_join3$`% of households owning house they live in` +
      nairobi_const_join3$employment_rate +
      nairobi_const_join3$`% access to safe water source` + 
      nairobi_const_join3$`% access to improved sanitation` + 
      nairobi_const_join3$pop_density
  )


n_lm_industrial <-
  lm(
    nairobi_const_join3$Industrial ~ nairobi_const_join3$population +
      nairobi_const_join3$`general sex ratio (females to males)` +
      nairobi_const_join3$`% of primary school attendance (6-13)` +
      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
      nairobi_const_join3$`education level index` +
      nairobi_const_join3$`% households owning own livestock` +
      nairobi_const_join3$`% pop 18-64` +
      nairobi_const_join3$`% households with 1-3 people` +
      nairobi_const_join3$`% of female headed households` +
      nairobi_const_join3$`% of households owning house they live in` +
      nairobi_const_join3$employment_rate +
      nairobi_const_join3$`% access to safe water source` + 
      nairobi_const_join3$`% access to improved sanitation` + 
      nairobi_const_join3$pop_density
  )

n_lm_apartments <-
  lm(
    nairobi_const_join3$Apartments ~ nairobi_const_join3$population +
      nairobi_const_join3$`general sex ratio (females to males)` +
      nairobi_const_join3$`% of primary school attendance (6-13)` +
      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
      nairobi_const_join3$`education level index` +
      nairobi_const_join3$`% households owning own livestock` +
      nairobi_const_join3$`% pop 18-64` +
      nairobi_const_join3$`% households with 1-3 people` +
      nairobi_const_join3$`% of female headed households` +
      nairobi_const_join3$`% of households owning house they live in` +
      nairobi_const_join3$employment_rate +
      nairobi_const_join3$`% access to safe water source` + 
      nairobi_const_join3$`% access to improved sanitation` + 
      nairobi_const_join3$pop_density
  )

n_lm_house <-
  lm(
    nairobi_const_join3$House ~ nairobi_const_join3$population +
      nairobi_const_join3$`general sex ratio (females to males)` +
      nairobi_const_join3$`% of primary school attendance (6-13)` +
      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
      nairobi_const_join3$`education level index` +
      nairobi_const_join3$`% households owning own livestock` +
      nairobi_const_join3$`% pop 18-64` +
      nairobi_const_join3$`% households with 1-3 people` +
      nairobi_const_join3$`% of female headed households` +
      nairobi_const_join3$`% of households owning house they live in` +
      nairobi_const_join3$employment_rate +
      nairobi_const_join3$`% access to safe water source` + 
      nairobi_const_join3$`% access to improved sanitation` + 
      nairobi_const_join3$pop_density
  )

n_lm_church <-
  lm(
    nairobi_const_join3$Church ~ nairobi_const_join3$population +
      nairobi_const_join3$`general sex ratio (females to males)` +
      nairobi_const_join3$`% of primary school attendance (6-13)` +
      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
      nairobi_const_join3$`education level index` +
      nairobi_const_join3$`% households owning own livestock` +
      nairobi_const_join3$`% pop 18-64` +
      nairobi_const_join3$`% households with 1-3 people` +
      nairobi_const_join3$`% of female headed households` +
      nairobi_const_join3$`% of households owning house they live in` +
      nairobi_const_join3$employment_rate +
      nairobi_const_join3$`% access to safe water source` + 
      nairobi_const_join3$`% access to improved sanitation` + 
      nairobi_const_join3$pop_density
  )

n_lm_mosque <-
  lm(
    nairobi_const_join3$Mosque ~ nairobi_const_join3$population +
      nairobi_const_join3$`general sex ratio (females to males)` +
      nairobi_const_join3$`% of primary school attendance (6-13)` +
      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
      nairobi_const_join3$`education level index` +
      nairobi_const_join3$`% households owning own livestock` +
      nairobi_const_join3$`% pop 18-64` +
      nairobi_const_join3$`% households with 1-3 people` +
      nairobi_const_join3$`% of female headed households` +
      nairobi_const_join3$`% of households owning house they live in` +
      nairobi_const_join3$employment_rate +
      nairobi_const_join3$`% access to safe water source` + 
      nairobi_const_join3$`% access to improved sanitation` + 
      nairobi_const_join3$pop_density
  )

#summary(n_lm_osmuid) 
summary(n_lm_totaledits)
summary(n_lm_point)
summary(n_lm_line)
summary(n_lm_polygon)
summary(n_lm_ft_density)
summary(n_lm_school)
summary(n_lm_college)
summary(n_lm_pub)### n_lm_pub
summary(n_lm_bar)###
summary(n_lm_pharmacy)
summary(n_lm_hospital)
summary(n_lm_dentist)
summary(n_lm_clinic)
summary(n_lm_police)
summary(n_lm_bank)
summary(n_lm_atm)
summary(n_lm_restaurant)
summary(n_lm_fastfood)
summary(n_lm_toilets)
summary(n_lm_drinkingwater)
summary(n_lm_placeofworship)
summary(n_lm_busstop)
summary(n_lm_streetlmap)
summary(n_lm_hotel)
summary(n_lm_industrial)
summary(n_lm_apartments)
summary(n_lm_house)
summary(n_lm_church)
summary(n_lm_mosque)



#morans

nairobi_constshp1 <- readOGR(dsn=".", layer = "nairobi_constituencies")
plot(nairobi_constshp1)
head(nairobi_constshp1@data)
n_const_jointrial <- merge(nairobi_constshp1, nairobi_join3)
drops_const <- c("CONST_CODE", "CONSTITUEN")
nairobi_constshp2 <-  nairobi_constshp1[,!(names(nairobi_constshp1) %in% drops_const)]
nairobi_constshp2@data






nairobi_const_join3[10,1] <- "DAGORETTI SOUTH"
nairobi_const_join3[12,1] <- "DAGORETTI NORTH"

nairobi_const_join3$CONSTITUEN


#library(sp)
drops_const <- c("OBJECTID", "COUNTY_NAM", "COUNTY_ASS", "COUNTY_A_1", "REGIST_CEN", "REGISTRATI",
                 "COUNTY_COD", "Shape_Leng", "Shape_Area", "CONST_CODE")
nairobi_constshp2 <-  nairobi_constshp1[,!(names(nairobi_constshp1) %in% drops_const)]
nairobi_constshp2@data
n_const_jointrial <- merge(nairobi_constshp2, nairobi_const_join3)

#https://www.rdocumentation.org/packages/spdep/versions/0.7-7/topics/poly2nb
#due to the small gaps in the constituency polygon, the neighbours code had to be adjust
#see above for details
n_const_neighbours <- poly2nb(n_const_jointrial, queen=TRUE, snap=100)

plot(n_const_jointrial, col="grey")
plot(n_const_neighbours, coordinates(n_const_jointrial), add=TRUE, col='red')

n_const_listw <- nb2listw(n_const_neighbours)
n_const_listw

#global - what we want i think
moran.test(n_const_jointrial$population, n_const_listw) #moran I statistic --> -0.277
moran.test(n_const_jointrial$`general sex ratio (females to males)` ,n_const_listw)#moran I statistic --> 0.006
moran.test(n_const_jointrial$`% of primary school attendance (6-13)` ,n_const_listw)#moran I statistic --> 0.004
moran.test(n_const_jointrial$`Secondary School Attendance of 14- to 17-Year-Olds` ,n_const_listw)#moran I statistic --> -0.055
moran.test(n_const_jointrial$`education level index`,n_const_listw)#moran I statistic --> -0.04
moran.test(n_const_jointrial$`% households owning own livestock` ,n_const_listw)#moran I statistic --> 0.02
moran.test(n_const_jointrial$`% pop 18-64` ,n_const_listw)#moran I statistic --> 0.2
moran.test(n_const_jointrial$`% households with 1-3 people` ,n_const_listw)#moran I statistic --> 0.08
moran.test(n_const_jointrial$`% of female headed households` ,n_const_listw)#moran I statistic --> -0.096
moran.test(n_const_jointrial$`% of households owning house they live in` ,n_const_listw)#moran I statistic --> 0.04
moran.test(n_const_jointrial$employment_rate,n_const_listw)#moran I statistic --> 0.02
moran.test(n_const_jointrial$`% access to safe water source` ,n_const_listw)#moran I statistic --> 0.297
moran.test(n_const_jointrial$`% access to improved sanitation` ,n_const_listw)#moran I statistic --> 0.34
moran.test(n_const_jointrial$pop_density ,n_const_listw)#moran I statistic --> -0.027


  
  #nairobi_const_join3 <- as.matrix(nairobi_const_join3)
  #population' 
  #sex, 
  #18-64,
  #1-3hh, 
  #female, 
  #safe water,
  #sanitation, 
  #tenure,
  #pov line,
#primary school, 
#secon school, 
#education, 
#employ, 
#pop dens,
#livestocl


# 
# n_lm_polygon <- lm(nairobi_const_join3$Polygon_Count ~nairobi_const_join3$population+  
#                      nairobi_const_join3$`general sex ratio (females to males)`+ 
#                      nairobi_const_join3$`% of primary school attendance (6-13)`+ 
#                      nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_const_join3$`education level index`+ 
#                      nairobi_const_join3$`% households owning own livestock`+ nairobi_const_join3$`% pop 18-64`+ 
#                      nairobi_const_join3$`% households with 1-3 people`+
#                      nairobi_const_join3$`% of female headed households`+ 
#                      nairobi_const_join3$`% of households owning house they live in`+ nairobi_const_join3$`% Employment Rate`+ 
#                      nairobi_const_join3$`% access to safe water source`+ nairobi_const_join3$`% access to improved sanitation`+
#                      nairobi_const_join3$pop_density)
# 
# sum(is.na(nairobi_const_join3))
# 
# 
# n_lm_totaledits <- lm(
#   nairobi_const_join3$`total edits` ~nairobi_const_join3$population +
#     nairobi_const_join3$`general sex ratio (females to males)` +
#     nairobi_const_join3$`Primary School Attendance of Underage and Overage Students` +
#     nairobi_const_join3$`Secondary School Attendance of 14- to 17-Year-Olds` + nairobi_const_join3$`education level index` +
#     nairobi_const_join3$`% households owning own livestock` + nairobi_const_join3$`% pop 18-64` +
#     nairobi_const_join3$`% households with 1-3 people` +
#     nairobi_const_join3$`% of female headed households` +
#     nairobi_const_join3$`% of households owning house they live in` + nairobi_const_join3$`% Employment Rate` +
#     nairobi_const_join3$`% access to safe water source` + nairobi_const_join3$`% access to improved sanitation` +
#     nairobi_const_join3$pop_density
# )
# 
# print(nairobi_const_join3)
#   
# 
# is.finite.data.frame <- function(obj){
#   sapply(obj,FUN = function(x) all(is.finite(x)))
# }
# 
# nairobi_const_join3 = nairobi_const_join3[is.finite.data.frame(nairobi_const_join3)]
# 


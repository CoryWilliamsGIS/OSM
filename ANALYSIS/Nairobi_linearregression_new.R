final <- r[-1:-6, -1:-6]
final <- final[c(-2,-4), c(-2,-4)]
final <- final[c(-4,-5), c(-4,-5)]
View(final)



nairobi_join2 <- nairobi_join
View(nairobi_join2)

n_lm_osmuid <- lm(nairobi_join3$`Distinct osm_users` ~nairobi_join3$`total population`+  
                    nairobi_join3$`general sex ratio (females to males)`+ 
                    nairobi_join3$`% of primary school attendance (6-13)`+ 
                    nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                    nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                    nairobi_join3$`% households with 1-3 people`+
                    nairobi_join3$`% of female headed households`+ 
                    nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                    nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+ 
                    nairobi_join3$pp_hh)

rescale <- function(x) (x-min(x))/(max(x) - min(x)) * 100

nairobi_join2 <- nairobi_join2[,-1]
nairobi_join2 <- data.frame(sapply(nairobi_join2, function(x) as.numeric(as.character(x))))
rs_tot_hh <- rescale(nairobi_join2$total.households)
#rs_tot_pov <- rescale(nairobi_join2$total.population.in.poverty)
rs_total_pop <- rescale(nairobi_join2$total.population)


n_indepcor
n_indepcor$pop_density <- pop_density
n_indepcor3 <- rcorr(as.matrix(n_indepcor))
View(n_indepcor)
xxx <- n_indepcor[,-1:-6]
#xxx$rs_tot_hh <- rs_tot_hh
xxx$rs_total_pop <- rs_total_pop
View(xxx)
xxxcor <- rcorr(as.matrix(xxx))
xxxcor2 <- rcorr(as.matrix(xxx))
xxxcor <- data.frame(sapply(xxxcor, function(x) as.numeric(as.character(x))))


corrplot(xxxcor2$r, type="upper", order="hclust", 
         addCoef.col = "black")

a <- as.data.frame(xxxcor2$r)
write.csv(a, file = "Nairobi_ward_Correlation.csv")
write.csv(nairobi_join3, file = "Nairobi_join3.csv")


View(a)

#https://www.statmethods.net/stats/regression.html

###
nairobi_join3 <- nairobi_join
rescale <- function(x) (x-min(x))/(max(x) - min(x)) * 100
rs_total_pop <- rescale(as.numeric(nairobi_join3$`total population`))
nairobi_join3$`total population` <- rs_total_pop
nairobi_join3$ft_density <- ft_density
nairobi_join3$pop_density <- pop_density

names(nairobi_join3)[20] <- "education level index"
nairobi_bkup <- nairobi_join3
nairobi_names <- colnames(nairobi_join3)
nairobi_join3 <- data.frame(sapply(nairobi_join3, function(x) as.numeric(as.character(x))))
colnames(nairobi_join3) <- nairobi_names
nairobi_join3$name <- nairobi_bkup$name

n_lm_osmuid <- lm(nairobi_join3$`Distinct osm_users` ~nairobi_join3$`total population`+  
                    nairobi_join3$`general sex ratio (females to males)`+ 
                    nairobi_join3$`% of primary school attendance (6-13)`+ 
                    nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                    nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                    nairobi_join3$`% households with 1-3 people`+
                    nairobi_join3$`% of female headed households`+ 
                    nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                    nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`
                    )#############

n_lm_totaledits <- lm(nairobi_join3$`total edits` ~nairobi_join3$`total population`+  
                    nairobi_join3$`general sex ratio (females to males)`+ 
                    nairobi_join3$`% of primary school attendance (6-13)`+ 
                    nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                    nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                    nairobi_join3$`% households with 1-3 people`+
                    nairobi_join3$`% of female headed households`+ 
                    nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                    nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`
)

n_lm_point <- lm(nairobi_join3$Point_Count ~nairobi_join3$`total population`+  
                        nairobi_join3$`general sex ratio (females to males)`+ 
                        nairobi_join3$`% of primary school attendance (6-13)`+ 
                        nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                        nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                        nairobi_join3$`% households with 1-3 people`+
                        nairobi_join3$`% of female headed households`+ 
                        nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                        nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`
)
                 
n_lm_line <- lm(nairobi_join3$Line_Count ~nairobi_join3$`total population`+  
                        nairobi_join3$`general sex ratio (females to males)`+ 
                        nairobi_join3$`% of primary school attendance (6-13)`+ 
                        nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                        nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                        nairobi_join3$`% households with 1-3 people`+
                        nairobi_join3$`% of female headed households`+ 
                        nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                        nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`
                  )

n_lm_polygon <- lm(nairobi_join3$Polygon_Count ~nairobi_join3$`total population`+  
                        nairobi_join3$`general sex ratio (females to males)`+ 
                        nairobi_join3$`% of primary school attendance (6-13)`+ 
                        nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                        nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                        nairobi_join3$`% households with 1-3 people`+
                        nairobi_join3$`% of female headed households`+ 
                        nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                        nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`
                     )

n_lm_ftdensity <- lm(nairobi_join3$ft_density ~nairobi_join3$`total population`+  
                     nairobi_join3$`general sex ratio (females to males)`+ 
                     nairobi_join3$`% of primary school attendance (6-13)`+ 
                     nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                     nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                     nairobi_join3$`% households with 1-3 people`+
                     nairobi_join3$`% of female headed households`+ 
                     nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                     nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`
                     )

n_lm_school<- lm(nairobi_join3$School ~nairobi_join3$`total population`+  
                        nairobi_join3$`general sex ratio (females to males)`+ 
                        nairobi_join3$`% of primary school attendance (6-13)`+ 
                        nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                        nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                        nairobi_join3$`% households with 1-3 people`+
                        nairobi_join3$`% of female headed households`+ 
                        nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                        nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`
                   )

n_lm_college <- lm(nairobi_join3$College ~nairobi_join3$`total population`+  
                        nairobi_join3$`general sex ratio (females to males)`+ 
                        nairobi_join3$`% of primary school attendance (6-13)`+ 
                        nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                        nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                        nairobi_join3$`% households with 1-3 people`+
                        nairobi_join3$`% of female headed households`+ 
                        nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                        nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`)

n_lm_pub <- lm(nairobi_join3$Pub ~nairobi_join3$`total population`+  
                        nairobi_join3$`general sex ratio (females to males)`+ 
                        nairobi_join3$`% of primary school attendance (6-13)`+ 
                        nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                        nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                        nairobi_join3$`% households with 1-3 people`+
                        nairobi_join3$`% of female headed households`+ 
                        nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                        nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`)

n_lm_bar <- lm(nairobi_join3$Bar ~nairobi_join3$`total population`+  
                 nairobi_join3$`general sex ratio (females to males)`+ 
                 nairobi_join3$`% of primary school attendance (6-13)`+ 
                 nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                 nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                 nairobi_join3$`% households with 1-3 people`+
                 nairobi_join3$`% of female headed households`+ 
                 nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                 nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`)

n_lm_pharmacy <- lm(nairobi_join3$Pharmacy ~nairobi_join3$`total population`+  
                 nairobi_join3$`general sex ratio (females to males)`+ 
                 nairobi_join3$`% of primary school attendance (6-13)`+ 
                 nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                 nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                 nairobi_join3$`% households with 1-3 people`+
                 nairobi_join3$`% of female headed households`+ 
                 nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                 nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`)

n_lm_hospital <- lm(nairobi_join3$Hospital ~nairobi_join3$`total population`+  
                 nairobi_join3$`general sex ratio (females to males)`+ 
                 nairobi_join3$`% of primary school attendance (6-13)`+ 
                 nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                 nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                 nairobi_join3$`% households with 1-3 people`+
                 nairobi_join3$`% of female headed households`+ 
                 nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                 nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`)

n_lm_dentist <- lm(nairobi_join3$Dentist ~nairobi_join3$`total population`+  
                 nairobi_join3$`general sex ratio (females to males)`+ 
                 nairobi_join3$`% of primary school attendance (6-13)`+ 
                 nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                 nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                 nairobi_join3$`% households with 1-3 people`+
                 nairobi_join3$`% of female headed households`+ 
                 nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                 nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`)

n_lm_clinic <- lm(nairobi_join3$Clinic ~nairobi_join3$`total population`+  
                 nairobi_join3$`general sex ratio (females to males)`+ 
                 nairobi_join3$`% of primary school attendance (6-13)`+ 
                 nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                 nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                 nairobi_join3$`% households with 1-3 people`+
                 nairobi_join3$`% of female headed households`+ 
                 nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                 nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`)

n_lm_police <- lm(nairobi_join3$Police ~nairobi_join3$`total population`+  
                 nairobi_join3$`general sex ratio (females to males)`+ 
                 nairobi_join3$`% of primary school attendance (6-13)`+ 
                 nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                 nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                 nairobi_join3$`% households with 1-3 people`+
                 nairobi_join3$`% of female headed households`+ 
                 nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                 nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`)

n_lm_bank <- lm(nairobi_join3$Bank ~nairobi_join3$`total population`+  
                 nairobi_join3$`general sex ratio (females to males)`+ 
                 nairobi_join3$`% of primary school attendance (6-13)`+ 
                 nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                 nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                 nairobi_join3$`% households with 1-3 people`+
                 nairobi_join3$`% of female headed households`+ 
                 nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                 nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`)

n_lm_atm<- lm(nairobi_join3$ATM ~nairobi_join3$`total population`+  
                 nairobi_join3$`general sex ratio (females to males)`+ 
                 nairobi_join3$`% of primary school attendance (6-13)`+ 
                 nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                 nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                 nairobi_join3$`% households with 1-3 people`+
                 nairobi_join3$`% of female headed households`+ 
                 nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                 nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`)

n_lm_restaurant <- lm(nairobi_join3$Restaurant ~nairobi_join3$`total population`+  
                 nairobi_join3$`general sex ratio (females to males)`+ 
                 nairobi_join3$`% of primary school attendance (6-13)`+ 
                 nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                 nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                 nairobi_join3$`% households with 1-3 people`+
                 nairobi_join3$`% of female headed households`+ 
                 nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                 nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`)

n_lm_fastfood <- lm(nairobi_join3$`Fast Food` ~nairobi_join3$`total population`+  
                 nairobi_join3$`general sex ratio (females to males)`+ 
                 nairobi_join3$`% of primary school attendance (6-13)`+ 
                 nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                 nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                 nairobi_join3$`% households with 1-3 people`+
                 nairobi_join3$`% of female headed households`+ 
                 nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                 nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density)

n_lm_toilets <- lm(nairobi_join3$Toilets~nairobi_join3$`total population`+  
                 nairobi_join3$`general sex ratio (females to males)`+ 
                 nairobi_join3$`% of primary school attendance (6-13)`+ 
                 nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                 nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                 nairobi_join3$`% households with 1-3 people`+
                 nairobi_join3$`% of female headed households`+ 
                 nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                 nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density)

n_lm_drinkingwater <- lm(nairobi_join3$`Drinking Water` ~nairobi_join3$`total population`+  
                 nairobi_join3$`general sex ratio (females to males)`+ 
                 nairobi_join3$`% of primary school attendance (6-13)`+ 
                 nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                 nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                 nairobi_join3$`% households with 1-3 people`+
                 nairobi_join3$`% of female headed households`+ 
                 nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                 nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density)

n_lm_placeofworship<- lm(nairobi_join3$`Place of Worship` ~nairobi_join3$`total population`+  
                 nairobi_join3$`general sex ratio (females to males)`+ 
                 nairobi_join3$`% of primary school attendance (6-13)`+ 
                 nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                 nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                 nairobi_join3$`% households with 1-3 people`+
                 nairobi_join3$`% of female headed households`+ 
                 nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                 nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density)

n_lm_busstop <- lm(nairobi_join3$Bus_Stop ~nairobi_join3$`total population`+  
                 nairobi_join3$`general sex ratio (females to males)`+ 
                 nairobi_join3$`% of primary school attendance (6-13)`+ 
                 nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                 nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                 nairobi_join3$`% households with 1-3 people`+
                 nairobi_join3$`% of female headed households`+ 
                 nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                 nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density)

n_lm_streetlamp <- lm(nairobi_join3$`Street Lamp` ~nairobi_join3$`total population`+  
                 nairobi_join3$`general sex ratio (females to males)`+ 
                 nairobi_join3$`% of primary school attendance (6-13)`+ 
                 nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                 nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                 nairobi_join3$`% households with 1-3 people`+
                 nairobi_join3$`% of female headed households`+ 
                 nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                 nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density)

n_lm_hotel <- lm(nairobi_join3$Hotel ~nairobi_join3$`total population`+  
                 nairobi_join3$`general sex ratio (females to males)`+ 
                 nairobi_join3$`% of primary school attendance (6-13)`+ 
                 nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                 nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                 nairobi_join3$`% households with 1-3 people`+
                 nairobi_join3$`% of female headed households`+ 
                 nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                 nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density)

n_lm_industrial <- lm(nairobi_join3$Industrial ~nairobi_join3$`total population`+  
                 nairobi_join3$`general sex ratio (females to males)`+ 
                 nairobi_join3$`% of primary school attendance (6-13)`+ 
                 nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                 nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                 nairobi_join3$`% households with 1-3 people`+
                 nairobi_join3$`% of female headed households`+ 
                 nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                 nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density)

n_lm_apartments <- lm(nairobi_join3$Apartments ~nairobi_join3$`total population`+  
                 nairobi_join3$`general sex ratio (females to males)`+ 
                 nairobi_join3$`% of primary school attendance (6-13)`+ 
                 nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                 nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                 nairobi_join3$`% households with 1-3 people`+
                 nairobi_join3$`% of female headed households`+ 
                 nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                 nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density)

n_lm_house <- lm(nairobi_join3$House ~nairobi_join3$`total population`+  
                 nairobi_join3$`general sex ratio (females to males)`+ 
                 nairobi_join3$`% of primary school attendance (6-13)`+ 
                 nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                 nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                 nairobi_join3$`% households with 1-3 people`+
                 nairobi_join3$`% of female headed households`+ 
                 nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                 nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density)

n_lm_church <- lm(nairobi_join3$Church ~nairobi_join3$`total population`+  
                 nairobi_join3$`general sex ratio (females to males)`+ 
                 nairobi_join3$`% of primary school attendance (6-13)`+ 
                 nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                 nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                 nairobi_join3$`% households with 1-3 people`+
                 nairobi_join3$`% of female headed households`+ 
                 nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                 nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density)

n_lm_mosque <- lm(nairobi_join3$Mosque ~nairobi_join3$`total population`+  
                 nairobi_join3$`general sex ratio (females to males)`+ 
                 nairobi_join3$`% of primary school attendance (6-13)`+ 
                 nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                 nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                 nairobi_join3$`% households with 1-3 people`+
                 nairobi_join3$`% of female headed households`+ 
                 nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                 nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density)

summary(n_lm_osmuid) 
summary(n_lm_totaledits)
summary(n_lm_point)
summary(n_lm_line)
summary(n_lm_polygon)
summary(n_lm_ftdensity)
summary(n_lm_school)
summary(n_lm_college)
summary(n_lm_pub)
summary(n_lm_bar)
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
summary(n_lm_streetlamp)
summary(n_lm_hotel)
summary(n_lm_industrial)
summary(n_lm_apartments)
summary(n_lm_house)
summary(n_lm_church)
summary(n_lm_mosque) 
summary(n_lm_totaledits)
summary(n_lm_point)
summary(n_lm_line)
summary(n_lm_polygon)
summary(n_lm_school)
summary(n_lm_college)
summary(n_lm_pub)
summary(n_lm_bar)
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
summary(n_lm_streetlamp)
summary(n_lm_hotel)
summary(n_lm_industrial)
summary(n_lm_apartments)
summary(n_lm_house)
summary(n_lm_church)
summary(n_lm_mosque)



--population density - add as independent factor
--spatial autocorrelation to measure the demographic variables in space and the osm stats in space

#add variables
ft_density <- n_sum$`Feature Density(per km2)` #dep
n_sum$population_density <- n_sum$population/n_sum$`Area (km2) #indep
pop_density <- n_sum$population_density #(per km2)


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

nairobi_wardshp1 <- readOGR(dsn=".", layer = "nairobi_wardsshp1")
plot(nairobi_wardshp1)

head(nairobi_wardshp1@data,3)
#nairobi_wardshp1[,1]
#nairobi_wardshp1

View(nairobi_join3)
#nairobi_join$name <- nairobi_join2$name

drops <- c("OBJECTID_2","OBJECTID_1", "OBJECTID", "OBJECTID_3", "CONSTITUEN", "COUNTY_COD", "Shape_Leng", "COUNTY_NAME", "Shape_Le_1", "Shape_Are", "Shape_Len", "Shape_Le_2", "Shape_Area") # list of col names
nairobi_wardshp2 <- nairobi_wardshp1[,!(names(nairobi_wardshp1) %in% drops)] #remove columns "AREA" and "PERIMETER"

#change col name to allow for successful merge 
colnames(nairobi_join3)[1] <- "NAME"
n_jointrial <- merge(nairobi_wardshp2, nairobi_join3)


library(spdep)

#calculate a neighbours list for each polygon
n_neighbours <- poly2nb(n_jointrial)

plot(n_jointrial, col="grey")
plot(n_neighbours, coordinates(n_jointrial), add = TRUE, col='red')


#create listw and perform moran test 
n_listw <- nb2listw(n_neighbours)
n_listw


moran.test(n_jointrial$Mosque ,n_listw)





#create a local moran output
n_local <- localmoran(x = n_jointrial$`Distinct osm_users`, listw = nb2listw(n_neighbours, style = "W"))

#bind the result to the map
n_local_moran_map <- cbind(n_jointrial, n_local)

#map the result
tm_shape(n_local_moran_map) + tm_fill(col = "Ii", style = "quantile", title = "Local Moran Statistic")+
  tm_layout("Spatial Autocorrelation of Total Population",
            legend.title.size=1.2,
            legend.text.size=1,
            legend.position=c("left","bottom"))

plot(nairobi_wardshp2)

#writeOGR(n_jointrial, ".", "n_jointrialshp", driver="ESRI Shapefile")

###################################################################################
######gwr - NICK BEARMAN PRACTICAL 15 

library("rgeos")
library("tmap")
#sp, rgdal already loaded 

#produce plots of linear regression - NOT GWR - move up later
par(mfrow=c(2,2))
plot(n_lm_osmuid)

#backup
n_jointrial2 <- n_jointrial

#map the residuals
resids <- residuals(n_lm_osmuid)
map.resids <- cbind(n_jointrial2,  resids) #bind residuals to shapefile
names(map.resids)[60] <- "resids" #rename the column

#plot the residulas for n_lm_osmuid
qtm(map.resids, fill = "resids")

#prior to running GWR model 
#calculate a kernel bandwidth 
#this determines how GWR subsets the data when
#it is tested on multiple models

#load the library
library("spgwr")

#calculate kernel bandwidth
GWRbandwidth <- gwr.sel(n_jointrial2$`Distinct osm_users` ~n_jointrial2$`total population`+  
                    n_jointrial2$`general sex ratio (females to males)`+ 
                    n_jointrial2$`% of primary school attendance (6-13)`+ 
                    n_jointrial2$`Secondary School Attendance of 14- to 17-Year-Olds`+ n_jointrial2$`education level index`+ 
                    n_jointrial2$`% households owning own livestock`+ n_jointrial2$`% pop 18-64`+ 
                    n_jointrial2$`% households with 1-3 people`+
                    n_jointrial2$`% of female headed households`+ 
                    n_jointrial2$`% of households owning house they live in`+ n_jointrial2$`% Employment Rate`+ 
                    n_jointrial2$`% access to safe water source`+ n_jointrial2$`% access to improved sanitation`+
                    n_jointrial2$pop_density, data = n_jointrial2, adapt = T)

#run the GWR model
gwr.model = gwr(n_jointrial2$`Distinct osm_users` ~n_jointrial2$`total population`+  
                  n_jointrial2$`general sex ratio (females to males)`+ 
                  n_jointrial2$`% of primary school attendance (6-13)`+ 
                  n_jointrial2$`Secondary School Attendance of 14- to 17-Year-Olds`+ n_jointrial2$`education level index`+ 
                  n_jointrial2$`% households owning own livestock`+ n_jointrial2$`% pop 18-64`+ 
                  n_jointrial2$`% households with 1-3 people`+
                  n_jointrial2$`% of female headed households`+ 
                  n_jointrial2$`% of households owning house they live in`+ n_jointrial2$`% Employment Rate`+ 
                  n_jointrial2$`% access to safe water source`+ n_jointrial2$`% access to improved sanitation`+
                  n_jointrial2$pop_density, data = n_jointrial2, adapt = GWRbandwidth, hatmatrix=TRUE, se.fit=TRUE)

#print the results of the model
gwr.model
results$localR2



results <- as.data.frame(gwr.model$SDF)
names(results)
n_jointrial3 <- n_jointrial2
gwr.map <- cbind(n_jointrial3, as.matrix(results))
qtm(gwr.map, fill="localR2") #can use ggplot to make better maps

#http://desktop.arcgis.com/en/arcmap/10.3/tools/spatial-statistics-toolbox/interpreting-gwr-results.htm
#https://rpubs.com/adam_dennett/44975
sigTest = abs(gwr.model$SDF$n_jointrial2..total.population.) -2 * gwr.model$SDF$n_jointrial2..total.population._se
sigTest

LondonWards$GWRUnauthSig<-sigTest
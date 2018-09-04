#dep group
n.group <- read_excel("Nairobi_wards_whatismapped.xlsx", sheet = "Sheet1") 

#indep
Nairobi <- read_excel("Case_study_common_data.xlsx", sheet = "Nairobi") 

n.join <- left_join(n_indepdf, n.group, by=c("name"="ward"))


n.name <- colnames(n.join)
n.join2 <- data.frame(sapply(n.join, function(x) as.numeric(as.character(x))))
colnames(n.join2) <- n.name
n.join2[,1:2] <- n.join[,1:2]

pop_density <- n.join2$`total population`/n_sum$`Area (km2)`
n.join2$pop_density <- pop_density

names(n.join2)[20] <- "education level index"

#linear regression

# n_lm_house <-
#   lm(
#     nairobi_join3$House ~ nairobi_join3$population +
#       nairobi_join3$`general sex ratio (females to males)` +
#       nairobi_join3$`% of primary school attendance (6-13)` +
#       nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds` +
#       nairobi_join3$`education level index` +
#       nairobi_join3$`% households owning own livestock` +
#       nairobi_join3$`% pop 18-64` +
#       nairobi_join3$`% households with 1-3 people` +
#       nairobi_join3$`% of female headed households` +
#       nairobi_join3$`% of households owning house they live in` +
#       nairobi_join3$employment_rate +
#       nairobi_join3$`% access to safe water source` + nairobi_join3$`% access to improved sanitation` + nairobi_join3$pop_density
#   )

n.lm.group.rec <- lm(n.join2$rec ~
                       n.join2$`general sex ratio (females to males)`+ 
                       n.join2$`% of primary school attendance (6-13)`+ 
                       n.join2$`Secondary School Attendance of 14- to 17-Year-Olds`+
                       n.join2$`education level index`+ 
                       n.join2$`% households owning own livestock`+
                       n.join2$`% pop 18-64`+ 
                       n.join2$`% households with 1-3 people`+
                       n.join2$`% of female headed households`+ 
                       n.join2$`% of households owning house they live in`+
                       n.join2$`% Employment Rate`+ 
                       n.join2$`% access to safe water source`+ 
                       n.join2$`% access to improved sanitation`)

n.lm.group.edu <- lm(n.join2$education ~
                       n.join2$`general sex ratio (females to males)`+ 
                       n.join2$`% of primary school attendance (6-13)`+ 
                       n.join2$`Secondary School Attendance of 14- to 17-Year-Olds`+
                       n.join2$`education level index`+ 
                       n.join2$`% households owning own livestock`+
                       n.join2$`% pop 18-64`+ 
                       n.join2$`% households with 1-3 people`+
                       n.join2$`% of female headed households`+ 
                       n.join2$`% of households owning house they live in`+
                       n.join2$`% Employment Rate`+ 
                       n.join2$`% access to safe water source`+ 
                       n.join2$`% access to improved sanitation`
)


n.lm.group.rel <- lm(n.join2$rel ~
                       n.join2$`general sex ratio (females to males)`+ 
                       n.join2$`% of primary school attendance (6-13)`+ 
                       n.join2$`Secondary School Attendance of 14- to 17-Year-Olds`+
                       n.join2$`education level index`+ 
                       n.join2$`% households owning own livestock`+
                       n.join2$`% pop 18-64`+ 
                       n.join2$`% households with 1-3 people`+
                       n.join2$`% of female headed households`+ 
                       n.join2$`% of households owning house they live in`+
                       n.join2$`% Employment Rate`+ 
                       n.join2$`% access to safe water source`+ 
                       n.join2$`% access to improved sanitation`
)


n.lm.group.prop <- lm(n.join2$prop ~
                        n.join2$`general sex ratio (females to males)`+ 
                        n.join2$`% of primary school attendance (6-13)`+ 
                        n.join2$`Secondary School Attendance of 14- to 17-Year-Olds`+
                        n.join2$`education level index`+ 
                        n.join2$`% households owning own livestock`+
                        n.join2$`% pop 18-64`+ 
                        n.join2$`% households with 1-3 people`+
                        n.join2$`% of female headed households`+ 
                        n.join2$`% of households owning house they live in`+
                        n.join2$`% Employment Rate`+ 
                        n.join2$`% access to safe water source`+ 
                        n.join2$`% access to improved sanitation`
)


n.lm.group.infra <- lm(n.join2$infra ~
                         n.join2$`general sex ratio (females to males)`+ 
                         n.join2$`% of primary school attendance (6-13)`+ 
                         n.join2$`Secondary School Attendance of 14- to 17-Year-Olds`+
                         n.join2$`education level index`+ 
                         n.join2$`% households owning own livestock`+
                         n.join2$`% pop 18-64`+ 
                         n.join2$`% households with 1-3 people`+
                         n.join2$`% of female headed households`+ 
                         n.join2$`% of households owning house they live in`+
                         n.join2$`% Employment Rate`+ 
                         n.join2$`% access to safe water source`+ 
                         n.join2$`% access to improved sanitation`
)

                       
                       


n.lm.group.ps <- lm(n.join2$ps ~
                      n.join2$`general sex ratio (females to males)`+ 
                      n.join2$`% of primary school attendance (6-13)`+ 
                      n.join2$`Secondary School Attendance of 14- to 17-Year-Olds`+
                      n.join2$`education level index`+ 
                      n.join2$`% households owning own livestock`+
                      n.join2$`% pop 18-64`+ 
                      n.join2$`% households with 1-3 people`+
                      n.join2$`% of female headed households`+ 
                      n.join2$`% of households owning house they live in`+
                      n.join2$`% Employment Rate`+ 
                      n.join2$`% access to safe water source`+ 
                      n.join2$`% access to improved sanitation`
)

                   
                   
            



summary(n.lm.group.rec)
summary(n.lm.group.edu)
summary(n.lm.group.rel)
summary(n.lm.group.prop)
summary(n.lm.group.infra)
summary(n.lm.group.ps)

nairobi_wardshp1 <- readOGR(dsn=".", layer = "nairobi_wardsshp1")
nairobi_wardshp1$

moran.test(n.join2$rec, n_listw)
moran.test(n.join2$education, n_listw)
moran.test(n.join2$rel, n_listw)
moran.test(n.join2$prop, n_listw)
moran.test(n.join2$infra, n_listw)
moran.test(n.join2$ps, n_listw)


colnames(n.join2)[1] <- "NAME"
n.group.join <- merge(nairobi_wardshp1, n.join2)


#bandwidth
n.rec <- gwr.sel(n.join2$rec ~
                       n.join2$`general sex ratio (females to males)`+ 
                       n.join2$`% of primary school attendance (6-13)`+ 
                       n.join2$`Secondary School Attendance of 14- to 17-Year-Olds`+
                       n.join2$`education level index`+ 
                       n.join2$`% households owning own livestock`+
                       n.join2$`% pop 18-64`+ 
                       n.join2$`% households with 1-3 people`+
                       n.join2$`% of female headed households`+ 
                       n.join2$`% of households owning house they live in`+
                       n.join2$`% Employment Rate`+ 
                       n.join2$`% access to safe water source`+ 
                       n.join2$`% access to improved sanitation`,
                 data=n.group.join, adapt = T)

n.edu <- gwr.sel(n.join2$education ~
                       n.join2$`general sex ratio (females to males)`+ 
                       n.join2$`% of primary school attendance (6-13)`+ 
                       n.join2$`Secondary School Attendance of 14- to 17-Year-Olds`+
                       n.join2$`education level index`+ 
                       n.join2$`% households owning own livestock`+
                       n.join2$`% pop 18-64`+ 
                       n.join2$`% households with 1-3 people`+
                       n.join2$`% of female headed households`+ 
                       n.join2$`% of households owning house they live in`+
                       n.join2$`% Employment Rate`+ 
                       n.join2$`% access to safe water source`+ 
                       n.join2$`% access to improved sanitation`,
                 data=n.group.join, adapt = T
)


n.rel <- gwr.sel(n.join2$rel ~
                       n.join2$`general sex ratio (females to males)`+ 
                       n.join2$`% of primary school attendance (6-13)`+ 
                       n.join2$`Secondary School Attendance of 14- to 17-Year-Olds`+
                       n.join2$`education level index`+ 
                       n.join2$`% households owning own livestock`+
                       n.join2$`% pop 18-64`+ 
                       n.join2$`% households with 1-3 people`+
                       n.join2$`% of female headed households`+ 
                       n.join2$`% of households owning house they live in`+
                       n.join2$`% Employment Rate`+ 
                       n.join2$`% access to safe water source`+ 
                       n.join2$`% access to improved sanitation`,
                 data=n.group.join, adapt = T
)


n.prop <- gwr.sel(n.join2$prop ~
                        n.join2$`general sex ratio (females to males)`+ 
                        n.join2$`% of primary school attendance (6-13)`+ 
                        n.join2$`Secondary School Attendance of 14- to 17-Year-Olds`+
                        n.join2$`education level index`+ 
                        n.join2$`% households owning own livestock`+
                        n.join2$`% pop 18-64`+ 
                        n.join2$`% households with 1-3 people`+
                        n.join2$`% of female headed households`+ 
                        n.join2$`% of households owning house they live in`+
                        n.join2$`% Employment Rate`+ 
                        n.join2$`% access to safe water source`+ 
                        n.join2$`% access to improved sanitation`,
                  data=n.group.join, adapt = T
)


n.infra <- gwr.sel(n.join2$infra ~
                         n.join2$`general sex ratio (females to males)`+ 
                         n.join2$`% of primary school attendance (6-13)`+ 
                         n.join2$`Secondary School Attendance of 14- to 17-Year-Olds`+
                         n.join2$`education level index`+ 
                         n.join2$`% households owning own livestock`+
                         n.join2$`% pop 18-64`+ 
                         n.join2$`% households with 1-3 people`+
                         n.join2$`% of female headed households`+ 
                         n.join2$`% of households owning house they live in`+
                         n.join2$`% Employment Rate`+ 
                         n.join2$`% access to safe water source`+ 
                         n.join2$`% access to improved sanitation`,
                   data=n.group.join, adapt = T
)





n.ps <- gwr.sel(n.join2$ps ~
                      n.join2$`general sex ratio (females to males)`+ 
                      n.join2$`% of primary school attendance (6-13)`+ 
                      n.join2$`Secondary School Attendance of 14- to 17-Year-Olds`+
                      n.join2$`education level index`+ 
                      n.join2$`% households owning own livestock`+
                      n.join2$`% pop 18-64`+ 
                      n.join2$`% households with 1-3 people`+
                      n.join2$`% of female headed households`+ 
                      n.join2$`% of households owning house they live in`+
                      n.join2$`% Employment Rate`+ 
                      n.join2$`% access to safe water source`+ 
                      n.join2$`% access to improved sanitation`,
                data=n.group.join, adapt = T
)



#model
n.rec.model <- gwr(n.join2$rec ~
                   n.join2$`general sex ratio (females to males)`+ 
                   n.join2$`% of primary school attendance (6-13)`+ 
                   n.join2$`Secondary School Attendance of 14- to 17-Year-Olds`+
                   n.join2$`education level index`+ 
                   n.join2$`% households owning own livestock`+
                   n.join2$`% pop 18-64`+ 
                   n.join2$`% households with 1-3 people`+
                   n.join2$`% of female headed households`+ 
                   n.join2$`% of households owning house they live in`+
                   n.join2$`% Employment Rate`+ 
                   n.join2$`% access to safe water source`+ 
                   n.join2$`% access to improved sanitation`,
                 data=n.group.join, adapt = n.rec, hatmatrix=TRUE, se.fit=TRUE)

n.edu.model <- gwr(n.join2$education ~
                   n.join2$`general sex ratio (females to males)`+ 
                   n.join2$`% of primary school attendance (6-13)`+ 
                   n.join2$`Secondary School Attendance of 14- to 17-Year-Olds`+
                   n.join2$`education level index`+ 
                   n.join2$`% households owning own livestock`+
                   n.join2$`% pop 18-64`+ 
                   n.join2$`% households with 1-3 people`+
                   n.join2$`% of female headed households`+ 
                   n.join2$`% of households owning house they live in`+
                   n.join2$`% Employment Rate`+ 
                   n.join2$`% access to safe water source`+ 
                   n.join2$`% access to improved sanitation`,
                 data=n.group.join, adapt = n.edu, hatmatrix=TRUE, se.fit=TRUE)



n.rel.model <- gwr(n.join2$rel ~
                   n.join2$`general sex ratio (females to males)`+ 
                   n.join2$`% of primary school attendance (6-13)`+ 
                   n.join2$`Secondary School Attendance of 14- to 17-Year-Olds`+
                   n.join2$`education level index`+ 
                   n.join2$`% households owning own livestock`+
                   n.join2$`% pop 18-64`+ 
                   n.join2$`% households with 1-3 people`+
                   n.join2$`% of female headed households`+ 
                   n.join2$`% of households owning house they live in`+
                   n.join2$`% Employment Rate`+ 
                   n.join2$`% access to safe water source`+ 
                   n.join2$`% access to improved sanitation`,
                 data=n.group.join, adapt = n.rel, hatmatrix=TRUE, se.fit=TRUE)


n.prop.model <- gwr(n.join2$prop ~
                    n.join2$`general sex ratio (females to males)`+ 
                    n.join2$`% of primary school attendance (6-13)`+ 
                    n.join2$`Secondary School Attendance of 14- to 17-Year-Olds`+
                    n.join2$`education level index`+ 
                    n.join2$`% households owning own livestock`+
                    n.join2$`% pop 18-64`+ 
                    n.join2$`% households with 1-3 people`+
                    n.join2$`% of female headed households`+ 
                    n.join2$`% of households owning house they live in`+
                    n.join2$`% Employment Rate`+ 
                    n.join2$`% access to safe water source`+ 
                    n.join2$`% access to improved sanitation`,
                  data=n.group.join, adapt = n.prop, hatmatrix=TRUE, se.fit=TRUE)


n.infra.model <- gwr(n.join2$infra ~
                     n.join2$`general sex ratio (females to males)`+ 
                     n.join2$`% of primary school attendance (6-13)`+ 
                     n.join2$`Secondary School Attendance of 14- to 17-Year-Olds`+
                     n.join2$`education level index`+ 
                     n.join2$`% households owning own livestock`+
                     n.join2$`% pop 18-64`+ 
                     n.join2$`% households with 1-3 people`+
                     n.join2$`% of female headed households`+ 
                     n.join2$`% of households owning house they live in`+
                     n.join2$`% Employment Rate`+ 
                     n.join2$`% access to safe water source`+ 
                     n.join2$`% access to improved sanitation`,
                   data=n.group.join, adapt = n.infra,hatmatrix=TRUE, se.fit=TRUE)





n.ps.model <- gwr(n.join2$ps ~
                  n.join2$`general sex ratio (females to males)`+ 
                  n.join2$`% of primary school attendance (6-13)`+ 
                  n.join2$`Secondary School Attendance of 14- to 17-Year-Olds`+
                  n.join2$`education level index`+ 
                  n.join2$`% households owning own livestock`+
                  n.join2$`% pop 18-64`+ 
                  n.join2$`% households with 1-3 people`+
                  n.join2$`% of female headed households`+ 
                  n.join2$`% of households owning house they live in`+
                  n.join2$`% Employment Rate`+ 
                  n.join2$`% access to safe water source`+ 
                  n.join2$`% access to improved sanitation`,
                data=n.group.join, adapt = n.ps,hatmatrix=TRUE, se.fit=TRUE)

n.rec.model
n.edu.model
n.rel.model
n.prop.model
n.infra.model
n.ps.model


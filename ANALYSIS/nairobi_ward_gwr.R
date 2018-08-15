n_join


gwrbandwidth.n_lm_totaledits <- gwr.sel(nairobi_join3$`total edits` ~nairobi_join3$`total population`+  
                                          nairobi_join3$`general sex ratio (females to males)`+ 
                                          nairobi_join3$`% of primary school attendance (6-13)`+ 
                                          nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                          nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                          nairobi_join3$`% households with 1-3 people`+
                                          nairobi_join3$`% of female headed households`+ 
                                          nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                          nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = T
)

gwrbandwidth.n_lm_point <- gwr.sel(nairobi_join3$Point_Count ~nairobi_join3$`total population`+  
                                     nairobi_join3$`general sex ratio (females to males)`+ 
                                     nairobi_join3$`% of primary school attendance (6-13)`+ 
                                     nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                     nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                     nairobi_join3$`% households with 1-3 people`+
                                     nairobi_join3$`% of female headed households`+ 
                                     nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                     nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = T)

gwrbandwidth.n_lm_line <- gwr.sel(nairobi_join3$Line_Count ~nairobi_join3$`total population`+  
                                    nairobi_join3$`general sex ratio (females to males)`+ 
                                    nairobi_join3$`% of primary school attendance (6-13)`+ 
                                    nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                    nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                    nairobi_join3$`% households with 1-3 people`+
                                    nairobi_join3$`% of female headed households`+ 
                                    nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                    nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = T
)

gwrbandwidth.n_lm_polygon <- gwr.sel(nairobi_join3$Polygon_Count ~nairobi_join3$`total population`+  
                                       nairobi_join3$`general sex ratio (females to males)`+ 
                                       nairobi_join3$`% of primary school attendance (6-13)`+ 
                                       nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                       nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                       nairobi_join3$`% households with 1-3 people`+
                                       nairobi_join3$`% of female headed households`+ 
                                       nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                       nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = T
)

gwrbandwidth.n_lm_ftdensity <- gwr.sel(nairobi_join3$ft_density ~nairobi_join3$`total population`+  
                                         nairobi_join3$`general sex ratio (females to males)`+ 
                                         nairobi_join3$`% of primary school attendance (6-13)`+ 
                                         nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                         nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                         nairobi_join3$`% households with 1-3 people`+
                                         nairobi_join3$`% of female headed households`+ 
                                         nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                         nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = T
)

gwrbandwidth.n_lm_school<- gwr.sel(nairobi_join3$School ~nairobi_join3$`total population`+  
                                     nairobi_join3$`general sex ratio (females to males)`+ 
                                     nairobi_join3$`% of primary school attendance (6-13)`+ 
                                     nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                     nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                     nairobi_join3$`% households with 1-3 people`+
                                     nairobi_join3$`% of female headed households`+ 
                                     nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                     nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = T
)

gwrbandwidth.n_lm_college <- gwr.sel(nairobi_join3$College ~nairobi_join3$`total population`+  
                                       nairobi_join3$`general sex ratio (females to males)`+ 
                                       nairobi_join3$`% of primary school attendance (6-13)`+ 
                                       nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                       nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                       nairobi_join3$`% households with 1-3 people`+
                                       nairobi_join3$`% of female headed households`+ 
                                       nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                       nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = T)

gwrbandwidth.n_lm_pub <- gwr.sel(nairobi_join3$Pub ~nairobi_join3$`total population`+  
                                   nairobi_join3$`general sex ratio (females to males)`+ 
                                   nairobi_join3$`% of primary school attendance (6-13)`+ 
                                   nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                   nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                   nairobi_join3$`% households with 1-3 people`+
                                   nairobi_join3$`% of female headed households`+ 
                                   nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                   nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = T)

gwrbandwidth.n_lm_bar <- gwr.sel(nairobi_join3$Bar ~nairobi_join3$`total population`+  
                                   nairobi_join3$`general sex ratio (females to males)`+ 
                                   nairobi_join3$`% of primary school attendance (6-13)`+ 
                                   nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                   nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                   nairobi_join3$`% households with 1-3 people`+
                                   nairobi_join3$`% of female headed households`+ 
                                   nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                   nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = T)

gwrbandwidth.n_lm_pharmacy <- gwr.sel(nairobi_join3$Pharmacy ~nairobi_join3$`total population`+  
                                        nairobi_join3$`general sex ratio (females to males)`+ 
                                        nairobi_join3$`% of primary school attendance (6-13)`+ 
                                        nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                        nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                        nairobi_join3$`% households with 1-3 people`+
                                        nairobi_join3$`% of female headed households`+ 
                                        nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                        nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = T)

gwrbandwidth.n_lm_hospital <- gwr.sel(nairobi_join3$Hospital ~nairobi_join3$`total population`+  
                                        nairobi_join3$`general sex ratio (females to males)`+ 
                                        nairobi_join3$`% of primary school attendance (6-13)`+ 
                                        nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                        nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                        nairobi_join3$`% households with 1-3 people`+
                                        nairobi_join3$`% of female headed households`+ 
                                        nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                        nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = T)

gwrbandwidth.n_lm_dentist <- gwr.sel(nairobi_join3$Dentist ~nairobi_join3$`total population`+  
                                       nairobi_join3$`general sex ratio (females to males)`+ 
                                       nairobi_join3$`% of primary school attendance (6-13)`+ 
                                       nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                       nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                       nairobi_join3$`% households with 1-3 people`+
                                       nairobi_join3$`% of female headed households`+ 
                                       nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                       nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = T)

gwrbandwidth.n_lm_clinic <- gwr.sel(nairobi_join3$Clinic ~nairobi_join3$`total population`+  
                                      nairobi_join3$`general sex ratio (females to males)`+ 
                                      nairobi_join3$`% of primary school attendance (6-13)`+ 
                                      nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                      nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                      nairobi_join3$`% households with 1-3 people`+
                                      nairobi_join3$`% of female headed households`+ 
                                      nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                      nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = T)

gwrbandwidth.n_lm_police <- gwr.sel(nairobi_join3$Police ~nairobi_join3$`total population`+  
                                      nairobi_join3$`general sex ratio (females to males)`+ 
                                      nairobi_join3$`% of primary school attendance (6-13)`+ 
                                      nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                      nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                      nairobi_join3$`% households with 1-3 people`+
                                      nairobi_join3$`% of female headed households`+ 
                                      nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                      nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = T)

gwrbandwidth.n_lm_bank <- gwr.sel(nairobi_join3$Bank ~nairobi_join3$`total population`+  
                                    nairobi_join3$`general sex ratio (females to males)`+ 
                                    nairobi_join3$`% of primary school attendance (6-13)`+ 
                                    nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                    nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                    nairobi_join3$`% households with 1-3 people`+
                                    nairobi_join3$`% of female headed households`+ 
                                    nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                    nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = T)

gwrbandwidth.n_lm_atm<- gwr.sel(nairobi_join3$ATM ~nairobi_join3$`total population`+  
                                  nairobi_join3$`general sex ratio (females to males)`+ 
                                  nairobi_join3$`% of primary school attendance (6-13)`+ 
                                  nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                  nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                  nairobi_join3$`% households with 1-3 people`+
                                  nairobi_join3$`% of female headed households`+ 
                                  nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                  nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = T)

gwrbandwidth.n_lm_restaurant <- gwr.sel(nairobi_join3$Restaurant ~nairobi_join3$`total population`+  
                                          nairobi_join3$`general sex ratio (females to males)`+ 
                                          nairobi_join3$`% of primary school attendance (6-13)`+ 
                                          nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                          nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                          nairobi_join3$`% households with 1-3 people`+
                                          nairobi_join3$`% of female headed households`+ 
                                          nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                          nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = T)

gwrbandwidth.n_lm_fastfood <- gwr.sel(nairobi_join3$`Fast Food` ~nairobi_join3$`total population`+  
                                        nairobi_join3$`general sex ratio (females to males)`+ 
                                        nairobi_join3$`% of primary school attendance (6-13)`+ 
                                        nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                        nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                        nairobi_join3$`% households with 1-3 people`+
                                        nairobi_join3$`% of female headed households`+ 
                                        nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                        nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = T)

gwrbandwidth.n_lm_toilets <- gwr.sel(nairobi_join3$Toilets~nairobi_join3$`total population`+  
                                       nairobi_join3$`general sex ratio (females to males)`+ 
                                       nairobi_join3$`% of primary school attendance (6-13)`+ 
                                       nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                       nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                       nairobi_join3$`% households with 1-3 people`+
                                       nairobi_join3$`% of female headed households`+ 
                                       nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                       nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = T)

gwrbandwidth.n_lm_drinkingwater <- gwr.sel(nairobi_join3$`Drinking Water` ~nairobi_join3$`total population`+  
                                             nairobi_join3$`general sex ratio (females to males)`+ 
                                             nairobi_join3$`% of primary school attendance (6-13)`+ 
                                             nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                             nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                             nairobi_join3$`% households with 1-3 people`+
                                             nairobi_join3$`% of female headed households`+ 
                                             nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                             nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = T)

gwrbandwidth.n_lm_placeofworship<- gwr.sel(nairobi_join3$`Place of Worship` ~nairobi_join3$`total population`+  
                                             nairobi_join3$`general sex ratio (females to males)`+ 
                                             nairobi_join3$`% of primary school attendance (6-13)`+ 
                                             nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                             nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                             nairobi_join3$`% households with 1-3 people`+
                                             nairobi_join3$`% of female headed households`+ 
                                             nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                             nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = T)

gwrbandwidth.n_lm_busstop <- gwr.sel(nairobi_join3$Bus_Stop ~nairobi_join3$`total population`+  
                                       nairobi_join3$`general sex ratio (females to males)`+ 
                                       nairobi_join3$`% of primary school attendance (6-13)`+ 
                                       nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                       nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                       nairobi_join3$`% households with 1-3 people`+
                                       nairobi_join3$`% of female headed households`+ 
                                       nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                       nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = T)

gwrbandwidth.n_lm_streetlamp <- gwr.sel(nairobi_join3$`Street Lamp` ~nairobi_join3$`total population`+  
                                          nairobi_join3$`general sex ratio (females to males)`+ 
                                          nairobi_join3$`% of primary school attendance (6-13)`+ 
                                          nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                          nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                          nairobi_join3$`% households with 1-3 people`+
                                          nairobi_join3$`% of female headed households`+ 
                                          nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                          nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = T)

gwrbandwidth.n_lm_hotel <- gwr.sel(nairobi_join3$Hotel ~nairobi_join3$`total population`+  
                                     nairobi_join3$`general sex ratio (females to males)`+ 
                                     nairobi_join3$`% of primary school attendance (6-13)`+ 
                                     nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                     nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                     nairobi_join3$`% households with 1-3 people`+
                                     nairobi_join3$`% of female headed households`+ 
                                     nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                     nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = T)

gwrbandwidth.n_lm_industrial <- gwr.sel(nairobi_join3$Industrial ~nairobi_join3$`total population`+  
                                          nairobi_join3$`general sex ratio (females to males)`+ 
                                          nairobi_join3$`% of primary school attendance (6-13)`+ 
                                          nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                          nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                          nairobi_join3$`% households with 1-3 people`+
                                          nairobi_join3$`% of female headed households`+ 
                                          nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                          nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = T)

gwrbandwidth.n_lm_apartments <- gwr.sel(nairobi_join3$Apartments ~nairobi_join3$`total population`+  
                                          nairobi_join3$`general sex ratio (females to males)`+ 
                                          nairobi_join3$`% of primary school attendance (6-13)`+ 
                                          nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                          nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                          nairobi_join3$`% households with 1-3 people`+
                                          nairobi_join3$`% of female headed households`+ 
                                          nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                          nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = T)

gwrbandwidth.n_lm_house <- gwr.sel(nairobi_join3$House ~nairobi_join3$`total population`+  
                                     nairobi_join3$`general sex ratio (females to males)`+ 
                                     nairobi_join3$`% of primary school attendance (6-13)`+ 
                                     nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                     nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                     nairobi_join3$`% households with 1-3 people`+
                                     nairobi_join3$`% of female headed households`+ 
                                     nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                     nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = T)

gwrbandwidth.n_lm_church <- gwr.sel(nairobi_join3$Church ~nairobi_join3$`total population`+  
                                      nairobi_join3$`general sex ratio (females to males)`+ 
                                      nairobi_join3$`% of primary school attendance (6-13)`+ 
                                      nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                      nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                      nairobi_join3$`% households with 1-3 people`+
                                      nairobi_join3$`% of female headed households`+ 
                                      nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                      nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = T)

# #gwrbandwidth.n_lm_mosque <- gwr.sel(nairobi_join3$ ~nairobi_join3$`total population`+  
#                                       nairobi_join3$`general sex ratio (females to males)`+ 
#                                       nairobi_join3$`% of primary school attendance (6-13)`+ 
#                                       nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
#                                       nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
#                                       nairobi_join3$`% households with 1-3 people`+
#                                       nairobi_join3$`% of female headed households`+ 
#                                       nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
#                                       nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = T)













gwrmodel.n_lm_totaledits <- gwr(nairobi_join3$`total edits` ~nairobi_join3$`total population`+  
                                  nairobi_join3$`general sex ratio (females to males)`+ 
                                  nairobi_join3$`% of primary school attendance (6-13)`+ 
                                  nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                  nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                  nairobi_join3$`% households with 1-3 people`+
                                  nairobi_join3$`% of female headed households`+ 
                                  nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                  nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = gwrbandwidth.n_lm_point, hatmatrix=TRUE, se.fit=TRUE
)

gwrmodel.n_lm_point <- gwr(nairobi_join3$Point_Count ~nairobi_join3$`total population`+  
                             nairobi_join3$`general sex ratio (females to males)`+ 
                             nairobi_join3$`% of primary school attendance (6-13)`+ 
                             nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                             nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                             nairobi_join3$`% households with 1-3 people`+
                             nairobi_join3$`% of female headed households`+ 
                             nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                             nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = gwrbandwidth.n_lm_point, hatmatrix=TRUE, se.fit=TRUE
)

gwrmodel.n_lm_line <- gwr(nairobi_join3$Line_Count ~nairobi_join3$`total population`+  
                            nairobi_join3$`general sex ratio (females to males)`+ 
                            nairobi_join3$`% of primary school attendance (6-13)`+ 
                            nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                            nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                            nairobi_join3$`% households with 1-3 people`+
                            nairobi_join3$`% of female headed households`+ 
                            nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                            nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = gwrbandwidth.n_lm_point, hatmatrix=TRUE, se.fit=TRUE
)

gwrmodel.n_lm_polygon <- gwr(nairobi_join3$Polygon_Count ~nairobi_join3$`total population`+  
                               nairobi_join3$`general sex ratio (females to males)`+ 
                               nairobi_join3$`% of primary school attendance (6-13)`+ 
                               nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                               nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                               nairobi_join3$`% households with 1-3 people`+
                               nairobi_join3$`% of female headed households`+ 
                               nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                               nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = gwrbandwidth.n_lm_point, hatmatrix=TRUE, se.fit=TRUE
)

gwrmodel.n_lm_ftdensity <- gwr(nairobi_join3$ft_density ~nairobi_join3$`total population`+  
                                 nairobi_join3$`general sex ratio (females to males)`+ 
                                 nairobi_join3$`% of primary school attendance (6-13)`+ 
                                 nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                 nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                 nairobi_join3$`% households with 1-3 people`+
                                 nairobi_join3$`% of female headed households`+ 
                                 nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                 nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = gwrbandwidth.n_lm_point, hatmatrix=TRUE, se.fit=TRUE
)

gwrmodel.n_lm_school<- gwr(nairobi_join3$School ~nairobi_join3$`total population`+  
                             nairobi_join3$`general sex ratio (females to males)`+ 
                             nairobi_join3$`% of primary school attendance (6-13)`+ 
                             nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                             nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                             nairobi_join3$`% households with 1-3 people`+
                             nairobi_join3$`% of female headed households`+ 
                             nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                             nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = gwrbandwidth.n_lm_point, hatmatrix=TRUE, se.fit=TRUE
)

gwrmodel.n_lm_college <- gwr(nairobi_join3$College ~nairobi_join3$`total population`+  
                               nairobi_join3$`general sex ratio (females to males)`+ 
                               nairobi_join3$`% of primary school attendance (6-13)`+ 
                               nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                               nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                               nairobi_join3$`% households with 1-3 people`+
                               nairobi_join3$`% of female headed households`+ 
                               nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                               nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = gwrbandwidth.n_lm_point, hatmatrix=TRUE, se.fit=TRUE)

gwrmodel.n_lm_pub <- gwr(nairobi_join3$Pub ~nairobi_join3$`total population`+  
                           nairobi_join3$`general sex ratio (females to males)`+ 
                           nairobi_join3$`% of primary school attendance (6-13)`+ 
                           nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                           nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                           nairobi_join3$`% households with 1-3 people`+
                           nairobi_join3$`% of female headed households`+ 
                           nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                           nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = gwrbandwidth.n_lm_point, hatmatrix=TRUE, se.fit=TRUE)

gwrmodel.n_lm_bar <- gwr(nairobi_join3$Bar ~nairobi_join3$`total population`+  
                           nairobi_join3$`general sex ratio (females to males)`+ 
                           nairobi_join3$`% of primary school attendance (6-13)`+ 
                           nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                           nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                           nairobi_join3$`% households with 1-3 people`+
                           nairobi_join3$`% of female headed households`+ 
                           nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                           nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = gwrbandwidth.n_lm_point, hatmatrix=TRUE, se.fit=TRUE)

gwrmodel.n_lm_pharmacy <- gwr(nairobi_join3$Pharmacy ~nairobi_join3$`total population`+  
                                nairobi_join3$`general sex ratio (females to males)`+ 
                                nairobi_join3$`% of primary school attendance (6-13)`+ 
                                nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                nairobi_join3$`% households with 1-3 people`+
                                nairobi_join3$`% of female headed households`+ 
                                nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = gwrbandwidth.n_lm_point, hatmatrix=TRUE, se.fit=TRUE)

gwrmodel.n_lm_hospital <- gwr(nairobi_join3$Hospital ~nairobi_join3$`total population`+  
                                nairobi_join3$`general sex ratio (females to males)`+ 
                                nairobi_join3$`% of primary school attendance (6-13)`+ 
                                nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                nairobi_join3$`% households with 1-3 people`+
                                nairobi_join3$`% of female headed households`+ 
                                nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = gwrbandwidth.n_lm_point, hatmatrix=TRUE, se.fit=TRUE)

gwrmodel.n_lm_dentist <- gwr(nairobi_join3$Dentist ~nairobi_join3$`total population`+  
                               nairobi_join3$`general sex ratio (females to males)`+ 
                               nairobi_join3$`% of primary school attendance (6-13)`+ 
                               nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                               nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                               nairobi_join3$`% households with 1-3 people`+
                               nairobi_join3$`% of female headed households`+ 
                               nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                               nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = gwrbandwidth.n_lm_point, hatmatrix=TRUE, se.fit=TRUE)

gwrmodel.n_lm_clinic <- gwr(nairobi_join3$Clinic ~nairobi_join3$`total population`+  
                              nairobi_join3$`general sex ratio (females to males)`+ 
                              nairobi_join3$`% of primary school attendance (6-13)`+ 
                              nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                              nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                              nairobi_join3$`% households with 1-3 people`+
                              nairobi_join3$`% of female headed households`+ 
                              nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                              nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = gwrbandwidth.n_lm_point, hatmatrix=TRUE, se.fit=TRUE)

gwrmodel.n_lm_police <- gwr(nairobi_join3$Police ~nairobi_join3$`total population`+  
                              nairobi_join3$`general sex ratio (females to males)`+ 
                              nairobi_join3$`% of primary school attendance (6-13)`+ 
                              nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                              nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                              nairobi_join3$`% households with 1-3 people`+
                              nairobi_join3$`% of female headed households`+ 
                              nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                              nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = gwrbandwidth.n_lm_point, hatmatrix=TRUE, se.fit=TRUE)

gwrbandwidth.n_lm_bank <- gwr(nairobi_join3$Bank ~nairobi_join3$`total population`+  
                                nairobi_join3$`general sex ratio (females to males)`+ 
                                nairobi_join3$`% of primary school attendance (6-13)`+ 
                                nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                nairobi_join3$`% households with 1-3 people`+
                                nairobi_join3$`% of female headed households`+ 
                                nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = gwrbandwidth.n_lm_point, hatmatrix=TRUE, se.fit=TRUE)

gwrmodel.n_lm_atm<- gwr(nairobi_join3$ATM ~nairobi_join3$`total population`+  
                          nairobi_join3$`general sex ratio (females to males)`+ 
                          nairobi_join3$`% of primary school attendance (6-13)`+ 
                          nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                          nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                          nairobi_join3$`% households with 1-3 people`+
                          nairobi_join3$`% of female headed households`+ 
                          nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                          nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = gwrbandwidth.n_lm_point, hatmatrix=TRUE, se.fit=TRUE)

gwrmodel.n_lm_restaurant <- gwr(nairobi_join3$Restaurant ~nairobi_join3$`total population`+  
                                  nairobi_join3$`general sex ratio (females to males)`+ 
                                  nairobi_join3$`% of primary school attendance (6-13)`+ 
                                  nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                  nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                  nairobi_join3$`% households with 1-3 people`+
                                  nairobi_join3$`% of female headed households`+ 
                                  nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                  nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = gwrbandwidth.n_lm_point, hatmatrix=TRUE, se.fit=TRUE)

gwrmodel.n_lm_fastfood <- gwr(nairobi_join3$`Fast Food` ~nairobi_join3$`total population`+  
                                nairobi_join3$`general sex ratio (females to males)`+ 
                                nairobi_join3$`% of primary school attendance (6-13)`+ 
                                nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                nairobi_join3$`% households with 1-3 people`+
                                nairobi_join3$`% of female headed households`+ 
                                nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = gwrbandwidth.n_lm_point, hatmatrix=TRUE, se.fit=TRUE)

gwrmodel.n_lm_toilets <- gwr(nairobi_join3$Toilets~nairobi_join3$`total population`+  
                               nairobi_join3$`general sex ratio (females to males)`+ 
                               nairobi_join3$`% of primary school attendance (6-13)`+ 
                               nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                               nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                               nairobi_join3$`% households with 1-3 people`+
                               nairobi_join3$`% of female headed households`+ 
                               nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                               nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = gwrbandwidth.n_lm_point, hatmatrix=TRUE, se.fit=TRUE)

gwrmodel.n_lm_drinkingwater <- gwr(nairobi_join3$`Drinking Water` ~nairobi_join3$`total population`+  
                                     nairobi_join3$`general sex ratio (females to males)`+ 
                                     nairobi_join3$`% of primary school attendance (6-13)`+ 
                                     nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                     nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                     nairobi_join3$`% households with 1-3 people`+
                                     nairobi_join3$`% of female headed households`+ 
                                     nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                     nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = gwrbandwidth.n_lm_point, hatmatrix=TRUE, se.fit=TRUE)

gwrmodel.n_lm_placeofworship<- gwr(nairobi_join3$`Place of Worship` ~nairobi_join3$`total population`+  
                                     nairobi_join3$`general sex ratio (females to males)`+ 
                                     nairobi_join3$`% of primary school attendance (6-13)`+ 
                                     nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                     nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                     nairobi_join3$`% households with 1-3 people`+
                                     nairobi_join3$`% of female headed households`+ 
                                     nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                     nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = gwrbandwidth.n_lm_point, hatmatrix=TRUE, se.fit=TRUE)

gwrmodel.n_lm_busstop <- gwr(nairobi_join3$Bus_Stop ~nairobi_join3$`total population`+  
                               nairobi_join3$`general sex ratio (females to males)`+ 
                               nairobi_join3$`% of primary school attendance (6-13)`+ 
                               nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                               nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                               nairobi_join3$`% households with 1-3 people`+
                               nairobi_join3$`% of female headed households`+ 
                               nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                               nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = gwrbandwidth.n_lm_point, hatmatrix=TRUE, se.fit=TRUE)

gwrmodel.n_lm_streetlamp <- gwr(nairobi_join3$`Street Lamp` ~nairobi_join3$`total population`+  
                                  nairobi_join3$`general sex ratio (females to males)`+ 
                                  nairobi_join3$`% of primary school attendance (6-13)`+ 
                                  nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                  nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                  nairobi_join3$`% households with 1-3 people`+
                                  nairobi_join3$`% of female headed households`+ 
                                  nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                  nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = gwrbandwidth.n_lm_point, hatmatrix=TRUE, se.fit=TRUE)

gwrmodel.n_lm_hotel <- gwr(nairobi_join3$Hotel ~nairobi_join3$`total population`+  
                             nairobi_join3$`general sex ratio (females to males)`+ 
                             nairobi_join3$`% of primary school attendance (6-13)`+ 
                             nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                             nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                             nairobi_join3$`% households with 1-3 people`+
                             nairobi_join3$`% of female headed households`+ 
                             nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                             nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = gwrbandwidth.n_lm_point, hatmatrix=TRUE, se.fit=TRUE)

gwrmodel.n_lm_industrial <- gwr(nairobi_join3$Industrial ~nairobi_join3$`total population`+  
                                  nairobi_join3$`general sex ratio (females to males)`+ 
                                  nairobi_join3$`% of primary school attendance (6-13)`+ 
                                  nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                  nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                  nairobi_join3$`% households with 1-3 people`+
                                  nairobi_join3$`% of female headed households`+ 
                                  nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                  nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = gwrbandwidth.n_lm_point, hatmatrix=TRUE, se.fit=TRUE)

gwrmodel.n_lm_apartments <- gwr(nairobi_join3$Apartments ~nairobi_join3$`total population`+  
                                  nairobi_join3$`general sex ratio (females to males)`+ 
                                  nairobi_join3$`% of primary school attendance (6-13)`+ 
                                  nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                                  nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                                  nairobi_join3$`% households with 1-3 people`+
                                  nairobi_join3$`% of female headed households`+ 
                                  nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                                  nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = gwrbandwidth.n_lm_point, hatmatrix=TRUE, se.fit=TRUE)

gwrmodel.n_lm_house <- gwr(nairobi_join3$House ~nairobi_join3$`total population`+  
                             nairobi_join3$`general sex ratio (females to males)`+ 
                             nairobi_join3$`% of primary school attendance (6-13)`+ 
                             nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                             nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                             nairobi_join3$`% households with 1-3 people`+
                             nairobi_join3$`% of female headed households`+ 
                             nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                             nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = gwrbandwidth.n_lm_point, hatmatrix=TRUE, se.fit=TRUE)

gwrmodel.n_lm_church <- gwr(nairobi_join3$Church ~nairobi_join3$`total population`+  
                              nairobi_join3$`general sex ratio (females to males)`+ 
                              nairobi_join3$`% of primary school attendance (6-13)`+ 
                              nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
                              nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
                              nairobi_join3$`% households with 1-3 people`+
                              nairobi_join3$`% of female headed households`+ 
                              nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
                              nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = gwrbandwidth.n_lm_point, hatmatrix=TRUE, se.fit=TRUE)
# 
# gwrmodel.n_lm_mosque <- gwr(nairobi_join3$Mosque ~nairobi_join3$`total population`+  
#                               nairobi_join3$`general sex ratio (females to males)`+ 
#                               nairobi_join3$`% of primary school attendance (6-13)`+ 
#                               nairobi_join3$`Secondary School Attendance of 14- to 17-Year-Olds`+ nairobi_join3$`education level index`+ 
#                               nairobi_join3$`% households owning own livestock`+ nairobi_join3$`% pop 18-64`+ 
#                               nairobi_join3$`% households with 1-3 people`+
#                               nairobi_join3$`% of female headed households`+ 
#                               nairobi_join3$`% of households owning house they live in`+ nairobi_join3$`% Employment Rate`+ 
#                               nairobi_join3$`% access to safe water source`+ nairobi_join3$`% access to improved sanitation`+nairobi_join3$pop_density, data =n_jointrial, adapt = gwrbandwidth.n_lm_point, hatmatrix=TRUE, se.fit=TRUE)







results.gwrmodel.n_lm_osmuid <-
  as.data.frame(gwrmodel.n_lm_osmuid$SDF)

results.gwrmodel.n_lm_totaledits <-
  as.data.frame(gwrmodel.n_lm_totaledis$SDF)

results.gwrmodel.n_lm_point <-as.data.frame(gwrmodel.n_lm_point$SDF)

results.gwrmodel.n_lm_line <- as.data.frame(gwrmodel.n_lm_line$SDF)

results.gwrmodel.n_lm_polygon <-
  as.data.frame(gwrmodel.n_lm_polygon$SDF)

results.gwrmodel.n_lm_ftdensity <-
  as.data.frame(gwrmodel.n_lm_ft_density$SDF)

results.gwrmodel.n_lm_school <-
  as.data.frame(gwrmodel.n_lm_school$SDF)

results.gwrmodel.n_lm_college <-
  as.data.frame(gwrmodel.n_lm_college$SDF)

results.gwrmodel.n_lm_pub <- as.data.frame(gwrmodel.n_lm_pub$SDF)

results.gwrmodel.n_lm_bar <- as.data.frame(gwrmodel.n_lm_bar$SDF)

results.gwrmodel.n_lm_pharmacy <-
  as.data.frame(gwrmodel.n_lm_pharmacy$SDF)

results.gwrmodel.n_lm_hospital <-
  as.data.frame(gwrmodel.n_lm_hospital$SDF)

results.gwrmodel.n_lm_dentist <-
  as.data.frame(gwrmodel.n_lm_dentist$SDF)

results.gwrmodel.n_lm_clinic <-
  as.data.frame(gwrmodel.n_lm_clinic$SDF)

results.gwrmodel.n_lm_police <-
  as.data.frame(gwrmodel.n_lm_police$SDF)

results.gwrmodel.n_lm_bank <- as.data.frame(gwrmodel.n_lm_bank$SDF)

results.gwrmodel.n_lm_atm <- as.data.frame(gwrmodel.n_lm_atm$SDF)

results.gwrmodel.n_lm_restaurant <-
  as.data.frame(gwrmodel.n_lm_restaurant$SDF)

results.gwrmodel.n_lm_fastfood <-
  as.data.frame(gwrmodel.n_lm_fastfood$SDF)

results.gwrmodel.n_lm_placeofworship <-
  as.data.frame(gwrmodel.n_lm_placeofworship$SDF)

results.gwrmodel.n_lm_busstop <-
  as.data.frame(gwrmodel.n_lm_busstop$SDF)

results.gwrmodel.n_lm_streetlamp <-
  as.data.frame(gwrmodel.n_lm_streetlmap$SDF)

results.gwrmodel.n_lm_hotel <-
  as.data.frame(gwrmodel.n_lm_hotel$SDF)

results.gwrmodel.n_lm_industrial <-
  as.data.frame(gwrmodel.n_lm_industrial$SDF)

results.gwrmodel.n_lm_apartments <-
  as.data.frame(gwrmodel.n_lm_apartments$SDF)

results.gwrmodel.n_lm_house <-
  as.data.frame(gwrmodel.n_lm_house$SDF)

results.gwrmodel.n_lm_church <-
  as.data.frame(gwrmodel.n_lm_church$SDF)

results.gwrmodel.n_lm_mosque <-
  as.data.frame(gwrmodel.n_lm_mosque$SDF)





# gwr.map.n_lm_osmuid <-
#   cbind(n_jointrial, as.matrix(results.gwrmodel.n_lm_osmuid))####

gwr.map.n_lm_totaledits <-
  cbind(n_jointrial,
        as.matrix(results.gwrmodel.n_lm_totaledits))

gwr.map.n_lm_point <-
  cbind(n_jointrial, as.matrix(results.gwrmodel.n_lm_point))

gwr.map.n_lm_line <-
  cbind(n_jointrial, as.matrix(results.gwrmodel.n_lm_line))

gwr.map.n_lm_polygon <-
  cbind(n_jointrial,
        as.matrix(results.gwrmodel.n_lm_polygon))

# gwr.map.n_lm_ftdensity <-
#   cbind(n_jointrial,
#         as.matrix(results.gwrmodel.n_lmftdensity))

gwr.map.n_lm_school <-
  cbind(n_jointrial, as.matrix(results.gwrmodel.n_lm_school))

gwr.map.n_lm_college <-
  cbind(n_jointrial,
        as.matrix(results.gwrmodel.n_lm_college))

gwr.map.n_lm_pub <-
  cbind(n_jointrial, as.matrix(results.gwrmodel.n_lm_pub))

gwr.map.n_lm_bar <-
  cbind(n_jointrial, as.matrix(results.gwrmodel.n_lm_bar))

gwr.map.n_lm_pharmacy <-
  cbind(n_jointrial,
        as.matrix(results.gwrmodel.n_lm_pharmacy))

gwr.map.n_lm_hospital <-
  cbind(n_jointrial,
        as.matrix(results.gwrmodel.n_lm_hospital))

gwr.map.n_lm_dentist <-
  cbind(n_jointrial,
        as.matrix(results.gwrmodel.n_lm_dentist))

gwr.map.n_lm_clinic <-
  cbind(n_jointrial, as.matrix(results.gwrmodel.n_lm_clinic))

gwr.map.n_lm_police <-
  cbind(n_jointrial, as.matrix(results.gwrmodel.n_lm_police))

gwr.map.n_lm_bank <-
  cbind(n_jointrial, as.matrix(results.gwrmodel.n_lm_bank))
# 
# gwr.map.n_lm_atm <-
#   cbind(n_jointrial, as.matrix(results.gwrmodel.n_lm_atm))

gwr.map.n_lm_restaurant <-
  cbind(n_jointrial,
        as.matrix(results.gwrmodel.n_lm_restaurant))

gwr.map.n_lm_fastfood <-
  cbind(n_jointrial,
        as.matrix(results.gwrmodel.n_lm_fastfood))

gwr.map.n_lm_placeofworship <-
  cbind(n_jointrial,
        as.matrix(results.gwrmodel.n_lm_placeofworship))

gwr.map.n_lm_busstop <-
  cbind(n_jointrial,
        as.matrix(results.gwrmodel.n_lm_busstop))

# gwr.map.n_lm_streetlmap <-
#   cbind(n_jointrial,
#         as.matrix(results.gwrmodel.n_lm_streetlamp))


gwr.map.n_lm_hotel <-
  cbind(n_jointrial, as.matrix(results.gwrmodel.n_lm_hotel))
gwr.map.n_lm_industrial <-
  cbind(n_jointrial,
        as.matrix(results.gwrmodel.n_lm_industrial))

gwr.map.n_lm_apartments <-
  cbind(n_jointrial,
        as.matrix(results.gwrmodel.n_lm_apartments))

gwr.map.n_lm_house <-
  cbind(n_jointrial, as.matrix(results.gwrmodel.n_lm_house))

gwr.map.n_lm_church <-
  cbind(n_jointrial, as.matrix(results.gwrmodel.n_lm_church))

# gwr.map.n_lm_mosque <-
#   cbind(n_jointrial, as.matrix(results.gwrmodel.n_lm_mosque))




#qtm(gwr.map.n_lm_osmuid, fill = "localR2")######
qtm(gwr.map.n_lm_totaledits, fill = "localR2")
qtm(gwr.map.n_lm_point, fill = "localR2") #.995-1
qtm(gwr.map.n_lm_line, fill = "localR2")
qtm(gwr.map.n_lm_polygon, fill = "localR2")
qtm(gwr.map.n_lm_ftdensity, fill = "localR2") #same
qtm(gwr.map.n_lm_school, fill = "localR2")
qtm(gwr.map.n_lm_college, fill = "localR2")
qtm(gwr.map.n_lm_pub, fill = "localR2")
qtm(gwr.map.n_lm_bar, fill = "localR2") #almost same
qtm(gwr.map.n_lm_pharmacy, fill = "localR2")
qtm(gwr.map.n_lm_hospital, fill = "localR2")
qtm(gwr.map.n_lm_dentist, fill = "localR2")
qtm(gwr.map.n_lm_clinic, fill = "localR2")
qtm(gwr.map.n_lm_police, fill = "localR2")
qtm(gwr.map.n_lm_bank, fill = "localR2")#same
qtm(gwr.map.n_lm_atm, fill = "localR2")#same
qtm(gwr.map.n_lm_restaurant, fill = "localR2") #very good
qtm(gwr.map.n_lm_fastfood, fill = "localR2")#very good
qtm(gwr.map.n_lm_placeofworship, fill = "localR2")
qtm(gwr.map.n_lm_busstop, fill = "localR2")
qtm(gwr.map.n_lm_streetlmap, fill = "localR2")
qtm(gwr.map.n_lm_hotel, fill = "localR2") #very good
qtm(gwr.map.n_lm_apartments, fill = "localR2") #very good
qtm(gwr.map.n_lm_house, fill = "localR2") #very good
qtm(gwr.map.n_lm_church, fill = "localR2") #very good
#qtm(gwr.map.n_lm_mosque, fill = "localR2")



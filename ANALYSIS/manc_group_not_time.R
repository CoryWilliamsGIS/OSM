#grouping

gm.group <- read_excel("manc_grouping.xlsx", sheet = "ward_group")

#View(gm.group)

#indep

GM_PCA <- read_excel("Case_study_common_data.xlsx", sheet = "GM_PCA")
GM_PCA <- GM_PCA[, -1]

gm.join <- left_join(m_indepdf, gm.group, by = c("Ward name" = "name"))

gm.name <- colnames(gm.join)
gm.join2 <- data.frame(sapply(gm.join, function(x) as.numeric(as.character(x))))
colnames(gm.join2) <- gm.name
gm.join2[,1:2] <- gm.join[,1:2]


#linear regression

lm_group_rec <- lm(
  gm.join2$rec ~ gm.join2$population +
    gm.join2$general.sex.ratio..females.to.males. +
    gm.join2$X..pop.18.64 +
    gm.join2$X..households.with.1.3.people +
    gm.join2$X..Employment.Rate +
    gm.join2$X..of.households.owning.house.they.live.in +
    gm.join2$car_or_van +
    gm.join2$highest_qual_level4_plus +
    gm.join2$christian_count +
    gm.join2$muslim_count +
    gm.join2$female_lone_parent
)

lm_group_edu <- lm(
  gm.join2$edu ~ gm.join2$population +
    gm.join2$general.sex.ratio..females.to.males. +
    gm.join2$X..pop.18.64 +
    gm.join2$X..households.with.1.3.people +
    gm.join2$X..Employment.Rate +
    gm.join2$X..of.households.owning.house.they.live.in +
    gm.join2$car_or_van +
    gm.join2$highest_qual_level4_plus +
    gm.join2$christian_count +
    gm.join2$muslim_count +
    gm.join2$female_lone_parent
)

lm_group_rel <- lm(
  gm.join2$rel ~ gm.join2$population +
    gm.join2$general.sex.ratio..females.to.males. +
    gm.join2$X..pop.18.64 +
    gm.join2$X..households.with.1.3.people +
    gm.join2$X..Employment.Rate +
    gm.join2$X..of.households.owning.house.they.live.in +
    gm.join2$car_or_van +
    gm.join2$highest_qual_level4_plus +
    gm.join2$christian_count +
    gm.join2$muslim_count +
    gm.join2$female_lone_parent
)

lm_group_prop <- lm(
  gm.join2$prop ~ gm.join2$population +
    gm.join2$general.sex.ratio..females.to.males. +
    gm.join2$X..pop.18.64 +
    gm.join2$X..households.with.1.3.people +
    gm.join2$X..Employment.Rate +
    gm.join2$X..of.households.owning.house.they.live.in +
    gm.join2$car_or_van +
    gm.join2$highest_qual_level4_plus +
    gm.join2$christian_count +
    gm.join2$muslim_count +
    gm.join2$female_lone_parent
)

lm_group_infra <- lm(
  gm.join2$infra ~ gm.join2$population +
    gm.join2$general.sex.ratio..females.to.males. +
    gm.join2$X..pop.18.64 +
    gm.join2$X..households.with.1.3.people +
    gm.join2$X..Employment.Rate +
    gm.join2$X..of.households.owning.house.they.live.in +
    gm.join2$car_or_van +
    gm.join2$highest_qual_level4_plus +
    gm.join2$christian_count +
    gm.join2$muslim_count +
    gm.join2$female_lone_parent
)

lm_group_ps <- lm(
  gm.join2$ps ~ gm.join2$population +
    gm.join2$general.sex.ratio..females.to.males. +
    gm.join2$X..pop.18.64 +
    gm.join2$X..households.with.1.3.people +
    gm.join2$X..Employment.Rate +
    gm.join2$X..of.households.owning.house.they.live.in +
    gm.join2$car_or_van +
    gm.join2$highest_qual_level4_plus +
    gm.join2$christian_count +
    gm.join2$muslim_count +
    gm.join2$female_lone_parent
)


#results of linear regression
summary(lm_group_rec)
summary(lm_group_edu)
summary(lm_group_rel)
summary(lm_group_prop)
summary(lm_group_infra)
summary(lm_group_ps)


#global moran test for grouped variables

moran.test(gm.join2$rec, listw)
moran.test(gm.join2$edu, listw)
moran.test(gm.join2$rel, listw)
moran.test(gm.join2$prop, listw)
moran.test(gm.join2$infra, listw)
moran.test(gm.join2$ps, listw)


#gwr 
GM_wardshp1$name
colnames(gm.join2)[2] <- "name"
gm.group.join <- merge(GM_wardshp1, gm.join2)

colnames(gm.join2)[11] <- "18_64"

gwr.sel_group_rec <- gwr.sel(
  gm.join2$rec ~ gm.join2$population +
    gm.join2$`general sex ratio (females to males)` +
    gm.join2$`18_64` +
    gm.join2$`% households with 1-3 people` +
    gm.join2$`% Employment Rate` +
    gm.join2$`% of households owning house they live in` +
    gm.join2$car_or_van +
    gm.join2$highest_qual_level4_plus +
    gm.join2$christian_count +
    gm.join2$muslim_count +
    gm.join2$female_lone_parent, 
    data =gm.group.join, adapt= T)

gwr.sel_group_edu <- gwr.sel(
  gm.join2$rec ~ gm.join2$population +
    gm.join2$`general sex ratio (females to males)` +
    gm.join2$`18_64` +
    gm.join2$`% households with 1-3 people` +
    gm.join2$`% Employment Rate` +
    gm.join2$`% of households owning house they live in` +
    gm.join2$car_or_van +
    gm.join2$highest_qual_level4_plus +
    gm.join2$christian_count +
    gm.join2$muslim_count +
    gm.join2$female_lone_parent, 
  data =gm.group.join, adapt= T)


gwr.sel_group_rel <- gwr.sel(
  gm.join2$rec ~ gm.join2$population +
    gm.join2$`general sex ratio (females to males)` +
    gm.join2$`18_64` +
    gm.join2$`% households with 1-3 people` +
    gm.join2$`% Employment Rate` +
    gm.join2$`% of households owning house they live in` +
    gm.join2$car_or_van +
    gm.join2$highest_qual_level4_plus +
    gm.join2$christian_count +
    gm.join2$muslim_count +
    gm.join2$female_lone_parent, 
  data =gm.group.join, adapt= T)


gwr.sel_group_prop <- gwr.sel(
  gm.join2$rec ~ gm.join2$population +
    gm.join2$`general sex ratio (females to males)` +
    gm.join2$`18_64` +
    gm.join2$`% households with 1-3 people` +
    gm.join2$`% Employment Rate` +
    gm.join2$`% of households owning house they live in` +
    gm.join2$car_or_van +
    gm.join2$highest_qual_level4_plus +
    gm.join2$christian_count +
    gm.join2$muslim_count +
    gm.join2$female_lone_parent, 
  data =gm.group.join, adapt= T)


gwr.sel_group_infra <- gwr.sel(
  gm.join2$rec ~ gm.join2$population +
    gm.join2$`general sex ratio (females to males)` +
    gm.join2$`18_64` +
    gm.join2$`% households with 1-3 people` +
    gm.join2$`% Employment Rate` +
    gm.join2$`% of households owning house they live in` +
    gm.join2$car_or_van +
    gm.join2$highest_qual_level4_plus +
    gm.join2$christian_count +
    gm.join2$muslim_count +
    gm.join2$female_lone_parent, 
  data =gm.group.join, adapt= T)


gwr.sel_group_ps <- gwr.sel(
  gm.join2$rec ~ gm.join2$population +
    gm.join2$`general sex ratio (females to males)` +
    gm.join2$`18_64` +
    gm.join2$`% households with 1-3 people` +
    gm.join2$`% Employment Rate` +
    gm.join2$`% of households owning house they live in` +
    gm.join2$car_or_van +
    gm.join2$highest_qual_level4_plus +
    gm.join2$christian_count +
    gm.join2$muslim_count +
    gm.join2$female_lone_parent, 
  data =gm.group.join, adapt= T)


#gwr model

gwr.rec <- gwr(
  gm.join2$rec ~ gm.join2$population +
    gm.join2$`general sex ratio (females to males)` +
    gm.join2$`18_64` +
    gm.join2$`% households with 1-3 people` +
    gm.join2$`% Employment Rate` +
    gm.join2$`% of households owning house they live in` +
    gm.join2$car_or_van +
    gm.join2$highest_qual_level4_plus +
    gm.join2$christian_count +
    gm.join2$muslim_count +
    gm.join2$female_lone_parent, 
  data =gm.group.join, , adapt = gwr.sel_group_rec, hatmatrix=TRUE, se.fit=TRUE)

gwr.edu <- gwr(
  gm.join2$rec ~ gm.join2$population +
    gm.join2$`general sex ratio (females to males)` +
    gm.join2$`18_64` +
    gm.join2$`% households with 1-3 people` +
    gm.join2$`% Employment Rate` +
    gm.join2$`% of households owning house they live in` +
    gm.join2$car_or_van +
    gm.join2$highest_qual_level4_plus +
    gm.join2$christian_count +
    gm.join2$muslim_count +
    gm.join2$female_lone_parent, 
  data =gm.group.join, , adapt = gwr.sel_group_edu, hatmatrix=TRUE, se.fit=TRUE)


gwr.rel <- gwr(
  gm.join2$rec ~ gm.join2$population +
    gm.join2$`general sex ratio (females to males)` +
    gm.join2$`18_64` +
    gm.join2$`% households with 1-3 people` +
    gm.join2$`% Employment Rate` +
    gm.join2$`% of households owning house they live in` +
    gm.join2$car_or_van +
    gm.join2$highest_qual_level4_plus +
    gm.join2$christian_count +
    gm.join2$muslim_count +
    gm.join2$female_lone_parent, 
  data =gm.group.join, , adapt = gwr.sel_group_rel, hatmatrix=TRUE, se.fit=TRUE)


gwr.prop <- gwr(
  gm.join2$rec ~ gm.join2$population +
    gm.join2$`general sex ratio (females to males)` +
    gm.join2$`18_64` +
    gm.join2$`% households with 1-3 people` +
    gm.join2$`% Employment Rate` +
    gm.join2$`% of households owning house they live in` +
    gm.join2$car_or_van +
    gm.join2$highest_qual_level4_plus +
    gm.join2$christian_count +
    gm.join2$muslim_count +
    gm.join2$female_lone_parent, 
  data =gm.group.join, adapt =gwr.sel_group_prop, hatmatrix=TRUE, se.fit=TRUE)


gwr.infra <- gwr(
  gm.join2$rec ~ gm.join2$population +
    gm.join2$`general sex ratio (females to males)` +
    gm.join2$`18_64` +
    gm.join2$`% households with 1-3 people` +
    gm.join2$`% Employment Rate` +
    gm.join2$`% of households owning house they live in` +
    gm.join2$car_or_van +
    gm.join2$highest_qual_level4_plus +
    gm.join2$christian_count +
    gm.join2$muslim_count +
    gm.join2$female_lone_parent, 
  data =gm.group.join, , adapt = gwr.sel_group_infra, hatmatrix=TRUE, se.fit=TRUE)


gwr.ps <- gwr(
  gm.join2$rec ~ gm.join2$population +
    gm.join2$`general sex ratio (females to males)` +
    gm.join2$`18_64` +
    gm.join2$`% households with 1-3 people` +
    gm.join2$`% Employment Rate` +
    gm.join2$`% of households owning house they live in` +
    gm.join2$car_or_van +
    gm.join2$highest_qual_level4_plus +
    gm.join2$christian_count +
    gm.join2$muslim_count +
    gm.join2$female_lone_parent, 
  data =gm.group.join, adapt =gwr.sel_group_ps, hatmatrix=TRUE, se.fit=TRUE)


gwr.rec
gwr.edu
gwr.rel
gwr.prop
gwr.infra
gwr.ps
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
library(readxl)
library(plotly)


#online plotly
#https://plot.ly/create/?fid=RPlotBot:3504#/

#plotly cheat sheet
#https://images.plot.ly/plotly-documentation/images/r_cheat_sheet.pdf

#plotly book!!!
#https://plotly-book.cpsievert.me/merging-plotly-objects.html



#look into maps with external shapefiles
#https://moderndata.plot.ly/visualizing-geo-spatial-data-with-sf-and-plotly/

#nairobi point, line, poly (same for manc), uid (same for)
#totals for manc and nairobi for each dep
#time series maps if can get map to work

#when doing it for dependent variables
#totals - dep variables = trace = legend.....subplot manc 
#if not in a map... how to represent all the dep variables in all the years and all the consts...
#defo some subplotting.. either splitting up the years or splitting up the variables into sets of 5 etc

overall <- read_excel("nairobi_overall.xlsx", sheet = "Sheet1")   
ndep <- read_excel("nairobi_overall.xlsx", sheet = "Sheet2") 





#current one to be perfected 
p <- plot_ly(overall, y = ~overall$poi, x = ~overall$year, name = 'POI', type='scatter', mode='lines+markers') %>%
  add_trace(y = ~overall$line, name = 'Line', type='scatter', mode='lines+markers') %>%
  add_trace(y = ~overall$polygon, name = 'Polygon', type='scatter', mode='lines+markers')%>%
  layout(title = "Point, Line, Polygon Feature Totals",
         xaxis = list(title = "Years"),
         yaxis = list(title ="Number of Feature"))

#subplotting
#great examples in the links above
p1 <- plot_ly(overall, y = ~overall$uid_total, x = ~overall$year, name = 'Users', type='scatter', mode='lines+markers')
p1
p2 <- subplot(p, p1)
p2



  
#NAIORBI 

#OVERALL FEATURE PLOTS

#Save the export with the legend hidden 
d2 <- plot_ly(ndep, y = ~ndep$Footway, x = ~ndep$year, name = 'Footway',type='scatter', mode='lines+markers') %>%    
  add_trace(y = ~ndep$Primary , name = 'Primary', color = I('thistle1'),type='scatter', mode='lines+markers') %>%  
  add_trace(y = ~ndep$Residential , name = 'Residential', color = I('chocolate'), type='scatter', mode='lines+markers') %>%  
  add_trace(y = ~ndep$Unclassified , name = 'Unclassified',color = I('navy'), type='scatter', mode='lines+markers')%>%
  add_trace(y = ~ndep$Toilets , name = 'Toilets', color = I('khaki4'),type='scatter', mode='lines+markers') %>%
  add_trace(y = ~ndep$`Drinking Water` , name = 'Drinking Water', color = I('brown'),type='scatter', mode='lines+markers') %>%
  add_trace(y = ~ndep$House , name = 'House', color = I('coral'),type='scatter', mode='lines+markers') %>%
  add_trace(y = ~ndep$Industrial , name = 'Industrial',color = I('mediumorchid'), type='scatter', mode='lines+markers') %>%
  add_trace(y = ~ndep$Apartments, name = 'Apartments',color = I('gold'), type='scatter', mode='lines+markers') %>%
  add_trace(y = ~ndep$Bus_Stop , name = 'Bus Stop', color = I('gray67'),type='scatter', mode='lines+markers') %>%
  add_trace(y = ~ndep$`Street Lamp` , name = 'Street Lamp', color = I('forestgreen'),type='scatter', mode='lines+markers') %>%
  add_trace(y = ~ndep$School, name = 'School', color = I('plum'),type='scatter', mode='lines+markers') %>%
  add_trace(y = ~ndep$Pharmacy, name = 'Pharmacy', color = I('violetred'),type='scatter', mode='lines+markers') %>%
  add_trace(y = ~ndep$Hospital , name = 'Hospital', color = I('linen'),type='scatter', mode='lines+markers') %>%
  add_trace(y = ~ndep$`Place of Worship` , name = 'Place of Worship', color = I('skyblue'),type='scatter', mode='lines+markers') %>%
  layout(title = "Nairobi OSM Features",
         #   xaxis = list(title = "Years"),
         yaxis = list(title ="Number of Feature"),
         legend = list(orientation='h', x=-0, y=-0.15))


d2
hide_legend(d2)

#Save the export with the legend hidden
d3 <- plot_ly(ndep, y = ~ndep$College, x = ~ndep$year, name = 'College', type='scatter', mode='lines+markers') %>%
    add_trace(y = ~ndep$Pub, name = 'Pub', color = I('red'),type='scatter', mode='lines+markers') %>%
    add_trace(y = ~ndep$Bar, name = 'Bar', color = I('light green'),type='scatter', mode='lines+markers') %>%
    add_trace(y = ~ndep$Dentist , name = 'Dentist',color = I('purple'), type='scatter', mode='lines+markers') %>%
    add_trace(y = ~ndep$Clinic, name = 'Clinic', color = I('tan'),type='scatter', mode='lines+markers') %>%
    add_trace(y = ~ndep$Police , name = 'Police',color = I('magenta'),type='scatter', mode='lines+markers') %>%
    add_trace(y = ~ndep$Bank , name = 'Bank',color = I('Orange'), type='scatter', mode='lines+markers') %>%
    add_trace(y = ~ndep$ATM , name = 'ATM', color = I('Wheat'), type='scatter', mode='lines+markers') %>%
    add_trace(y = ~ndep$Church , name = 'Church', type='scatter', mode='lines+markers') %>%
    add_trace(y = ~ndep$Mosque , name = 'Mosque',color = I('skyblue2'), type='scatter', mode='lines+markers') %>%
    add_trace(y = ~ndep$Restaurant , name = 'Restaurant',color = I('yellow'), type='scatter', mode='lines+markers') %>%
    add_trace(y = ~ndep$`Fast Food` , name = 'Fast Food', color = I('black'),type='scatter', mode='lines+markers') %>%
  layout(title = "Nairobi OSM Features",
        # xaxis = list(title = "Years"),
         yaxis = list(title ="Number of Feature"),
         legend = list(orientation='h', x=-0, y=-0.4))
d3
hide_legend(d3)

#Create a subplot just to crop the formatted legend from 
d <- subplot(d2, d3, nrows = 2, shareX = TRUE)
d 


#Repeat for greater manchester below


colors()




#overall histograms
library(plotly)

#feature density

#read in data
x = c("2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018")
y1 = c(1.034948815,	5.411645383,	1.704175103,	12.36054748,	45.75901771,	50.79226937, 55.34129345,	48.97920524,	74.64407764,	80.31607763,	103.8581869)
y2 = c(1.615049625,	2.647453998,	4.628547983,	8.04717953,	8.355361018,	0,	11.96835267,	15.65567731,	17.65684937,	19.8078436,	0)
data <- data.frame(x, y1, y2)


#plot feature density 
#not yet finished - gm missing data (2013, 2018)
p <- plot_ly(data, x = ~x, y = ~y1, type = 'bar', name = 'Nairobi', marker = list(color = 'darkorange')) %>%
  add_trace(y = ~y2, type = 'bar', name = 'Greater Manchester',  marker = list(color = 'blue'),
  line=list(color='red'), width=1.5 %>%                                                                                        line = list(color = 'rgb(8,48,107)', width = 1.5))) %>%) %>%
  layout(title = "OpenStreetMap Feature Density 2008-2018",
    xaxis = list(title = "Years", tickangle = -45),
         yaxis = list(title = "Feature Density (km2)", range = c(0,105)),
         margin = list(b = 105),
         barmode = 'group')

#print plot
p

#marker = list(color = 'dodgerblue'),

colors()

#trial with outlines
p <- plot_ly(data, x = ~x, y = ~y1, type = 'bar', name = 'Nairobi', marker = list(color = 'darkorange', line = list(color = 'darkorange1', width = 1.5))) %>%
#  add_trace(y = ~y2, type = 'bar', name = 'Greater Manchester',  marker = list(color = 'dodgerblue')) %>%
  add_trace(y = ~y2, name = 'Greater Manchester', marker = list(color = 'dodgerblue', line = list(color = 'darkblue', width = 1.5))) %>%
  layout(title = "OpenStreetMap Feature Density 2008-2018",
         xaxis = list(title = "Years", tickangle = -45),
         yaxis = list(title = "Feature Density (km2)", range = c(0,105)),
         margin = list(b = 105),
         barmode = 'group')

p

#original - REPEAT FOTR USERS, VERSION 1'S... AS OVERVIREW BEFORE FACET MAPS
p <- plot_ly(data, x = ~x, y = ~y1, type = 'bar', name = 'Nairobi', marker = list(color = 'darkorange')) %>%
     add_trace(y = ~y2, name = 'Greater Manchester', marker = list(color = 'dodgerblue')) %>%
     layout(title = "OpenStreetMap Feature Density 2008-2018",
       xaxis = list(title = "", tickangle = -45),
                       yaxis = list(title = "", range = c(0,105)),
                       margin = list(b = 105),
                       barmode = 'group')

#print plot
p











ngroup1 <- c(2008,	19,	13,	9,	11,	248,	0)
ngroup2 <- c(2009,	23,	23,	11,	10,	1577,	0)
ngroup3 <- c(2010,	16,	11,	8, 9,	366,	0)
ngroup4 <- c(2011,	76,	733,	247,	111,	869,	0)
ngroup5 <- c(2012,	117,	1129,	345,	218,	1311,	0)
ngroup6 <- c(2013,	135,	1215,	411,	247,	1247,	52)
ngroup7 <- c(2014,	133,	2248,	378,	230,	941,	514)
ngroup8 <- c(2015,	125,	1290,	263,	205,	899,	511)
ngroup9 <- c(2016,	129,	1281,	401,	221,	1279,	811)
ngroup10 <- c(2017,	155,	1830,	423,	266,	1341,	844)
ngroup11 <- c(2018,	146,	1468,	266,	185,	1422,	2195)
grouped <- data.frame(ngroup1, ngroup2, ngroup3, ngroup4, ngroup5, ngroup6, ngroup7, ngroup8, ngroup9, ngroup10, ngroup11)
grouped <- t(grouped)
grouped <- as.data.frame(grouped)
colnames(grouped) <- c("Year", "Recreation", "Public_Services", "Education", "Religion", "Infrastructure", "Misc")
rownames(grouped) <- c("1", "2", "3",  "4", "5", "6", "7", "8", "9", "10", "11")


#GROUPED LINE GRAPH - MUCH BETTER!!!

d2 <- plot_ly(ndep, y = ~grouped$Recreation , x = ~grouped$Year, name = 'Recreation',type='scatter', mode='lines+markers') %>%    
   add_trace(y = ~grouped$Public_Services , name = 'Public Services',type='scatter', mode='lines+markers') %>%  
   add_trace(y = ~grouped$Education , name = 'Education',  type='scatter', mode='lines+markers') %>%  
   add_trace(y = ~grouped$Religion, name = 'Religion', type='scatter', mode='lines+markers')%>%
   add_trace(y = ~grouped$Infrastructure , name = 'Infrastructure', type='scatter', mode='lines+markers') %>%
   add_trace(y = ~grouped$Misc , name = 'Misc',type='scatter', mode='lines+markers') %>%
  layout(title = "Nairobi OSM Features",
         #   xaxis = list(title = "Years"),
         yaxis = list(title ="Number of Feature"),
         legend = list(orientation='h', x=-0, y=-0.15))

d2


ndep1 <- read_excel("nairobi_overall.xlsx", sheet = "Sheet3")
#ndep1 <- ndep1[c(-2, -1, -5:-11, -14:-18, -20:-28),]
ndep1_recreation <- ndep1[c(-2, -1, -5:-11, -14:-18, -20:-28),]
ndep1_education <- ndep1[c(-3:-28),]
ndep1_public_services <- ndep1[c(-1:-4, -12:-13, -16:-28),]
ndep1_religion <- ndep1[c(-1:-15, -17:-22, -25:-28),]
ndep1_infrastructure <- ndep1[c(-1:-16, -19:-24),]
ndep1_misc <- ndep1[c(-1:-19, -23:-28),]

recreation_stack <- plot_ly(ndep1, x = ~ndep1_recreation$year, y = ~ndep1_recreation$`2008`, type = 'bar', name = '2008') %>%
  add_trace(y = ~ndep1_recreation$`2009`, name = '2009') %>%
  add_trace(y = ~ndep1_recreation$`2010`, name = '2010') %>%
  add_trace(y = ~ndep1_recreation$`2011`, name = '2011') %>%
  add_trace(y = ~ndep1_recreation$`2012`, name = '2012') %>%
  add_trace(y = ~ndep1_recreation$`2013`, name = '2013') %>%
  add_trace(y = ~ndep1_recreation$`2014`, name = '2014') %>%
  add_trace(y = ~ndep1_recreation$`2015`, name = '2015') %>%
  add_trace(y = ~ndep1_recreation$`2016`, name = '2016') %>%
  add_trace(y = ~ndep1_recreation$`2017`, name = '2017') %>%
  add_trace(y = ~ndep1_recreation$`2018`, name = '2018',color=I('linen')) %>%
  layout(yaxis = list(title = 'Count'), barmode = 'stack')

recreation_stack

z <- subplot(x = ~b, y=~p)

b <- plot_ly(ndep, y = ~ndep$Footway, x = ~ndep$year, name = 'Footway',type='bar', mode='lines+markers') %>%    
  add_trace(y = ~ndep$Primary , name = 'Primary', color = I('thistle1'),type='bar', mode='lines+markers') %>%  
  add_trace(y = ~ndep$Residential , name = 'Residential', color = I('chocolate'), type='bar', mode='lines+markers') %>%  
  add_trace(y = ~ndep$Unclassified , name = 'Unclassified',color = I('navy'), type='bar', mode='lines+markers')%>%
  add_trace(y = ~ndep$Toilets , name = 'Toilets', color = I('khaki4'),type='bar', mode='lines+markers') %>%
  add_trace(y = ~ndep$`Drinking Water` , name = 'Drinking Water', color = I('brown'),type='bar', mode='lines+markers') %>%
  add_trace(y = ~ndep$House , name = 'House', color = I('coral'),type='bar', mode='lines+markers') %>%
  add_trace(y = ~ndep$Industrial , name = 'Industrial',color = I('mediumorchid'), type='bar', mode='lines+markers') %>%
  add_trace(y = ~ndep$Apartments, name = 'Apartments',color = I('gold'), type='bar', mode='lines+markers') %>%
  add_trace(y = ~ndep$Bus_Stop , name = 'Bus Stop', color = I('gray67'),type='bar', mode='lines+markers') %>%
  add_trace(y = ~ndep$`Street Lamp` , name = 'Street Lamp', color = I('forestgreen'),type='bar', mode='lines+markers') %>%
  add_trace(y = ~ndep$School, name = 'School', color = I('plum'),type='bar', mode='lines+markers') %>%
  add_trace(y = ~ndep$Pharmacy, name = 'Pharmacy', color = I('violetred'),type='bar', mode='lines+markers') %>%
  add_trace(y = ~ndep$Hospital , name = 'Hospital', color = I('linen'),type='bar', mode='lines+markers') %>%
  add_trace(y = ~ndep$`Place of Worship` , name = 'Place of Worship', color = I('skyblue'),type='bar', mode='lines+markers') %>%
  layout(title = "Nairobi OSM Features",
         #   xaxis = list(title = "Years"),
         yaxis = list(title ="Number of Feature"),
         legend = list(orientation='h', x=-0, y=-0.15))


b

ndep1 <- t(ndep)
ndep1 <- as.data.frame(ndep1)


Animals <- c("giraffes", "orangutans", "monkeys")
SF_Zoo <- c(20, 14, 23)
LA_Zoo <- c(12, 18, 29)
data1 <- data.frame(Animals, SF_Zoo, LA_Zoo)
View(data1)

o <- plot_ly(grouped, x = ~grouped$V1, y = ~grouped$V2, type = 'bar', name = '2008')
o


a <- plot_ly(grouped, x = ~grouped$V1, y = ~grouped$V3, type = 'bar', name = '2008')
subplot(o,a, nrows = 2, shareX = TRUE)

grouped <- as.data.frame(grouped)



-1/(215-1)
=-0.004672897

#z score = standard deviate 
#calculate it by:
#z = (moran i - expect) / variance
#test with: 
moran.test(manchester_join3$population, listw) #standard deviate = -1.5346
(-0.067395723 - -0.004672897) / sqrt(0.001670636) # #-1.5346 #formuala from geoda lectures and other online resources 

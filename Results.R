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





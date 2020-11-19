# Load libraries
library(ggplot2)
library(dplyr)
library(tidyr)

# Set working directory
setwd("D:/R-4.0.2/ESE5023_Assignments/Assignment_04")

#load data
pre_data <- read.csv(file = "precipitation.csv", header = T)
pre_data_tbl<-as_tibble(pre_data) %>% 
  mutate(Point = factor(location, ordered = TRUE),Date=as.Date(Date)) %>% 
  filter(flow!="NA")

#boxplot
ggplot(pre_data_tbl, aes(x =Point, y =flow, fill = Point)) +
  geom_boxplot() +
  theme_classic()+
  theme_bw()+
  theme(plot.title=element_text(size=10, face="bold"), 
        axis.text.x=element_text(size=10), 
        axis.text.y=element_text(size=10),
        axis.title.x=element_text(size=10),
        axis.title.y=element_text(size=10)) + 
  labs(title="flow of two points", 
       x="Station", y="m^3/s",fill='point name')

#time series
ggplot(pre_data_tbl,aes(x=Date,y=flow,color=Point))+
  geom_line()+
  theme_bw() +
  theme(plot.title=element_text(size=10, face="bold"), 
        axis.text.x=element_text(size=10), 
        axis.text.y=element_text(size=10),
        axis.title.x=element_text(size=10),
        axis.title.y=element_text(size=10)) + 
  scale_color_discrete(name="Point") +
  labs(title="flows" ,
       x="Year", y="(m^3/s)")+
  facet_wrap( ~ Point)


#histogram
pre_data_tbl %>% 
  filter(Point=='longmen') %>% 
  ggplot(aes(flow)) +
  geom_histogram(bins = 30) +
  theme_bw() +
  theme(plot.title=element_text(size=10, face="bold"), 
        axis.text.x=element_text(size=10), 
        axis.text.y=element_text(size=10),
        axis.title.x=element_text(size=10),
        axis.title.y=element_text(size=10)) + 
  labs(title="Histogram of flow in longmen", 
       x="(m^3/s)",y='Days')

#scatter plot
pre_data_tbl %>% 
  ggplot(aes(x=Date,y=flow,color=Point)) +
  geom_point() +
  theme_bw() +
  theme(plot.title=element_text(size=10, face="bold"), 
        axis.text.x=element_text(size=10), 
        axis.text.y=element_text(size=10),
        axis.title.x=element_text(size=10),
        axis.title.y=element_text(size=10)) +
  labs(title="scatter plot", 
       x="year",y="(m^3/s)")

#image plot
##I did not find an appropriate data set, 
#so I typed the example taught by the teacher in class
#As for image plot, I will try again in the future when 
#I meet the appropriate data set
library(fields)
library(maps)
library(RNetCDF)
ex.nc     <- open.nc("air.mon.ltm.nc")
print.nc(ex.nc)
Lat       <- var.get.nc(ex.nc, "lat")
Lon       <- var.get.nc(ex.nc, "lon")
Air_T     <- var.get.nc(ex.nc, "air") 
close.nc(ex.nc)
Lat <- rev(Lat)
Air_T_Jan <- array(NA,dim=c(length(Lon), length(Lat)))
for(row in 1:length(Lat)){
  Air_T_Jan[,row] <- Air_T[, (length(Lat)+1-row),1 ]
}
image.plot(Lon, Lat, Air_T_Jan)
par(mar=c(4.5,3,2,1))
image.plot(Lon, Lat, Air_T_Jan,
           horizontal=T, useRaster=T,
           legend.shrink=0.75, axis.args=list(cex.axis = 1.25), 
           legend.width=1, legend.mar=2,
           legend.args=list(text="Surface Temperature [degC]",cex=1.25),           
           xlab='',ylab='',midpoint=T, axes=F, ann=F
)
title(xlab="",cex.lab=1.25,font.lab=2)
axis(1,at=pretty(Lon),tck=-0.015,lwd=2,cex.axis=1.25,font=1)
title(ylab="",cex.lab=1.25,font.lab=2)
axis(2,at=pretty(Lat),tck=-0.015,lwd=2,cex.axis=1.25,font=1,las=1)
title(main=paste("Long term (1800-2020) mean surface temperature in Jan."),
      cex.main=1,font.main=2)
map('world',add=T,lwd=0.75,col="black")
box(lwd=2)
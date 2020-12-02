library("sp")
library("rgdal")
library("sf")
library("raster")
library("maps")
# Set working directory
setwd("F:/2020fall/R/ESE5023_Assignments/Assignment_05")
#load srad data
srad_jan <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_srad/wc2.1_2.5m_srad_01.tif")
srad_feb <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_srad/wc2.1_2.5m_srad_02.tif")
srad_mar <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_srad/wc2.1_2.5m_srad_03.tif")
srad_apr <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_srad/wc2.1_2.5m_srad_04.tif")
srad_may <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_srad/wc2.1_2.5m_srad_05.tif")
srad_jun <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_srad/wc2.1_2.5m_srad_06.tif")
srad_jul <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_srad/wc2.1_2.5m_srad_07.tif")
srad_aug <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_srad/wc2.1_2.5m_srad_08.tif")
srad_sep <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_srad/wc2.1_2.5m_srad_09.tif")
srad_oct <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_srad/wc2.1_2.5m_srad_10.tif")
srad_nov <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_srad/wc2.1_2.5m_srad_11.tif")
srad_dec <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_srad/wc2.1_2.5m_srad_12.tif")
srad_mean<-(srad_jan+srad_feb+srad_mar+srad_apr+srad_may+srad_jun+srad_jul+srad_aug+srad_sep+srad_oct+srad_nov+srad_dec)/12



#load pre data
pre_jan <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_prec/wc2.1_2.5m_prec_01.tif")
pre_feb <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_prec/wc2.1_2.5m_prec_02.tif")
pre_mar <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_prec/wc2.1_2.5m_prec_03.tif")
pre_apr <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_prec/wc2.1_2.5m_prec_04.tif")
pre_may <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_prec/wc2.1_2.5m_prec_05.tif")
pre_jun <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_prec/wc2.1_2.5m_prec_06.tif")
pre_jul <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_prec/wc2.1_2.5m_prec_07.tif")
pre_aug <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_prec/wc2.1_2.5m_prec_08.tif")
pre_sep <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_prec/wc2.1_2.5m_prec_09.tif")
pre_oct <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_prec/wc2.1_2.5m_prec_10.tif")
pre_nov <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_prec/wc2.1_2.5m_prec_11.tif")
pre_dec <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_prec/wc2.1_2.5m_prec_12.tif")
pre_mean<-(pre_jan+pre_feb+pre_mar+pre_apr+pre_may+pre_jun+pre_jul+pre_aug+pre_sep+pre_oct+pre_nov+pre_dec)/12



#load wind data
wind_jan <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_wind/wc2.1_2.5m_wind_01.tif")
wind_feb <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_wind/wc2.1_2.5m_wind_02.tif")
wind_mar <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_wind/wc2.1_2.5m_wind_03.tif")
wind_apr <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_wind/wc2.1_2.5m_wind_04.tif")
wind_may <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_wind/wc2.1_2.5m_wind_05.tif")
wind_jun <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_wind/wc2.1_2.5m_wind_06.tif")
wind_jul <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_wind/wc2.1_2.5m_wind_07.tif")
wind_aug <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_wind/wc2.1_2.5m_wind_08.tif")
wind_sep <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_wind/wc2.1_2.5m_wind_09.tif")
wind_oct <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_wind/wc2.1_2.5m_wind_10.tif")
wind_nov <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_wind/wc2.1_2.5m_wind_11.tif")
wind_dec <- raster("F://2020fall/R/ESE5023_Assignments/Assignment_05/wc2.1_2.5m_wind/wc2.1_2.5m_wind_12.tif")
wind_mean<-(wind_jan+wind_feb+wind_mar+wind_apr+wind_may+wind_jun+wind_jul+wind_aug+wind_sep+wind_oct+wind_nov+wind_dec)/12


China_map <- readOGR("F://2020fall/R/ESE5023_Assignments/Assignment_05/China_map", "bou2_4p") 
#wind
wind_china<-crop(wind_mean,China_map)
wind_china1 <- mask(wind_china,China_map,na.rm=T)
plot(wind_china1,  main="wind speed in china")
#prec
pre_china<-crop(pre_mean,China_map)
pre_china1 <- mask(pre_china,China_map,na.rm=T)
plot(pre_china1,  main="precipitation in china", col=col)
#srad
srad_china<-crop(srad_mean,China_map)
srad_china1 <- mask(srad_china,China_map,na.rm=T)
plot(srad_china1,  main="solar radiation in china", col=col)

# regions with relatively high wind speed
col <- terrain.colors(30)
plot(wind_china1,  main="wind speed in china")
contour(wind_china1, add=T, levels=seq(from=4, to=6, by=1),col="blue")
#西藏自治区可以作为合适的风力发电站建设地点。

# regions with relatively high solar radiation and low precipitation 
plot(pre_china1,  main="precipitation in china", col=col)
contour(pre_china1, add=T,levels=seq(from=0,to=20,by=10), col="red")
plot(srad_china1,  main="solar radiation in china", col=col)
contour(srad_china1, add=T,levels=seq(from=17000,to=18000,by=500), col="red")
#降水较低且太阳能辐射较高的区域为西藏南部地区，是合适的PV农场地点。

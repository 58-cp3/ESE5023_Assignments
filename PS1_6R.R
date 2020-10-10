Station_data <- read.csv(file = "2281305.csv", header = T)
Vis<-Station_data$VIS
Vis_data<-substr(Vis,1,6)
Vis_con<-substr(Vis,8,12)
Vis_data[which(Vis>=160000|Vis==999999)]<-NA

Vis_data2<-as.numeric(Vis_data)

Vis_con2<-Vis_data2[which(Vis_con=='1,N,1')]
time_hour<-Station_data$DATE[which(Vis_con=='1,N,1')]
time_hour_fac<-as.Date(time_hour)
plot(time_hour_fac,Vis_con2, lwd=0.1, type="l", col="red")

times<-substr(time_hour,1,4)
for (i in 2010:2013) {
  i2<-as.character(i)
  Vis_div<-Vis_con2[which(times==i2)]
  int1<-length(which(Vis_div<5000))
  int2<-length(which(Vis_div>=5000& Vis_div<10000))
  int3<-length(which(Vis_div>=10000& Vis_div<15000))
  int4<-length(which(Vis_div>=15000& Vis_div<20000))
  int5<-length(which(Vis_div>=20000& Vis_div<25000))
  int6<-length(which(Vis_div>=25000& Vis_div<30000))
  int7<-length(which(Vis_div>=30000))
  
  print(c('In the year ',as.character(i2)))
  print(c(int1,int2,int3,int4,int5,int6,int7))
  Vis_div_tokm<-Vis_div/1000
  dev.new()
  hist(Vis_div_tokm, breaks =8, xlab='Visibility(km)', 
       main = c("Hist of visibility in",as.character(i2)))
  
}
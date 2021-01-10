# Load libraries
library(ggplot2)
library(dplyr)
library(tidyr)
library(lubridate)
library(forecast)
library(tseries)
# Set working directory
setwd("F:/2020fall/R/final project")
#load data(baozhusi and tingzikou)
baozs<- read.csv(file = "bao_Ri.csv", header = T)
baozs_tbl <- as_tibble(baozs)
tingzk<- read.csv(file = "ting_Ri.csv", header = T)
tingzk_tbl <- as_tibble(tingzk)



###一定时期内的年内分配##宝珠寺
#1957-1966
period_1<-baozs_tbl %>%
  filter(year<1967) %>% 
  mutate(Rm=mean(Ri),Rsum=sum(Ri),Cv=((0.5*sum((Ri-Rm)^2))^0.5)/Rsum)
period_1_R<-period_1 %>% 
  group_by(month) %>% 
  summarise(Rm=mean(Ri)) %>% 
  mutate(period="1957-1966")
#1967-1976
period_2<-baozs_tbl %>%
  filter(year>1966&year<1977) %>% 
  mutate(Rm=mean(Ri),Rsum=sum(Ri),Cv=((0.5*sum((Ri-Rm)^2))^0.5)/Rsum)
period_2_R<-period_2 %>% 
  group_by(month) %>% 
  summarise(Rm=mean(Ri)) %>% 
  mutate(period="1967-1976")
#1977-1986
period_3<-baozs_tbl %>%
  filter(year>1976&year<1987) %>% 
  mutate(Rm=mean(Ri),Rsum=sum(Ri),Cv=((0.5*sum((Ri-Rm)^2))^0.5)/Rsum)
period_3_R<-period_3 %>% 
  group_by(month) %>% 
  summarise(Rm=mean(Ri)) %>% 
  mutate(period="1977-1986")
#1987-1996
period_4<-baozs_tbl %>%
  filter(year>1986&year<1997) %>% 
  mutate(Rm=mean(Ri),Rsum=sum(Ri),Cv=((0.5*sum((Ri-Rm)^2))^0.5)/Rsum)
period_4_R<-period_4 %>% 
  group_by(month) %>% 
  summarise(Rm=mean(Ri)) %>% 
  mutate(period="1987-1996")
#1997-2012
period_5<-baozs_tbl %>%
  filter(year>1996) %>% 
  mutate(Rm=mean(Ri),Rsum=sum(Ri),Cv=((0.5*sum((Ri-Rm)^2))^0.5)/Rsum)
period_5_R<-period_5 %>% 
  group_by(month) %>% 
  summarise(Rm=mean(Ri)) %>% 
  mutate(period="1997-2012")



##3#亭子口##亭子口
#1957-1966
period_t1<-tingzk_tbl %>%
  filter(year<1967) %>% 
  mutate(Rm=mean(Ri),Rsum=sum(Ri),Cv=((0.5*sum((Ri-Rm)^2))^0.5)/Rsum)
period_t1_R<-period_t1 %>% 
  group_by(month) %>% 
  summarise(Rm=mean(Ri)) %>% 
  mutate(period="1957-1966")
#1967-1976
period_t2<-tingzk_tbl %>%
  filter(year>1966&year<1977) %>% 
  mutate(Rm=mean(Ri),Rsum=sum(Ri),Cv=((0.5*sum((Ri-Rm)^2))^0.5)/Rsum)
period_t2_R<-period_t2 %>% 
  group_by(month) %>% 
  summarise(Rm=mean(Ri)) %>% 
  mutate(period="1967-1976")
#1977-1986
period_t3<-tingzk_tbl %>%
  filter(year>1976&year<1987) %>% 
  mutate(Rm=mean(Ri),Rsum=sum(Ri),Cv=((0.5*sum((Ri-Rm)^2))^0.5)/Rsum)
period_t3_R<-period_t3 %>% 
  group_by(month) %>% 
  summarise(Rm=mean(Ri)) %>% 
  mutate(period="1977-1986")
#1987-1996
period_t4<-tingzk_tbl %>%
  filter(year>1986&year<1997) %>% 
  mutate(Rm=mean(Ri),Rsum=sum(Ri),Cv=((0.5*sum((Ri-Rm)^2))^0.5)/Rsum)
period_t4_R<-period_t4 %>% 
  group_by(month) %>% 
  summarise(Rm=mean(Ri)) %>% 
  mutate(period="1987-1996")
#1997-2012
period_t5<-tingzk_tbl %>%
  filter(year>1996) %>% 
  mutate(Rm=mean(Ri),Rsum=sum(Ri),Cv=((0.5*sum((Ri-Rm)^2))^0.5)/Rsum)
period_t5_R<-period_t5 %>% 
  group_by(month) %>% 
  summarise(Rm=mean(Ri)) %>% 
  mutate(period="1997-2012")


##分时段月径流量绘制
baozs_period<-rbind(period_1_R,period_2_R,period_3_R,period_4_R,period_5_R) %>% 
  ggplot(aes(x=month,y=Rm,color=period))+
  geom_line()+
  geom_point()+
  scale_x_continuous(limits=c(0, 12), breaks=seq(0,12,1))+
  theme_bw()+
  labs( title="宝珠寺各时期年内分配特征",x="月份", y="月径流量/亿立方米") 
tingzk_period<-rbind(period_t1_R,period_t2_R,period_t3_R,period_t4_R,period_t5_R) %>% 
  ggplot(aes(x=month,y=Rm,color=period))+
  geom_point()+
  geom_line()+
  scale_x_continuous(limits=c(0, 12), breaks=seq(0,12,1))+
  theme_bw()+
  labs( title="亭子口各时期年内分配特征",x="月份", y="月径流量/亿立方米") 

##逐年Cv变化
baozs_Cv<-baozs_tbl %>% 
  group_by(year) %>% 
  summarise(Rm=mean(Ri),Rsum=sum(Ri),Cv=((0.5*sum((Ri-Rm)^2))^0.5)/Rsum) %>% 
  mutate(水库="宝珠寺")
tingzk_Cv<-tingzk_tbl %>% 
  group_by(year) %>% 
  summarise(Rm=mean(Ri),Rsum=sum(Ri),Cv=((0.5*sum((Ri-Rm)^2))^0.5)/Rsum) %>% 
  mutate(水库="亭子口")

###不同时期不均匀系数变化
Cv<-as.numeric(baozs_Cv$Cv)
year<-as.numeric(baozs_Cv$year)
fit1<-lm(Cv~year)
plot(baozs_Cv$year,baozs_Cv$Cv,type="o",xlab = "年份",ylab = "不均匀系数",main="宝珠寺水库逐年不均匀系数变化过程线")
abline(fit1, lwd = 2, col = "red")

Cv<-as.numeric(tingzk_Cv$Cv)
year<-as.numeric(tingzk_Cv$year)
fit2<-lm(Cv~year)
plot(tingzk_Cv$year,tingzk_Cv$Cv,type="o",xlab = "年份",ylab = "不均匀系数",main="亭子口水库逐年不均匀系数变化过程线")
abline(fit2, lwd = 2, col = "red")
plot1<-rbind(baozs_Cv,tingzk_Cv) %>% 
  ggplot(aes(x=year,y=Cv,color=水库))+
  geom_point()+
  geom_line()+
  theme_bw()+
  labs( title="1957-2012年宝珠寺和亭子口水库不均匀系数",x="年份", y="不均匀系数") 

#3##逐年实测径流量绘制 (宝珠寺)
baozs_tbl %>% 
  group_by(year) %>% 
  summarise(Ry=sum(Ri)) %>% 
  filter(year<1987) %>% 
  mutate(Ry_mean=mean(Ry)) %>% 
  mutate(year_period="1957~1985")->sec_1
baozs_tbl %>% 
  group_by(year) %>% 
  summarise(Ry=sum(Ri)) %>% 
  filter(year>1985) %>% 
  mutate(Ry_mean=mean(Ry)) %>% 
  mutate(year_period="1986~2012")->sec_2 
baozs_Ry<-rbind(sec_1,sec_2) %>% 
  ggplot(aes(x=year))+
  geom_point(aes(y=Ry,))+
  geom_line(aes(y=Ry, color=year_period))+
  geom_line(aes(y=Ry_mean,color=year_period))+
  theme_bw() +
  labs(title = "宝珠寺水库1957～2012年逐年年径流量变化过程线",
       x="nianfen",y="年径流量/亿立方米")
baozs_Ry


#3###333
#3##逐年实测径流量绘制 (亭子寺)
tingzk_tbl %>% 
  group_by(year) %>% 
  summarise(Ry=sum(Ri)) %>% 
  filter(year<1987) %>% 
  mutate(Ry_mean=mean(Ry)) %>% 
  mutate(year_period="1957~1985")->sec_t1
tingzk_tbl %>% 
  group_by(year) %>% 
  summarise(Ry=sum(Ri)) %>% 
  filter(year>1985) %>% 
  mutate(Ry_mean=mean(Ry)) %>% 
  mutate(year_period="1986~2012")->sec_t2 
tingzk_Ry<-rbind(sec_t1,sec_t2) %>% 
  ggplot(aes(x=year))+
  geom_point(aes(y=Ry,))+
  geom_line(aes(y=Ry, color=year_period))+
  geom_line(aes(y=Ry_mean,color=year_period))+
  theme_bw() +
  labs(title = "亭子口水库1957～2012年逐年年径流量变化过程线",
       x="nianfen",y="年径流量/亿立方米")
tingzk_Ry


  
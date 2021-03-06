library(tidyr)
library(dplyr)
library(ggplot2)
SZwind_data<-read.csv(file='2281305.csv',header = T)
class(SZwind_data)
SZwind_data_tbl<-as_tibble(SZwind_data)
SZwind_data_tbl %>% 
  mutate(wind_angle=as.numeric(substr(WND,1,3)),
         wind_dqc=substr(WND,5,5),
         wind_tcode=substr(WND,7,7),
         wind_speed=as.numeric(substr(WND,9,12)),
         wind_speedqc=substr(WND,14,14),
         Months=substr(DATE,1,7)) %>% 
  mutate(wind_angle_new=ifelse(wind_angle==999,'NA',wind_angle),
         wind_dqc_new=ifelse(wind_dqc=='3'|wind_dqc=='7','NA',wind_dqc),
         wind_tcode_new=ifelse(wind_tcode=='9','NA',wind_tcode),
         wind_speed_new=ifelse(wind_tcode==9999,'NA',wind_speed),
         #wind_Speed_new=as.numeric(wind_Speed_ne),
         wind_speedqc_new=ifelse(wind_speedqc=='3'|wind_speedqc=='7','NA',wind_speedqc)) %>% 
  select(Months,wind_speed_new)->SZ_windspeed

# @MingYANG : 
#  something wrong in your plot, try the following guide:
#  (1)use "select" to substract "WND" and "DATE" after "SZwind_data_tbl" being defined
#  (2)"mutate" means to create a new colum of data, if you want to select the qualified data %>%
#     use "filter" and "substr" like :" filter(substr(WND,1,3)!="999") "
#  (3) in that case, the code below can help you to select the qualified data:
#a_Data%>% 
#  select(WND,DATE) %>% 
#  filter(substr(WND,1,3)!="999") %>% 
#  filter(substr(WND,9,12)!="9999") %>% 
#  filter(substr(WND,5,7)=="1,N")%>%
#  filter(substr(WND,14,14)=="1")%>%
#  mutate(Month=as.character(paste0(substr(DATE,1,4),"-",substr(DATE,6,7)))) %>%
#  mutate(wind_speed=as.numeric(substr(WND,9,12)))%>%
#  select(Month,wind_speed) %>% 
#  the end

  SZ_windspeed %>%
    group_by(Months) %>% 
    summarise(Avearge_Months_windspeed=mean(wind_speed_new)) %>% 
    mutate(Months_day=paste(Months,'1',sep='-')) %>% 
    ggplot(aes(x=as.Date(Months_day),y=Avearge_Months_windspeed,group = 1))+
    geom_line()+
    xlab('year')+
    ylab('Average monthly wind speed')
  

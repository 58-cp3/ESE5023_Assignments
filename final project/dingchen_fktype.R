# Load libraries
library(ggplot2)
library(dplyr)
library(tidyr)
library(lubridate)
library(forecast)
library(tseries)
# Set working directory
setwd("F:/2020fall/R/final project")
#load data
bao_data<- read.csv(file = "bao.csv", header = T)
ting_data<- read.csv(file = "ting.csv", header = T)
bao_data_tbl <- as_tibble(bao_data)
ting_data_tbl <- as_tibble(ting_data)
bao_data_tbl<-bao_data_tbl  %>% 
  mutate(w_month=flow*30.4*24*3600/1000000000) %>% #计算出每月的总径流量
  group_by(year) %>%   
  summarise(m_year=sum(w_month)) %>% 
  mutate(year_mean=mean(m_year))  #每年的总径流量以及多年平均年径流量
ting_data_tbl<-ting_data_tbl  %>% 
  mutate(w_month=flow*30.4*24*3600/1000000000) %>% #计算出每月的总径流量
  group_by(year) %>%   
  summarise(m_year=sum(w_month)) %>% 
  mutate(year_mean=mean(m_year))  #每年的总径流量以及多年平均年径流量
#
#
#进行丰平枯水年划分（宝珠寺水库）
bao_data_tbl<-bao_data_tbl %>% 
  mutate(P=((m_year-year_mean)/year_mean*100))   #计算距百平分率P
bao_data_tbl %>% 
  filter(P>20 ) %>% 
  mutate(year_type="wet_year")->wet  #丰水年
bao_data_tbl %>% 
  filter(P>10&P<20) %>%
  mutate(year_type="p_wet_year")->p_wet  #偏丰水年
bao_data_tbl %>% 
  filter(P>-10&P<10) %>%
  mutate(year_type="mediant_year")->median  #平水年 
bao_data_tbl %>% 
  filter(P>-20&P<(-10)) %>%
  mutate(year_type="p_dry_year")->p_dry  #偏枯水年
bao_data_tbl %>% 
  filter(P<(-20)) %>%
  mutate(year_type="dry_year")->dry  #枯水年
bao_data_type<-rbind(dry,wet,median,p_wet,p_dry) %>% 
  arrange(year) 

###
#进行丰平枯水年划分（亭子口水库）
ting_data_tbl<-ting_data_tbl %>% 
  mutate(P=((m_year-year_mean)/year_mean*100))   #计算距百平分率P
ting_data_tbl %>% 
  filter(P>20 ) %>% 
  mutate(year_type="wet_year")->wet_t  #丰水年
ting_data_tbl %>% 
  filter(P>10&P<20) %>%
  mutate(year_type="p_wet_year")->p_wet_t  #偏丰水年
ting_data_tbl %>% 
  filter(P>-10&P<10) %>%
  mutate(year_type="mediant_year")->median_t  #平水年 
ting_data_tbl %>% 
  filter(P>-20&P<(-10)) %>%
  mutate(year_type="p_dry_year")->p_dry_t  #偏枯水年
ting_data_tbl %>% 
  filter(P<(-20)) %>%
  mutate(year_type="dry_year")->dry_t  #枯水年
ting_data_type<-rbind(dry_t,wet_t,median_t,p_wet_t,p_dry_t) %>% 
  arrange(year) 
#
#
#
#一些图形展示
#
#宝珠寺水库1957-2012年丰枯年份分布情况
bao_data_type %>% 
  ggplot(aes(x=year,y=m_year,fill=year_type))+
  geom_col()+
  theme_bw()+
  labs(title="宝珠寺水库丰、平、枯年份划分", x="年份", y="径流量")+
  facet_wrap( ~ year_type)
#亭子口寺水库1957-2012年丰枯年份分布情况
ting_data_type %>% 
  ggplot(aes(x=year,y=m_year,fill=year_type))+
  geom_col()+
  theme_bw()+
  labs(title="亭子口水库丰、平、枯年份划分", x="年份", y="径流量")+
  facet_wrap( ~ year_type)
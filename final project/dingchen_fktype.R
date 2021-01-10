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
  mutate(w_month=flow*30.4*24*3600/1000000000) %>% #�����ÿ�µ��ܾ�����
  group_by(year) %>%   
  summarise(m_year=sum(w_month)) %>% 
  mutate(year_mean=mean(m_year))  #ÿ����ܾ������Լ�����ƽ���꾶����
ting_data_tbl<-ting_data_tbl  %>% 
  mutate(w_month=flow*30.4*24*3600/1000000000) %>% #�����ÿ�µ��ܾ�����
  group_by(year) %>%   
  summarise(m_year=sum(w_month)) %>% 
  mutate(year_mean=mean(m_year))  #ÿ����ܾ������Լ�����ƽ���꾶����
#
#
#���з�ƽ��ˮ�껮�֣�������ˮ�⣩
bao_data_tbl<-bao_data_tbl %>% 
  mutate(P=((m_year-year_mean)/year_mean*100))   #������ƽ����P
bao_data_tbl %>% 
  filter(P>20 ) %>% 
  mutate(year_type="wet_year")->wet  #��ˮ��
bao_data_tbl %>% 
  filter(P>10&P<20) %>%
  mutate(year_type="p_wet_year")->p_wet  #ƫ��ˮ��
bao_data_tbl %>% 
  filter(P>-10&P<10) %>%
  mutate(year_type="mediant_year")->median  #ƽˮ�� 
bao_data_tbl %>% 
  filter(P>-20&P<(-10)) %>%
  mutate(year_type="p_dry_year")->p_dry  #ƫ��ˮ��
bao_data_tbl %>% 
  filter(P<(-20)) %>%
  mutate(year_type="dry_year")->dry  #��ˮ��
bao_data_type<-rbind(dry,wet,median,p_wet,p_dry) %>% 
  arrange(year) 

###
#���з�ƽ��ˮ�껮�֣�ͤ�ӿ�ˮ�⣩
ting_data_tbl<-ting_data_tbl %>% 
  mutate(P=((m_year-year_mean)/year_mean*100))   #������ƽ����P
ting_data_tbl %>% 
  filter(P>20 ) %>% 
  mutate(year_type="wet_year")->wet_t  #��ˮ��
ting_data_tbl %>% 
  filter(P>10&P<20) %>%
  mutate(year_type="p_wet_year")->p_wet_t  #ƫ��ˮ��
ting_data_tbl %>% 
  filter(P>-10&P<10) %>%
  mutate(year_type="mediant_year")->median_t  #ƽˮ�� 
ting_data_tbl %>% 
  filter(P>-20&P<(-10)) %>%
  mutate(year_type="p_dry_year")->p_dry_t  #ƫ��ˮ��
ting_data_tbl %>% 
  filter(P<(-20)) %>%
  mutate(year_type="dry_year")->dry_t  #��ˮ��
ting_data_type<-rbind(dry_t,wet_t,median_t,p_wet_t,p_dry_t) %>% 
  arrange(year) 
#
#
#
#һЩͼ��չʾ
#
#������ˮ��1957-2012������ݷֲ����
bao_data_type %>% 
  ggplot(aes(x=year,y=m_year,fill=year_type))+
  geom_col()+
  theme_bw()+
  labs(title="������ˮ��ᡢƽ������ݻ���", x="���", y="������")+
  facet_wrap( ~ year_type)
#ͤ�ӿ���ˮ��1957-2012������ݷֲ����
ting_data_type %>% 
  ggplot(aes(x=year,y=m_year,fill=year_type))+
  geom_col()+
  theme_bw()+
  labs(title="ͤ�ӿ�ˮ��ᡢƽ������ݻ���", x="���", y="������")+
  facet_wrap( ~ year_type)
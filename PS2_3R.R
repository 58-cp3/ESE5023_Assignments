library(tidyr)
library(dplyr)
library(ggplot2)
runoff_data <- read.csv(file = "baozhusi.csv", header = T)
runoff_data_tbl<-as_tibble(runoff_data)
runoff_data_tbl %>% 
  select(DATA,RUNOFF) %>% 
  filter(RUNOFF!=0) %>% 
  mutate(baozhu_time=as.Date(DATA),baozhu_runoff=as.numeric(RUNOFF)) %>% 
  ggplot(aes(x=baozhu_time,y=baozhu_runoff))+
  geom_line()


# Load libraries
library(ggplot2)
library(dplyr)
library(tidyr)

# Set working directory
setwd("D:/R-4.0.2/ESE5023_Assignments/PS3")
#3
zinc_data <- read.csv(file = "zinc.csv", header = T)
zinc_data_tbl<-as_tibble(zinc_data)
#mean,sd
zinc_data_tbl %>% 
  group_by(group) %>% 
  summarise(mean=mean(zinc,na.rm = TRUE),sd=sd(zinc,na.rm = TRUE))
#boxplot
zinc_data_tbl %>%
  group_by(group) %>% 
  ggplot(aes(x = group, y = zinc, fill =group)) +
  geom_boxplot() +
  theme_classic()
pre_nonv<-zinc_data_tbl %>% 
  filter(group=="Pregnant vegetarians")
pre_v<-zinc_data_tbl %>% 
  filter(group=="Pregnant nonvegetarians")
nonpre_v<-zinc_data_tbl %>% 
  filter(group=="Nonpregnant vegetarians")
#t.test
t.test(pre_nonv$zinc, pre_v$zinc)
t.test(pre_nonv$zinc, nonpre_v$zinc)
t.test(nonpre_v$zinc, pre_nonv$zinc)

# the boxplot shows that the zinc level of pregnant nonvegetarians
# is bigger than vegetarians. 
# then we use t-test,the results shows the p-values are all big than 0.5, 
# I think no obvious evidence can prove that 
# pregnant vegetarians tend to have lower zinc levels than pregnant nonvegetarians

# good work

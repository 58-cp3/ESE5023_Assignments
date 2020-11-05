# Load libraries
library(ggplot2)
library(dplyr)
library(tidyr)

# Set working directory
setwd("D:/R-4.0.2/ESE5023_Assignments/PS3")


baozhusi_data <- read.csv(file = "baozhusi.csv", header = T)
baozhusi_data_tbl<-as_tibble(baozhusi_data) 
baozhusi_data_tbl %>% 
  group_by(Year) %>% 
  ggplot(aes(x = Year, y = runoff, fill =Year)) +
  geom_boxplot() +
  theme_classic()

#7.1
abu_water_year<-baozhusi_data_tbl %>% 
  filter(Year=="abundant year")
aver_water_year<-baozhusi_data_tbl %>% 
  filter(Year=="average  year")
t.test(abu_water_year$runoff, aver_water_year$runoff)


#7.2
anova_one_way <- aov(runoff~ Year, data = baozhusi_data_tbl)
summary(anova_one_way)

#7.3
runoff_data <- read.csv(file = "twenty year.csv", header = T)
runoff_data_tbl<-as_tibble(runoff_data) 
model <- lm( Jan.runoff ~ Year, data=runoff_data_tbl )
summary(model)  

#the data used for 7.3 is the inflow of a hydropower station
#in january each year for 20 years.
#tested with a simple linear regression model ,the  R-squared is  0.009298 
# is far from 1,so the data does not have a clear linear relatonship.

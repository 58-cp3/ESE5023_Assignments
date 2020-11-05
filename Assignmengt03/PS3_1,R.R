# Load libraries
library(ggplot2)
library(dplyr)
library(tidyr)

# Set working directory
setwd("D:/R-4.0.2/ESE5023_Assignments")

# Load rainfall data
#1.1
rainfall_data    <- read.csv(file = "rainfall.csv", header = T)
rainfall_data_tbl <- as_tibble(rainfall_data)
#boxplot
boxplot(rainfall~cloud.seeding,data = rainfall_data_tbl)
#有云播种的天数降雨的值要大一些
#1.2
#one-way anova
anova_one_way <- aov(rainfall ~ cloud.seeding, data = rainfall_data_tbl)
summary(anova_one_way)
#p-value is 0.0511,可以认为在0.05的置信水平下无明显差异，
#如果置信水平为0.1，则认为有差异
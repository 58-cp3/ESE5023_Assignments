# Load libraries
library(ggplot2)
library(dplyr)
library(tidyr)

# Set working directory
setwd("D:/R-4.0.2/ESE5023_Assignments/PS3")

#5.1
hubble_data <- read.csv(file = "hubble_data.csv", header = T)
hubble_data_tbl<-as_tibble(hubble_data)
  plot( Distance ~ Velocity, data=hubble_data_tbl,
       ylab = "Distance",
       xlab = "Velocity",
       main = "Distance vs Velocity",
       pch = "+",
       cex = 2,
       col = "green")
## the distribution of points is very scattered, 
## but there is a linear trend overall.
#5.2
fit <- lm(Distance ~ Velocity, data=hubble_data_tbl)
summary(fit)
abline(fit, lwd = 5, col = "blue")
coef(fit)

#5.3
#make the intercept be zero(???)
fit_new<-lm(Distance-0.399098216 ~Velocity,data=hubble_data_tbl)
summary(fit_new)
abline(fit_new, lwd = 5, col = "black")
coef(fit_new)
age<-(fit_new$coefficients[2]*30.9/60/60/24/365)
print(paste(" the age of the universe is£º",age,"years old"))
##5.3when the universe was first created,the matter was dense,
# the relative speed is zero,so the velocity is zero,the intercept should be zero

##the slope represents the time for the universe to spread,
# the slope is the age of the universe.
#the age of the universe is£º 1.34524751530636e-09 years old


#5.4
#improved measurement of distance may lead to the intercept be zero,it is more proper
#we see that different Nlebula have the same Distance,so more accurate data of distance
#will lead to more precise estimates of the regression coefficients.

  
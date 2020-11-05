# Load libraries
library(ggplot2)
library(dplyr)
library(tidyr)

# Set working directory
setwd("D:/R-4.0.2/ESE5023_Assignments/PS3")
#4
lapse <- read.csv(file = "lapse.csv", header = T)
lapse_rate_tbl<-as_tibble(lapse) %>% 
  mutate(Elevation..km.=Elevation..m./1000) 
#scatter plot
plot(Temperature..degrees.C. ~ Elevation..km., data=lapse_rate_tbl,
     xlab = "Elevation",
     ylab = "Temperature",
     main = "Temperature vs Elevation",
     pch = "+",
     cex = 3,
     col = "blue")
#regression line
fit <- lm(Temperature..degrees.C. ~ Elevation..km., data=lapse_rate_tbl)
summary(fit)
abline(fit, lwd = 5, col = "yellow")
coef(fit)

## the lapse rate is 9.31,that is close to 9.8
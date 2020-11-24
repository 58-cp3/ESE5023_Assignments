# Load libraries
library(ggplot2)
library(dplyr)
library(tidyr)

# Set working directory
setwd("D:/R-4.0.2/ESE5023_Assignments/PS3")

#6.1
library(MASS)
library(leaps)
data(cpus)
str(cpus)
sample_index <- sample(nrow(cpus),nrow(cpus)*0.8)
cpus_train <- cpus[sample_index,]
cpus_test  <- cpus[-sample_index,]
subset_result <- regsubsets(perf~ syct+mmin+mmax+cach+chmin+chmax, data=cpus_train,
                            nbest=2, nvmax = 6)
plot(subset_result, scale="bic")

#6.2
model_cpus <- lm( perf ~ syct+mmin+mmax+cach+chmin+chmax, data=cpus_train )
cpus_predict <- predict(model_cpus,cpus_test)
plot(cpus_test$perf, cpus_predict)

#Relative mean bias
mean_bias<-(mean(cpus_predict) - mean(cpus_test$perf))/
  mean(cpus_test$perf)*100
print(paste("the mean bias between predicted perf value and provided perf values is",mean_bias,"%"))

# MingYANG noticed:
# "the mean bias" is more likely to be the following:
# unsing mean(test$perf - predict(model_1,test))
# the end

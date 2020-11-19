# Load libraries
library(ggplot2)
library(dplyr)
library(tidyr)
library(lubridate)
library(forecast)

# Set working directory
setwd("D:/R-4.0.2/ESE5023_Assignments/Assignment_04")
#load data
#1. Construct a time series
baoan_data<- read.csv(file = "2281305.csv", header = T,encoding = "UTF-8")
baoan_data_tbl <- as_tibble(baoan_data)
temp_data<-baoan_data_tbl %>% 
  mutate(temp = ifelse(substr(TMP,7,7) == "1" |substr(TMP,1,5) != '+9999',
                      as.numeric(substr(TMP,1,5))*0.1,NA)) %>%
  mutate(month = paste(substr(DATE,1,4),substr(DATE,6,7),sep = "")) %>% 
  filter(month >= 201001 & month <= 202008) %>%
  group_by(month) %>% 
  summarise(month_mean=mean(temp,na.rm = T)) %>% 
  pull()
temp_ts_data <- ts(temp_data, start=c(2010,1),end = c(2020,08) ,frequency=12)
plot(temp_ts_data, type="l")
str(temp_ts_data)

#2.Decompose the time series
temp_part_data <- decompose(temp_ts_data)
plot(temp_part_data)
error_data<-temp_part_data$random
Box.test(error_data,type='Ljung',lag=log(length(error_data)))
#p_value is 1.175e-05
#small than 0.05£¬so the error part follows a white noise distribution.

#3.Fit an ARIMA(p,d,q) model 
temp_ts_d<-diff(temp_ts_data)
plot(temp_ts_d)
acf(temp_ts_data)
pacf(temp_ts_data)
model <- auto.arima(temp_ts_data)
summary(model)

#4. Predict 
forecast_2months <- forecast(model, 2)
plot(forecast_2months)

#2020_9
forecast_2months$mean[1]
#80% confidence interval
forecast_2months$lower[1,1]
forecast_2months$upper[1,1]
#95% confidence interval
forecast_2months$lower[1,2]
forecast_2months$upper[1,2]

#2020-10
forecast_2months$mean[2]
#80% confidence interval
forecast_2months$lower[2,1]
forecast_2months$upper[2,1]
#95% confidence interval
forecast_2months$lower[2,2]
forecast_2months$upper[2,2]



runoff_data <- read.csv(file = "baozhusi.csv", header = T)
baozhusi_time       <- runoff_data$DATA
baozhusi_runoff       <- runoff_data$RUNOFF
head(baozhusi_time)
head(baozhusi_runoff)
baozhusi_runoff[which(baozhusi_runoff==9999)] <- NA
bao_time<-as.Date(baozhusi_time)
bao_runoff<-substr(baozhusi_runoff,1,5)
bao_runoff_value<-as.numeric(bao_runoff)
plot(bao_time, bao_runoff_value, lwd=0.5, type="l", col="blue")
min(bao_runoff_value)
max(bao_runoff_value)
median(bao_runoff_value)
mean(bao_runoff_value)
sd(bao_runoff_value)
var(bao_runoff_value)

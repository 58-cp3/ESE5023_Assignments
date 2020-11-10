library(tidyr)
library(dplyr)
library(ggplot2)
#1.1,1.2
Sig_data<-read.csv(file = "C:/Users/Administrator/Documents/signif.txt",header=TRUE,sep="\t")
Sig_Eqs <- as_tibble(Sig_data)
head(Sig_Eqs)
Sig_Eqs %>% 
  select(YEAR,COUNTRY,DEATHS) %>% 
  group_by(COUNTRY) %>%
  summarise(a=sum(DEATHS))->TOTALDEATHS
TOTALDEATHS %>% 
  arrange(desc(a))

#1.3
Sig_Eqs %>% 
  select(YEAR,EQ_PRIMARY) %>% 
  filter(EQ_PRIMARY>6.0) %>% 
  group_by(YEAR) %>% 
  summarise(EQ_NUMBER=n()) %>% 
  ggplot(aes(x=YEAR,y=EQ_NUMBER,color=YEAR))+
  geom_line()

##1.4
onecountry<-readline(prompt="Enter one country you want to observe:")
CountEq_LargestEq<-function(onecountry){
  Sig_Eqs %>% 
    filter(COUNTRY==onecountry& EQ_PRIMARY!='NA') %>% 
    mutate(Date=paste(YEAR,MONTH,DAY,sep = '-')) %>% 
    select(Date,EQ_PRIMARY) %>% 
    summarise(nums=n(),max_level_date=
                Date[which(EQ_PRIMARY==max(EQ_PRIMARY))])->monment
  monment_data<-unname(monment)
  return(monment_data)
}

Sig_Eqs %>% 
  filter(EQ_PRIMARY!='NA')->Sig_Eqs_values

i=1
NewMat<-matrix(ncol = 3,nrow = length(unique(Sig_Eqs_values$COUNTRY)))
for(CountryName in unique(Sig_Eqs_values$COUNTRY)){
  NewMat[i,]<-c(as.character(CountryName),
                as.numeric(CountEq_LargestEq(CountryName)[1,1]),
                as.character(CountEq_LargestEq(CountryName)[1,2]))
  i=i+1
}
#Sort in descending order by earthquake numbers.
NewMat_Order<-NewMat[order(as.numeric(NewMat[,2]),decreasing=T),]
NewMat_Order

# good work


 

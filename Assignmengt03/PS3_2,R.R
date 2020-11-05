# Load libraries
library(ggplot2)
library(dplyr)
library(tidyr)

# Set working directory
setwd("D:/R-4.0.2/ESE5023_Assignments/PS3")

#2

bone_oxygen <- read.csv(file = "bone_oxy.csv", header = T)
bone_oxygen_tbl<-as_tibble(bone_oxygen)
bone_oxygen_tbl%>%
  group_by(Bone) %>%
  summarise(
    count = n(),
    mean = mean(Oxygen.isotopic.composition, na.rm = TRUE),
    sd = sd(Oxygen.isotopic.composition, na.rm = TRUE)
  )
bone_oxygen_tbl %>%
  group_by(Bone) %>%
  ggplot(aes(x = Bone, y = Oxygen.isotopic.composition, fill = Bone)) +
  geom_boxplot() +
  theme_classic()
anova_one_way <- aov(Oxygen.isotopic.composition ~ Bone, data = bone_oxygen_tbl)
summary(anova_one_way)
#TukeyHSD(anova_one_way)

#p-value is 1.01e-06 is very small,so the means are different for different bones,
#the dataset support Tyrannosaurua Rex is not warm-blooded.


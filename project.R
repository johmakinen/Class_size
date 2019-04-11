
library(Ecdat)
library(dplyr)
library(ggplot2)
data(Star)

# Get Mathematics Scores and the classroom size from the whole data set.
df = Star[,c(1,3)]

#Split data into small and regular sized classrooms and get he math scores for both of them.
small = filter(df,classk == "small.class")$tmathssk
regular = filter(df, classk== "regular")$tmathssk

#Descriptive statistics of the math scores.

summary(small)
summary(regular)

sd(small)
sd(regular)

# Visualize the data



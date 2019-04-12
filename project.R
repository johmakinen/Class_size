
library(Ecdat)
library(dplyr)
library(ggplot2)
library(tseries)
data(Star)
head(Star)
# Get Mathematics Scores and the classroom size from the whole data set.
df = Star[,c(1,2,3)]

#Split data into small and regular sized classrooms and get he math scores for both of them.
small = filter(df,classk == "small.class")$tmathssk
regular = filter(df, classk== "regular")$tmathssk

head(small)
head(regular)
#Descriptive statistics of the math scores.

summary(small)
summary(regular)

sd(small)
sd(regular)
mad(small)
mad(regular)

# Visualize the data
par(mfrow=c(1,1))
boxplot(small,regular,names=c("Small","Regular"),ylab="Scaled mathematics test score")
par(mfrow=c(2,1))
hist(small,breaks=30)
hist(regular,breaks=30)

qqnorm(small,main="Q-Q-plot of small")
qqline(small)
qqnorm(regular,main="Q-Q-plot of regular")
qqline(regular)
#Not normal or symmetric but looks like equal distribution up to a location shift.

# Use Two-Sample rank test/ Wilcoxon rank-sum -test
# H0: m_small == m_regular
# H1: m_small != m_regular

wilcox.test(small,regular)
#ks.test(small,regular)

# p-value really small, reject H0.

shapiro.test(small)
shapiro.test(regular)
jarque.bera.test(small)
jarque.bera.test(regular)




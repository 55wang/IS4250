#Author: Wang Zhe, Wen Di
#Project: IS4250 Healthcare Analytics

library(pROC)
library(ResourceSelection)

#you may need change the path to read the csv file
setwd('/Users/wang/Desktop')
data = read.csv('project.csv')

#running logistic regression
mod <- glm(data$Z~data$Obstruction+data$RV+data$IVC, family="binomial")
summary(mod)
predpr <- predict(mod)

#plot roc curve
roccurve <- roc(data$Z ~ predpr)
plot(roccurve,legacy.axes=TRUE)

#running hosmer-lemeshow test
hoslem.test(mod$y, fitted(mod), g=10)


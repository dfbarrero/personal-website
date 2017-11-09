#!/usr/bin/Rscript --vanilla

library(rgp)
library(caTools)
library(plyr)

set.seed(1)

data <- read.csv("longley.csv", header=T)
data <- rename(data, c("Armed.Forces"="ArmedForces", "GNP.deflator"="GNPdeflator"))

data$Year <- as.numeric(data$Year)

sample = sample.split(rownames(data), SplitRatio = .75)
trainset = subset(data, sample == TRUE)
testset  = subset(data, sample == FALSE)

print(paste(nrow(data), "samples"))
print(paste("Train with", nrow(trainset), "samples; test with", nrow(testset), "samples"))

#mathFunctionSet = arithmeticFunctionSet
#numericConstantSet = constantFactorySet(function() rnorm(1))

print("--")
print(str(trainset))
print("--")
print(head(trainset))

result <- symbolicRegression(Unemployed ~ Population + GNP + Year + Employed,
                data=trainset,
                functionSet = functionSet("+", "*", "-"),
                stopCondition=makeStepsStopCondition(200))

print("Assessing result")

bestModel <- result$population[[which.min(sapply(result$population, result$fitnessFunction))]]
#worstModel <- result$population[[which.max(sapply(result$population, result$fitnessFunction))]]


#print(bestModel)
#print(str(bestModel))


testdata <- rgp:::predict.symbolicRegressionModel(bestModel, trainset, model="BEST")
print(str(testdata))

#print(wf)
#print(str(wf))

#print(paste("Best tree:", bf))

#print(paste("Worst tree:", wf))

#x11()
#plot(trainset$Year, trainset$Unemployed, col=1, type="l"); 
#points(predict(bestModel, newdata = testset), col=2, type="l")

while(1 != 0) {}

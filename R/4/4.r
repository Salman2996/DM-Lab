# install.packages("caret", dependencies = TRUE)
# install.packages("klaR", dependencies = TRUE)
# install.packages("party", dependencies = TRUE)

library("caret")
library("klaR")
library("party")
# use the iris dataset
data(iris)

# split data into train(67%) and test(33%) set
split = 0.67
trainIndex <- createDataPartition(iris$Species, p = split, list = FALSE)
trainData <- iris[trainIndex, ]
testData <- iris[-trainIndex, ]

x_test <- testData[, 1:4]
y_test <- testData[, 5]

# Naive Bayes classifier
# train using naive bayes
writeLines("\nNaive Bayes\n")
model <- NaiveBayes(Species~., data = trainData)
# visualizing
plot(model)

#make predictions
predictions <- predict(model, x_test)

# display confusion matrix with accuracy
confusionMatrix(predictions$class, y_test)

# Decision Tree
# construct decision tree
writeLines("\nDecision Tree\n")
irisTree <- ctree(Species~., data = trainData)

# plot the tree, visualizing
plot(irisTree)
plot(irisTree, type = "simple")

predictions2 <- predict(irisTree, x_test)
confusionMatrix(predictions2, y_test)
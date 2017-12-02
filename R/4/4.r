# install.packages("caret", dependencies = TRUE)
# install.packages("klaR", dependencies = TRUE)

# Naive Bayes classifier
library("caret")
library("klaR")
# use the iris dataset
data(iris)
# display first few entries
head(iris)

# split data into train(67%) and test(33%) set
split = 0.67
trainIndex <- createDataPartition(iris$Species, p = split, list = FALSE)
trainData <- iris[trainIndex, ]
testData <- iris[-trainIndex, ]

# train using naive bayes
model <- NaiveBayes(Species~., data = trainData)

#make predictions
x_test <- testData[, 1:4]
y_test <- testData[, 5]
predictions <- predict(model, x_test)

# display confusion matrix with accuracy
confusionMatrix(predictions$class, y_test)
# visualizing
plot(model)

# Decision Tree
library("party")
# construct decision tree
irisTree <- ctree(Species~., data = iris)
# print the tree summary
print(irisTree)
#plot the tree
# visualizing
plot(irisTree)
plot(irisTree, type = "simple")

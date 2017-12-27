library("caret")
# use the iris dataset
data(iris)

# split data into train(67%) and test(33%) set
split = 0.67
trainIndex <- createDataPartition(iris$Species, p = split, list = FALSE)
trainData <- iris[trainIndex, ]
testData <- iris[-trainIndex, ]

x_test <- testData[, 1:4]
y_test <- testData[, 5]

# create a simple linear regression model using lm()
fit <- lm(Sepal.Length~., data = trainData)

# display summary
summary(fit)

# visualize the results
# make predictions
predictions <- predict(fit, data = x_test)

rmse <- mean((iris$Sepal.Length - predictions)^2)
writeLines("\nRMSE:\n")
print(rmse)
#layout(matrix(c(1,2), 1, 2, byrow = TRUE))
plot(iris$Sepal.Length)
plot(predictions)

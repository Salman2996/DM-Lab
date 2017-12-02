# use the iris dataset
data(iris)

# create a simple linear regression model using lm()
fit <- lm(Sepal.Length~., data = iris)

# display summary
summary(fit)

# visualize the results
# make predictions
predictions <- predict(fit, data = iris)

rmse <- mean((iris$Sepal.Length - predictions)^2)
writeLines("\nRMSE:\n")
print(rmse)
#layout(matrix(c(1,2), 1, 2, byrow = TRUE))
plot(iris$Sepal.Length)
plot(predictions)

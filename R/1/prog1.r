# reading data from csv file (import)
x <- read.csv("titanic.csv",header=TRUE)

# # finding the number of survivors from the titanic and grouping them by their category
# aggregate(x$Survived, by=list(Category=x$PClass), FUN=sum)

# # create a subset of the people who survived
# sur <- subset(x, Survived == "1")

# # classify the subset based on sex
# male_sur <- subset(sur, Sex == "male")
# female_sur <- subset(sur, Sex == "female")

# # plot a histogram for frequency of survivors vs age for the male and female population
# hist(male_sur$Age,xlab = "Age",col = "green",border = "red", xlim = c(0,100), ylim = c(0,20), breaks = 100)

# hist(female_sur$Age,xlab = "Age",col = "green",border = "red", xlim = c(0,100), ylim = c(0,20), breaks = 100)

# write data into the csv file (export)
mydata <- data.frame(a = "6969","Salman",",69th",20,"male",1,0)
write.csv(mydata, "sample.csv", row.names = F)

# explore and visualize, second program
summary(data)
mean(data$Sepal.Length)
median(data$Sepal.Width)
range(data$Petal.Length)

hist(data$Sepal.Length)
plot(density(data$Sepal.Length))
table(data$Species)
pie(table(data$Petal.Width))

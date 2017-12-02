# install.packages("arules", dependencies = TRUE)
library("arules")

# read the transactions in the market basket format
x <- read.transactions("3.csv", format = "basket", sep = ",", cols = NULL)

# generate the rules using apriori algorithm
rules <- apriori(x,parameter = list(supp = 0.3, conf = 0.5, target = "rules"))

# display and plot the generatee d rules
inspect(rules)
plot(rules)
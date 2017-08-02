library(readr)
tree_data <- read_csv("C:/Users/nikhi/Desktop/prd.csv")
set.seed(13)
tree_data <- na.omit(tree_data)
tree_data
# Load the rpart, rtreele, rpart.plot and RColorBrewer package
library(rpart)
library(rpart.plot)
library(RColorBrewer)

#Shuffle the dataset, call the result shuffled
n <- nrow(tree_data)
shuffled_data <- tree_data[sample(n),]

# Split the data in train and test   

train_indices <- 1:round(0.7 * n)
train_data <- shuffled_data[train_indices, ]
test_indices <- (round(0.7 * n) + 1):n
test_data <- shuffled_data[test_indices, ]
names(train_data)
tree_tree <- rpart(TPCondition ~ DBH + SWDamageRating + RiskRating, train_data, method="class")
pred <- predict(tree_tree,test_data, type= "class")
prp(tree_tree,  box.palette="auto")
tb1 <- table(pred,test_data$TPCondition)
Accuracy <- sum(diag(tb1))/ sum(tb1)
Accuracy
tb1

library("tidyr")
library("dplyr")
library("stringr")
library("lubridate")
library("readr")




forest_inspection <- read_csv ("C:/Users/nikhi/Downloads/PDA_proj/Forest_data/Inspection.csv")
names(forest_inspection)
forest_inspection1 <- forest_inspection[,-c(8,9,11,12,14,15,16,18,20,21,22,23,27,28)]
names(forest_inspection1)
forest_inspection1$TreePointDBH <- as.numeric(forest_inspection1$TreePointDBH)
forest_inspection1$SWTreeConditionRating <- as.numeric(forest_inspection1$SWTreeConditionRating)
forest_inspection1$SWDamageRating <- as.numeric(forest_inspection1$SWDamageRating)
class(forest_inspection1$SWTreeConditionRating)
head(forest_inspection1$SWDamageRating)

write.csv(forest_inspection1, "Inspection1.csv")
write.csv(tree_points1, "Treepoint1.csv")

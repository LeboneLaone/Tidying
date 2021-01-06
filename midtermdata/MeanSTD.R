#Second Objective
 # Extract and store the column names from the previous step for convinience
colNames <- colnames(setAllInOne)

#Subsetting all the means and standard deviations, and their corresponding Activity and Subject IDs
mean_and_std = (grepl("activityId", ColNames) | grepl("subjectId" , colNames) | grepl("mean.." , colNames) | grepl("std.." , colNames))

#Creating a Dataset for the mean and standard deviations
setForMeanAndStd <- setAllInOne[ , mean_and_std == TRUE]

# To Answer the Third Objective
# Descriptive names to name activities in the dataset
setWithActivityNames = merge(setForMeanAndStd, activityLabels, by='activityId', all.x=TRUE)

####### Fourth objective's solution is evident in the setAllInOne and setForMeanAndStd Data Frames #######

#Fifth Objective
# Using the Aggregate Function to create the final set
TidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
TidySet <- TidySet[order(TidySet$subjectId, TidySet$activityId),]

## Write the TidySet to a text file
write.table(TidySet, "TidySet.txt", row.names = FALSE)

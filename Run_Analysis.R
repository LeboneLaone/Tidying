# Unzip downloaded dataSet to /data directory
unzip(zipfile="./data/Dataset.zip",exdir="./data")
unzip(zipfile="./midtermdata/Dataset.zip",exdir="./midtermdata")

# List the files in the data folder
list.files("./midtermdata")

#define the path where the new folder has been unziped and store the paths in placeholders
pathdata = file.path("./midtermdata", "UCI HAR Dataset")

#create a call function to list 28 file names unzipped
files = list.files(pathdata, recursive=TRUE)
#Print the files to the console
files



### Creating Data Frames from the downloaded files (Reading and storing)

#Reading training tables - xtrain / ytrain, subject train
xtrain = read.table(file.path(pathdata, "train", "X_train.txt"),header = FALSE)
ytrain = read.table(file.path(pathdata, "train", "y_train.txt"),header = FALSE)
subject_train = read.table(file.path(pathdata, "train", "subject_train.txt"),header = FALSE)

#Reading the testing tables
xtest = read.table(file.path(pathdata, "test", "X_test.txt"),header = FALSE)
ytest = read.table(file.path(pathdata, "test", "y_test.txt"),header = FALSE)
subject_test = read.table(file.path(pathdata, "test", "subject_test.txt"),header = FALSE)

#Read the features data
features = read.table(file.path(pathdata, "features.txt"),header = FALSE)

#Read activity labels data
activityLabels = read.table(file.path(pathdata, "activity_labels.txt"),header = FALSE)

#Creating Sanity and Column Values to the Train Data

colnames(xtrain) = features[,2]
colnames(ytrain) = "activityId"
colnames(subject_train) = "subjectId"

#Create Sanity and column values to the test data
colnames(xtest) = features[,2]
colnames(ytest) = "activityId"
colnames(subject_test) = "subjectId"

#Create sanity check for the activity labels value
colnames(activityLabels) <- c('activityId','activityType')

# Now to finally merge the test and train data frames

mrg_train = cbind(ytrain, subject_train, xtrain)
mrg_test = cbind(ytest, subject_test, xtest)

#Create the main data table merging both table tables
setAllInOne = rbind(mrg_train, mrg_test)


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

#Fifth Objective#
# Using the Aggregate Function to create the final set
TidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
TidySet <- TidySet[order(TidySet$subjectId, TidySet$activityId),]

## Write the TidySet to a text file
write.table(TidySet, "TidySet.txt", row.names = FALSE)
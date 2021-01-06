## Downloading dataset
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "./midtermdata/Dataset.zip")

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


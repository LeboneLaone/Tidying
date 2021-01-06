# Tidying

y_test, y_train and ‘features_info.txt’: Shows information about the variables used on the feature vector. 
* - ‘features.txt’: List of all features. 
* - ‘activity_labels.txt’: Links the class labels with their activity name. 
* - ‘train/X_train.txt’: Training set. 
* - ‘train/y_train.txt’: Training labels. 
* - ‘test/X_test.txt’: Test set. 
*- ‘test/y_test.txt’: Test labels

Analysis shows that you can categorize the data into 4 segments 
* training set 
* test set 
* features 
* activity labels

Inertial Signal data is not required. Additionally, features and activity label are more for tagging and descriptive than data sets.

The assignment objectives are completed in 3 part R Scripts:
1. 'mainsourcecode.R': Downloads the dataset then unzips it to the chosen local folder
2. 'Preparations.R'  : Reads the text files and stores data in data frames. Also merges the tables (First Objective)
3. 'MeanSTD.R'       : Tidies the data and answers Objectives 2-5

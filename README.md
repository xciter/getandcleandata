# getandcleandata
Getting and Cleaning Data Project

# Assignment
Create R script called run_analysis.R that does the following:

    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement.
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive activity names.
    5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Reproduction route

    Download the data source and put into a folder on your local drive and unzip it. You'll have a UCI HAR Dataset folder.
    Put run_analysis.R in the parent folder of UCI HAR Dataset, then set it as your working directory using setwd() function in RStudio.
    Run source("run_analysis.R"), then it will generate a new file tiny_data.txt in your working directory.
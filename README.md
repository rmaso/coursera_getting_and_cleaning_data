# Course Project - Getting and Cleaning Data

## Author

Rubén Masó

## Data Source

This project uses the "Human Activity Recognition Using Smartphones Dataset" 
downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Script Walkthrough

The run\_analysis.R script will perform the following steps:

* Require dplyr library 
* Reads training & test column files into respective x,y,s variables
* Reads feaure names and sets column/variable names respectively
* Appends the training and test data set rows
* Creates a unified data set (data frame)
* Extracts measurements on mean & standard deviation, for each measurement
* Sets activity names on the class labels
* Labels data with descriptive variable/column names by removing special characters in the column names and by replacing hyphen's with underscores in the column names
* Removes columns used only for tidying up the data set (intermediate calculations)
* Melts the data set (note this is why we require reshape2 library)
* Creates a second, independent, tidy data set which contains the average of each variable for each activity and subject
* Saves the resulting tidy data set to file ./data/TidyDataSet.txt


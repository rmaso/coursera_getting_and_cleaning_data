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
* Reads feaure names
* Reads activity names
* Reads training x,y,s variables
  * Labels data with descriptive variable/column names
  * Extracts measurements on mean & standard deviation, for each measurement
  * Sets activity names on the class labels
* Reads test x,y,s variables
  * Labels data with descriptive variable/column names
  * Extracts measurements on mean & standard deviation, for each measurement
  * Sets activity names on the class labels
* Appends the training and test data set rows
* Creates a unified data set (data frame)
* Creates a second, independent, tidy data set which contains the average of each variable for each activity and subject
* Saves the resulting tidy data set to file ./tidy\_data\_set.txt


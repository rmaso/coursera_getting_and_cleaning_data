# File-Name:       run_analysis.R           
# Date:            2015-09-21                                
# Author:          Rubén Masó
# Email:           ruben@maso.es
# Purpose:         
# Data Used:       Downloaded data from:
#                       * https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#                  I supponse the Samsung data is in your working directory.
# Packages Used:   dplyr
# Output File:     tidy_data_set.txt
# Data Output:     


# Load libraries
library(dplyr)

# Load features from the file features.txt
# and extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.csv('./features.txt', sep=' ', header=FALSE)
toProcess <- which(grepl('mean\\(\\)', features$V2) | grepl('std\\(\\)', features$V2))

# Load the activities from the file activity_labels.txt
activities <- read.csv('./activity_labels.txt', header=FALSE, sep=' ')
colnames(activities) <- c('idactivity', 'activity')

# Load all files from test set
x_test <- read.fwf('./test/X_test.txt', widths=rep(16, 561))
y_test <- read.csv('./test/y_test.txt', header=FALSE)
subject_test <- read.csv('./test/subject_test.txt', header=FALSE)

# Save the loaded data into R format
# save(x_test, y_test, subject_test, file='x_test.Rdata')
# load("./x_test.Rdata")

# Extracts only the measurements on the mean and standard deviation for each measurement. 
x_test <- x_test[,toProcess]

# Appropriately labels the data set with descriptive variable names from features file
colnames(x_test) <- features$V2[toProcess]

# Prepare the column Activity to use descriptive activity names to name the activities in the data set
colnames(y_test) <- c('idactivity')
y_test <- y_test %>% left_join(activities, by = 'idactivity')

# Prepare column Subject
colnames(subject_test) <- c('subject')

# Create the test data frame with all the information
test <- cbind(subject_test, y_test, x_test)

# Load all files from train set
x_train <- read.fwf('./train/X_train.txt', widths=rep(16, 561))
y_train <- read.csv('./train/y_train.txt', header=FALSE)
subject_train <- read.csv('./train/subject_train.txt', header=FALSE)

# Save the loaded data into R format
# save(x_train, y_train, subject_train, file='x_train.Rdata')
# load("./x_train.Rdata")

# Extracts only the measurements on the mean and standard deviation for each measurement. 
x_train <- x_train[,toProcess]

# Appropriately labels the data set with descriptive variable names from features file
colnames(x_train) <- features$V2[toProcess]

# Prepare the column Activity to use descriptive activity names to name the activities in the data set
colnames(y_train) <- c('idactivity')
y_train <- y_train %>% left_join(activities, by = 'idactivity')

# Prepare column Subject
colnames(subject_train) <- c('subject')

# Create the train data frame with all the information
train <- cbind(subject_train, y_train, x_train)

# Merges the training and the test sets to create one data set.
all <- rbind(train, test)

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data_set <- all %>% select(-idactivity) %>% group_by(activity, subject) %>% summarise_each(funs(mean))

# Save the data set into a txt file 
write.table(tidy_data_set, file="tidy_data_set.txt", row.name=FALSE)

# Coursera Data Sciences Track 
# Course Project : Getting and Cleaning Data : Online Course
# Data Location : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# Data Description : Human Activity Recognition Using Smart Phone Dataset Version 1.0
# 
require(reshape2)
library(reshape2)

# Download above file and extract in a directory.
# This will extract "UCI HAR Dataset" directory.
# setwd() to the UCI HAR Dataset directory as all the files loaded in this script are relative to
# that location

# read activity labels, extract activity_names
activity <- read.table("activity_labels.txt")
names(activity) <- c("activity_id", "activity_name")

# read feature names. These willbe column names of the test and train data
features <- read.table("features.txt")
feature_names <- features[,2]

################
# read test data
################
test_data <- read.table("test/X_test.txt")
# set feature names on test data
names(test_data) <- feature_names
# read test subjects
subject_test <- read.table("test/subject_test.txt")
# set the column name for subjects
names(subject_test) <- c("subject_id")
# read test activity ids
activity_test <- read.table("test/y_test.txt")
# set the column name for activity ids
names(activity_test) <- c("activity_id")
# create a test data.frame by col-binding subject, activity and test data
merged_test_data <- cbind(subject_test, activity_test, test_data)

#################
# read train data
#################
# read train data
train_data <- read.table("train/X_train.txt")
# set the column names
names(train_data) <- feature_names
# read training subject
subject_train <- read.table("train/subject_train.txt")
# set training subject column name
names(subject_train) <- c("subject_id")
# read training activity
activity_train <- read.table("train/y_train.txt")
# set training activity id
names(activity_train) <- c("activity_id")
# create a train data frame by col-binding training subject, training activity and train data 
merged_train_data <- cbind(subject_train, activity_train, train_data)

##
## merge test and train data
##
fully_merged_data <- rbind(merged_test_data, merged_train_data)

# find all mean column indices and mean column names 
# any column that has a substring mean or Mean
col_index_mean <- grep("[M|m]ean", names(fully_merged_data))
col_names_mean <- names(fully_merged_data)[col_index_mean]
# fina all std column indices and std column names
# any column that has a std substring in col name
col_index_std <- grep("std", names(fully_merged_data))
col_names_std <- names(fully_merged_data)[col_index_std]
# vector of all mean, std column names + subject_id, activity_id 
subset_col_names <- c("subject_id", "activity_id", col_names_mean, col_names_std)
# extract subset data frame containg mean and std columns 
subset_data <- fully_merged_data[,subset_col_names]
# make data frame descriptive by setting activity names corresponding to activity id
descr_data <- merge(activity, subset_data, by.x="activity_id", by.y="activity_id", all=TRUE) 
# melt the data to long format keeping activity_id, activity_name and subject_id
melted_dd <- melt(descr_data, id=c("activity_id", "activity_name", "subject_id"))
# dcast to get a mean of each variable indexed by activity_id + activity_name + subject_id
summary_result_data <- dcast(melted_dd, activity_id + activity_name + subject_id ~ variable, mean)
# save the results
write.table(summary_result_data, "summary_result.txt")

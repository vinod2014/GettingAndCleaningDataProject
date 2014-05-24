Getting And Cleaning Data : Project Assignment
========================================================

This project assignment is submitted as a part of Getting And Cleaning Data course. As a part of this project, dataset was obtained from the site referred below and certain data of interest was extracted, cleaned and merged.

## Dataset References
- Dataset : Human Activity Recognition Using Smart Phone Dataset [Version 1.0]
- Dataset Location : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
- Detailed Dataset Description : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Dataset features
- feature_info.txt : Describes all the features in the dataset and what they mean. Features of interest were all feature mean and std columns.
- features.txt : List of all the features (columns) in dataset. 

[Note: These features are not intentionly described here as they are already described in the accompanied files feature_info.txt, README.txt and features.txt included in the dataset archives.]

## Extracting, Cleaning and Merging Dataset
Following steps were taken to extract, clean and merge the data of interest.

- Dataset was downloaded (zip archive) from the location referred below and extrcated in a folder.
- Complete data was extracted from the archive.
- It contained test and train folders for test and train dataset.
- Each record (row) in test/X_test.txt and train/X_train.txt recorded values of features listed in feature.txt
- Each row in test/subject_test.txt and train/subject_train.txt records a subject in test and train dataset respectively for which test data was recorded (described in previous step)
- Each record (row) in test/y_test.txt and trains/y_train.txt records the actvity for the data was recorded on corresponding suject mentioned in previous step. 
- feature_info.txt in the dataset archive describes all the featuers in the dataset. Only feature mean and feature std (standard-deviation) columns were of interest for this project. Any column name that had "Mean" , "mean" or "std" as a substring in the name were selected in the data subset that was extracted from the source dataset.
- File activity_labels.txt provides descriptive names of the activities. Dataset was augmented with descriptive activity_name column.
- Further descriptive test and train were merged in full dataset.
- As a final step data was melted and casted to give average value of mean and std feature for subject and an activity.
- run_analysis.R scripts performs the above steps.
- Resulting merged and descriptive dataset was saved in summary_result.txt



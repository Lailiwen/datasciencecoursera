==================================================================
Getting and Cleaning Data Course Project
==================================================================

This document describes how the run_analysis R script works: 
======================================

Step 1:
=========================================
It reads in the following files saved in "UCI HAR Dataset" folder found in the designated working directory:
X_train.txt
y_train.txt
subject_train.txt
X_test.txt
y_test.txt
subject_test.txt
features.txt
activity_labels.txt

Step 2:
=========================================
(a) Assign labels found under "features" document to the names of the columns of the training and test datasets.
(b) Provide names to the columns found under "activityLabels" dataset

Step 3:
=========================================
Merge all the datasets appropriately into one master dataset.

Step 4:
=========================================
Generate a subset of columns with column names containing "activityID" or "subjectID" or "mean" or "std". 

Step 5:
=========================================
Create a new column/variable to name the activities in the subset.

Step 6:
=========================================
Rename the columns found in the subset with descriptive variable names.

Step 7:
=========================================
Creates a tidy data set with the average of each variable for each activity and each subject.

Step 8:
=========================================
Output the tidy dataset into a text file.


== END of FILE ==
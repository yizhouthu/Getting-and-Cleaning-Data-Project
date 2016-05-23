Getting and Cleaning Data - Course Project
==========================================
This repository contains the R script and documentation files for the course "Getting and Cleaning Data" on coursera.


## About the raw data
The raw dataset can be directly downloaded here: [Human Activity Recognition Using Smartphones](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

A full description is available at the site where the data was obtained: [Description of raw data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The raw data contains two sets: training set and test set. Each of the sets has data in the same format. The features (561 of them) are unlabeled and can be found in the x_test.txt. The activity labels are in the y_test.txt file. The test subjects are in the subject_test.txt file.

## Files
"average_data.txt" is the tidy data of average mean and standard deviation by activities and subjects after running the R script described below.

"run_analysis.R" is the R script that perform the analysis

"CodeBook.md" contains the description of variables, data and the tranformation process to clean the data

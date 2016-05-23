## About the raw data
* `X_train.txt`, `y_train.txt`, `X_test.txt`, `y_test.txt`, `subject_train.txt`, `subject_test.txt`, `activity_labels.txt` and `features.txt` contain the data from the downloaded files.
* You can find the full description of the raw data here: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Variables in the R script
* `xTrain`, `yTrain`, `subjectTrain`, `xTest`, `yTest` and `subjectTest` are directly extracted from the corresponding txt files of raw data
* `xData`, `yData` and `subjectData` are merged and renamed data from the training and test data sets
* `features` is directly extracted from `features.txt`, which contain the labels of columns of `xData`
* `meanAndStd` is a logical vector that contains true values for only mean and standard deviation related labels in `features`
* `activities` is directly extrated from `activity_labels.txt`, which contain the kinds of activities in `yData`
* `data` is the merged data of `xData`, `yData` and `subjectData`
* `averageData` is the desired data of average values of all means and standard deviations, for each subject and kind of activity

## Process to clean up
* Step 1: Use the function `rbind()` to bind the data from the two different sets (training and test).
* Step 2: Subset the columns of xData that refer to the mean and standard deviation, using key words `mean()` and `std()` to search the desired labels from `features`.
* Step 3: Use descriptive activity names to name the activities in the data set. Use the names in `activities` to replace numbers in `yData`, and use "activity" as the label of `yData`.
* Step 4: Assign names to `xData` and `subjectData`. For `xData`, use the labels in `features.txt`. For `subjectData`, use "subject" as the label of `subjectData`.
* Step 5: Calculate the average of desired columns using `ddply()` function.

# This script will work with the UCI HAR Dataset downloaded from
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

library(plyr)

# Step 1: Merge the training and test sets to create one data set

# Read the original data sets
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

xTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Merge the data sets
xData <- rbind(xTrain, xTest)
yData <- rbind(yTrain, yTest)
subjectData <- rbind(subjectTrain, subjectTest)

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.

# Read the features
features <- read.table("./UCI HAR Dataset/features.txt")

# Create a logical vector that contains TRUE values for mean and std
meanAndStd <- grep("-(mean|std)\\(\\)", features[, 2])

# Subset the columns of xData that refer to the mean and standard deviation
xData <- xData[, meanAndStd]

# Step 3: Uses descriptive activity names to name the activities in the data set

# Correct the names of activities in yData
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
yData[, 1] <- activities[yData[, 1], 2]
names(yData) <- "activity"


# Step 4: Appropriately label the data set with descriptive variable names

# Add names to xData, subjectData
names(xData) <- features[meanAndStd, 2]
names(subjectData) <- "subject"

# Merge all data
data <- cbind(subjectData, yData, xData)

# Step 5: Create a second, independent tidy data set with the average of each variable 
#         for each activity and each subject. 

# Calculate the averages of each subject and each activity
averageData <- ddply(data, .(subject, activity), function(x) colMeans(x[, 3:68]))

# Export the Data
write.table(averageData, "./UCI HAR Dataset/average_data.txt", row.names = FALSE)

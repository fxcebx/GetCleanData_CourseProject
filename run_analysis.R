## run_analysis.R
## Getting and Cleaning Data Coursera
## Course Project
## fxcebx
## 2014-11-22
##
# You should create one R script called run_analysis.R that does the following. 
# 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#
# Source data for this project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#

#### Load libraries -----------------------------------------------------------
library(plyr)

#### Set working directory ----------------------------------------------------
path <- getwd()
if (!is.null(path)) setwd(path)

#### 1. Merge Training and Test data sets ------------------------------------- 
# Experiment with 30 volunteers using Samsung Galaxy S II 

tmp1 <- read.table("train/X_train.txt")
tmp2 <- read.table("test/X_test.txt")
# A 561-feature vector with time and frequency domain variables
merged_X <- rbind(tmp1, tmp2)
# length(merged_X) # 561 columns
# nrow(merged_X)   # # 10299 rows

tmp1 <- read.table("train/y_train.txt")
tmp2 <- read.table("test/y_test.txt")
# The activity label 1..6
merged_Y <- rbind(tmp1, tmp2)

tmp1 <- read.table("train/subject_train.txt")
tmp2 <- read.table("test/subject_test.txt")
# An identifier of the subject who carried out the experiment ( 1..30)
merged_subject <- rbind(tmp1, tmp2)

#### 2. Extract mean and standard deviation for each measurement  -------------
# Read the feature list file
features <- read.table("features.txt")

# Find the mean and std columns
mean_col <- sapply(features[, 2], function(x) grepl("mean()", x, fixed=T))
std_col <- sapply(features[, 2], function(x) grepl("std()", x, fixed=T))

# Extract them from the data
merged_X_mean_std <- merged_X[, (mean_col | std_col)]      
# length(merged_X_mean_std) # 66 colums with "mean()" and "std()"
# nrow(merged_X_mean_std)   # 10299 rows
colnames(merged_X_mean_std) <- features[(mean_col | std_col), 2]

#### 3. Use descriptive activity names in data set  ---------------------------
# Read the activity_labels file
act_labels <- read.table("activity_labels.txt")
# act_labels
colnames(merged_Y) <- "activity"
# assign them manually
merged_Y$activity[merged_Y$activity == 1] = "WALKING"
merged_Y$activity[merged_Y$activity == 2] = "WALKING_UPSTAIRS"
merged_Y$activity[merged_Y$activity == 3] = "WALKING_DOWNSTAIRS"
merged_Y$activity[merged_Y$activity == 4] = "SITTING"
merged_Y$activity[merged_Y$activity == 5] = "STANDING"
merged_Y$activity[merged_Y$activity == 6] = "LAYING"

#### 4. Label the data set  ---------------------------------------------------
# all other columns already labeled
colnames(merged_subject) <- "subject"

# make complete dataframe
df <- cbind(merged_subject, merged_Y, merged_X_mean_std)

#### 5. Create tidy data set -------------------------------------------------- 
# create independent tidy data set with the average of each variable 
# for each activity and each subject
tidy <- ddply(df, .(subject, activity), function(x) colMeans(x[,3:ncol(df)]))

# Write tidy data set in a text file  
write.table(tidy, "tidy_data_set.txt", row.names=FALSE, sep=";")

 
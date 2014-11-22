### Introduction

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

### The raw data
Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Here are the [data for the project](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
 
Unzip the downloaded file, place run_analyis.R inside the folder /UCI HAR Dataset and set it as your R working directory.  
 
### The tidy data set
The R script called run_analysis.R that does the following. 

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step above, creates a second, independent tidy data set with the average of each variable for each activity and each subject and saves it as semicolon delimited txt file tidy_data_set.txt 

### The code book
* Information about the variables in the data set not contained in the tidy data 
* Information about the summary choices
* Information about the experimental study design used

can be found in the separate file CodeBook.md


### The instruction list/script
The R script run_analysis.R uses the plyr package.
The working directory needs to be set to the Source File Location. 

#### 1. Merge Training and Test data sets

From subdirectories /train and /test with read.table() a 561-feature vector with time and frequency domain variables is
read and binded together to 

    merged_X
This is also done for the activity label 1..6 and binded together to 

    merged_Y 
and for the two files containing an identifier of the subject who carried out the experiment (1..30 volunteers) and binded to     
 
    merged_subject

#### 2. Extract mean and standard deviation for each measurement

The feature list file features.txt is read in, containing all 561 column names for merged_X.

    mean_col
    
and
    
    std_col
are created with grepl() running across the second column of variable features searching for "mean()", "std()". 
These are used to subset for those columns containing the mean or standard deviation for each measurement.
The resulting 66 columns with "mean()" or "std()" in their column name are stored in

    merged_X_mean_std <- merged_X[, (mean_col | std_col)]     
 
I also set all column names for merged_X_mean_std

    colnames(merged_X_mean_std) <- features[(mean_col | std_col), 2]
    
#### 3. Use descriptive activity names in data set
Variable merged_Y contains the six activity labels that are given in file activity_labels.txt, and 1 to 6 correspond with

* 1 = "WALKING"
* 2 = "WALKING_UPSTAIRS"
* 3 = "WALKING_DOWNSTAIRS"
* 4 = "SITTING"
* 5 = "STANDING"
* 6 = "LAYING"

I have named the column "activity" and assigned the descriptive names on each row for variable merged_Y. 

#### 4. Label the data set
For variable merged_subject is the column name

    colnames(merged_subject) <- "subject"
    
Now all column names are labeled.

With

    df <- cbind(merged_subject, merged_Y, merged_X_mean_std)
   
   
all of the three merged variables are columnwise binded together to make the dataframe complete.

#### 5. Create tidy data set
I use the function ddply to split the dataframe df by the variables subject and activity, and calculate the average using colMeans()
for all columns starting from column 3 to the last column (the first two columns are subject and activity).

    tidy <- ddply(df, .(subject, activity), function(x) colMeans(x[,3:ncol(df)]))
    
The resulting dataframe tidy is stored in file tidy_data_set.txt with

    write.table(tidy, "tidy_data_set.txt", row.names=FALSE, sep=";")

without rownames in the working directory. The delimiter is a semicolon.
 
 

I use RStudio Version 0.98.1028 and

R version 3.1.1 (2014-07-10) -- "Sock it to Me"

Copyright (C) 2014 The R Foundation for Statistical Computing

Platform: x86_64-pc-linux-gnu (64-bit)
 

### Contributors

* fxcebx

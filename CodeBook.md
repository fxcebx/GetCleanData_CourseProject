### CodeBook for run_analysis.R 

* Information about the variables in the data set not contained in the tidy data 
* Information about the summary choices
* Information about the experimental study design used

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

The data can be downloaded in [data for the project](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
 
Unzip the downloaded file, place run_analyis.R inside the folder /UCI HAR Dataset and set it as your R working directory.  

### For each record it is provided

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### The dataset includes the following files


- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

### Notes 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.


### Information about Summary Choices

I labeled the single variable in "subject_train.txt"" and "subject_test.txt"" data as "subject" and the single variable in "y_train.txt"" and "y_test.txt"" data as "activity" after they were merged. The 6 levels 1..6 for activity are given the activity names from the file "activity_labels.txt". 

For the data sets "X_test.txt"" and "X_train.txt"", zhis data is then rowwise merged and stored in dataframe merged_X.

I subsetted the variable merged_X containing all 561 column names for those columns containing the mean or standard deviation for each measurement, resulting in 66 columns containing "mean()" or "std()" in their column name, I labeled the variables with the names given in the file "features.txt":

 [1] "tBodyAcc-mean()-X"          
 [2] "tBodyAcc-mean()-Y"          
 [3] "tBodyAcc-mean()-Z"          
 [4] "tBodyAcc-std()-X"           
 [5] "tBodyAcc-std()-Y"           
 [6] "tBodyAcc-std()-Z"           
 [7] "tGravityAcc-mean()-X"       
 [8] "tGravityAcc-mean()-Y"       
 [9] "tGravityAcc-mean()-Z"       
[10] "tGravityAcc-std()-X"        
[11] "tGravityAcc-std()-Y"        
[12] "tGravityAcc-std()-Z"        
[13] "tBodyAccJerk-mean()-X"      
[14] "tBodyAccJerk-mean()-Y"      
[15] "tBodyAccJerk-mean()-Z"      
[16] "tBodyAccJerk-std()-X"       
[17] "tBodyAccJerk-std()-Y"       
[18] "tBodyAccJerk-std()-Z"       
[19] "tBodyGyro-mean()-X"         
[20] "tBodyGyro-mean()-Y"         
[21] "tBodyGyro-mean()-Z"         
[22] "tBodyGyro-std()-X"          
[23] "tBodyGyro-std()-Y"          
[24] "tBodyGyro-std()-Z"          
[25] "tBodyGyroJerk-mean()-X"     
[26] "tBodyGyroJerk-mean()-Y"     
[27] "tBodyGyroJerk-mean()-Z"     
[28] "tBodyGyroJerk-std()-X"      
[29] "tBodyGyroJerk-std()-Y"      
[30] "tBodyGyroJerk-std()-Z"      
[31] "tBodyAccMag-mean()"         
[32] "tBodyAccMag-std()"          
[33] "tGravityAccMag-mean()"      
[34] "tGravityAccMag-std()"       
[35] "tBodyAccJerkMag-mean()"     
[36] "tBodyAccJerkMag-std()"      
[37] "tBodyGyroMag-mean()"        
[38] "tBodyGyroMag-std()"         
[39] "tBodyGyroJerkMag-mean()"    
[40] "tBodyGyroJerkMag-std()"     
[41] "fBodyAcc-mean()-X"          
[42] "fBodyAcc-mean()-Y"          
[43] "fBodyAcc-mean()-Z"          
[44] "fBodyAcc-std()-X"           
[45] "fBodyAcc-std()-Y"           
[46] "fBodyAcc-std()-Z"           
[47] "fBodyAccJerk-mean()-X"      
[48] "fBodyAccJerk-mean()-Y"      
[49] "fBodyAccJerk-mean()-Z"      
[50] "fBodyAccJerk-std()-X"       
[51] "fBodyAccJerk-std()-Y"       
[52] "fBodyAccJerk-std()-Z"       
[53] "fBodyGyro-mean()-X"         
[54] "fBodyGyro-mean()-Y"         
[55] "fBodyGyro-mean()-Z"         
[56] "fBodyGyro-std()-X"          
[57] "fBodyGyro-std()-Y"          
[58] "fBodyGyro-std()-Z"          
[59] "fBodyAccMag-mean()"         
[60] "fBodyAccMag-std()"          
[61] "fBodyBodyAccJerkMag-mean()" 
[62] "fBodyBodyAccJerkMag-std()"  
[63] "fBodyBodyGyroMag-mean()"    
[64] "fBodyBodyGyroMag-std()"     
[65] "fBodyBodyGyroJerkMag-mean()"
[66] "fBodyBodyGyroJerkMag-std()"


### Information about the experimental study design used

The tidy data set includes a total of 180 observations (the averaged 6 activities by activity name for each of the 30 volunteers). The number of columns in the tidy data set is 68, starting with "subject", "activity", and the 66 averaged measurement variables. 

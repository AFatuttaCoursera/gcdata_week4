---
title: "Getting and Cleaning Data Course Project"
author: "Andrea Fatutta"
date: "10 april 2017"
filename: CodeBook.md
---

##Introduction

The file will describe the data and the transformations that has been done in 
source file "run_analysis.R".

Original data has been downloaded from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" and has been uncompressed into a local folder called "dc_prj" created into the main working directory.


###Data description (from original document)
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

####References:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


##Process description

In this part I will follow the check list that has been provided in the assigment to briefly describe what is done in the correspondent part of the code of "run_analysis.R" file.


###1.Merges the training and the test sets to create one data set.

At first the data will be read into some variables and then merged together by content.
They are divided mainly in 3 parts:

1. Subject IDs
2. accelerometer/gyroscope data
3. activity IDs


###2.Extracts only the measurements on the mean and standard deviation for each measurement.

After the read phase, I'll extract only the mean and standard deviation information for each measurement from data in point 2. and will use the "features.txt" file to filter them appropriately.


###3.Uses descriptive activity names to name the activities in the data set

Using the "activity_labels.txt" file, I will assign to each activity in point 3. the correct label.


###4.Appropriately labels the data set with descriptive variable names.

Here I will use the feature names to label all the data I've extracted earlier and then I'll assign some readable names for the other sets.

Finally I'll merge the 3 datasets into one.

###5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In this section a new tidy dataset will be created, this set as requested in the assignment will contain the average of each variable that has been selected in the steps above.
Last step will create a file with this new data with the function "write.table"

###6.newTidySet description

subjectId : id of the subject
activityId : id of the activity
activityName : activity name - string

from here below the data is retrieved as the mean of the same variables presented in the original research, please refer to original documentation mentioned above.

tBodyAcc-mean()-X 
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z
tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z
tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z
tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z
tBodyGyro-std()-X
tBodyGyro-std()-Y
tBodyGyro-std()-Z
tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z
tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z
tBodyAccMag-mean()
tBodyAccMag-std()
tGravityAccMag-mean()
tGravityAccMag-std()
tBodyAccJerkMag-mean()
tBodyAccJerkMag-std()
tBodyGyroMag-mean()
tBodyGyroMag-std()
tBodyGyroJerkMag-mean()
tBodyGyroJerkMag-std()
fBodyAcc-mean()-X
fBodyAcc-mean()-Y
fBodyAcc-mean()-Z
fBodyAcc-std()-X
fBodyAcc-std()-Y
fBodyAcc-std()-Z
fBodyAccJerk-mean()-X
fBodyAccJerk-mean()-Y
fBodyAccJerk-mean()-Z
fBodyAccJerk-std()-X
fBodyAccJerk-std()-Y
fBodyAccJerk-std()-Z
fBodyGyro-mean()-X
fBodyGyro-mean()-Y
fBodyGyro-mean()-Z
fBodyGyro-std()-X
fBodyGyro-std()-Y
fBodyGyro-std()-Z
fBodyAccMag-mean()
fBodyAccMag-std()
fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag-std()
fBodyBodyGyroMag-mean()
fBodyBodyGyroMag-std()
fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-std()
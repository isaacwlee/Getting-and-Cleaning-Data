# Getting and Cleaning Data run_analysis.R Code Book

## Overview

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Details of the script

1. Read the subject test, subject train, x test, x train, y test, y train, features, and activity labels data from the downloaded zip file using the read.table() command.
2. Merge subject test with subject train, x test with x train, and y test with y train using the rbind() command.
3. Assign column headers merged Subject, X, and Y data sets.
4. Combine all data sets into single data set using cbind() command.
5. Take a subset of the complete data set by only taking rows with “-mean” or “-std” string existing in the features.
6. Assign activity labels using a ‘for loop’.
7. Rename feature variables by decoding abbreviations.
8. Create an output file that contains average of each activity per subject.

## Variables in the script
-subjectTest = subject_test.txt
-subjectTrain = subject_train.txt
-xTest = X_test.txt
-xTrain = X_train.txt
-yTest = Y_test.txt
-yTrain = Y_train.txt
-features = features.txt
-activityLabels = activity_labels.txt
-subjectAll = Merge subjectTest+subjectTrain
-xAll = Merge xTest+xTrain
-yAll = Merge yTest+yTrain
-complete = Merge subjectAll+xAll+yAll
-tidyComplete = Aggregated version of complete on average of features on each activity per subject
 



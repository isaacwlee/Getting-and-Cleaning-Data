# Getting and Cleaning Data

## Project Requirements

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the adata set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How to execute the script

1. Download the data for the project from the provided link (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Save the data onto current RStudio working directory
3. Execute the run_analysis.R code
4. Verify that tidyComplete.txt file has been created in the working directory

## Details of the script
1. Read the subject test, subject train, x test, x train, y test, y train, features, and activity labels data from the downloaded zip file using the read.table() command.
2. Merge subject test with subject train, x test with x train, and y test with y train using the rbind() command.
3. Assign column headers merged Subject, X, and Y data sets.
4. Combine all data sets into single data set using cbind() command.
5. Take a subset of the complete data set by only taking rows with “-mean” or “-std” string existing in the features.
6. Assign activity labels using a ‘for loop’.
7. Rename feature variables by decoding abbreviations.
8. Create an output file that contains average of each activity per subject.

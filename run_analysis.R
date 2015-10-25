## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
yTest <- read.table("./UCI HAR Dataset/test/Y_test.txt")
yTrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")


## 1. Merges the training and the test sets to create one data set.
subjectAll <- rbind(subjectTest, subjectTrain)
xAll <- rbind(xTest, xTrain)
yAll <- rbind(yTest, yTrain)

names(subjectAll) <- c("Subject")
names(xAll) <- features$V2
names(yAll) <- c("Activity")

complete <- cbind(subjectAll, yAll, xAll)


## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
MeanStd <- features$V2[grep("-mean\\(\\)|-std\\(\\)", features$V2)]
subCompleteNames <- c("Subject", "Activity", as.character(MeanStd))
complete <- subset(complete, select = subCompleteNames)


## 3. Uses descriptive activity names to name the activities in the data set
complete$Activity <- as.character(complete$Activity)
for (i in 1:6) {
  complete$Activity[complete$Activity == i] <- as.character(activityLabels[i,2])
}


## 4. Appropriately labels the data set with descriptive variable names. 
names(complete)<-gsub("^t", "Time", names(complete))
names(complete)<-gsub("^f", "Frequency", names(complete))
names(complete)<-gsub("Acc", "Accelerometer", names(complete))
names(complete)<-gsub("Gyro", "Gyroscope", names(complete))
names(complete)<-gsub("BodyBody", "Body", names(complete))
names(complete)<-gsub("Mag", "Magnitude", names(complete))


## 5. From the data set in step 4, creates a second, independent tidy data set 
##with the average of each variable for each activity and each subject.
complete$Subject <- as.factor(complete$Subject)
complete$Activity <- as.factor(complete$Activity)
complete <- data.table(complete)

tidyComplete <- aggregate(. ~Subject + Activity, complete, mean)
tidyComplete <- tidyComplete[order(tidyComplete$Subject,tidyComplete$Activity),]
write.table(tidyComplete, file = "tidyComplete.txt", row.names = FALSE)
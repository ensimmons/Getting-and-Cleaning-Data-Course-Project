# Getting and Cleaning Data -> Course Project

library(dplyr)

# PART I: Merging the training data and the testing data


# Obtain Data Column Names (same for train and test)
dataNames <- read.table("features.txt")
colnames(dataNames)[2] <- "Names"
dataColNames <- dataNames$Names


# Create Initial Training Data Set
trainSub <- read.table("subject_train.txt")
trainAct <- read.table("y_train.txt")
trainData <- read.table("X_train.txt")

colnames(trainSub)[1] <- "Subject"
colnames(trainAct)[1] <- "Activity"
colnames(trainData) <- dataColNames

Train_Data <- cbind(trainSub, trainAct, trainData)

remove(dataNames, trainSub, trainAct, trainData)


# Create Initial Testing Data Set
testSub <- read.table("subject_test.txt")
testAct <- read.table("y_test.txt")
testData <- read.table("X_test.txt")

colnames(testSub)[1] <- "Subject"
colnames(testAct)[1] <- "Activity"
colnames(testData) <- dataColNames

Test_Data <- cbind(testSub, testAct, testData)

remove(testSub, testAct, testData)


# CombineTraining and Testing Data Sets
All_Data <- rbind(Test_Data, Train_Data)

remove(dataColNames, Test_Data, Train_Data)


# PART II: Create a subset of only meas of mean and std

allColNames <- colnames(All_Data)
Sub_Data <- All_Data[grep("\\bmean\\b|[Ss]td|Subject|Activity", allColNames)]

# arrange by Subject and then Activity
Sub_Data <- arrange(Sub_Data, Subject, Activity)

remove(allColNames, All_Data)


# PART III: Descriptive Activity Names Applied

activityLabels<-read.table("activity_labels.txt")
colnames(activityLabels)[1]<-"ID"
colnames(activityLabels)[2]<-"Label"

Sub_Data$Activity <- activityLabels[,2][match(Sub_Data$Activity, activityLabels[,1])]

remove(activityLabels)

# Part IV: Descriptive Variable Names

colnames(Sub_Data) <- gsub("^t", "time_", colnames(Sub_Data))
colnames(Sub_Data) <- gsub("^f", "freq_", colnames(Sub_Data))

# Part V: Create a second subset from abov
#         with ave of each variable for each activity & each subject

Sub_Data_Means <- aggregate(Sub_Data[, 3:68], list(Subject=Sub_Data$Subject, Activity = Sub_Data$Activity), mean)

remove(Sub_Data)
#write.table(Sub_Data_Means, file = "Project_Final.txt", row.names = FALSE)
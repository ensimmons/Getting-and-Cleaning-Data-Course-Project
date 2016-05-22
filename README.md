# Getting-and-Cleaning-Data-Course-Project
Wearable Device Analysis

This README explains HOW the script "run_analysis.R" works. For details on the data itself please see CodeBookk.md

Initial project data from:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The R script "run_analysis.R" reads in:
A) Training Data:
   (i) "X_train.txt"  -> Actual Data for training subjects
   (ii) "y_train.txt" -> Assoc. Activity
   (iii) "subject_train.txt" -> Assoc. Subject ID
B) Test Data:
   (i) "X_test.txt"  -> Actual Data for test subjects
   (ii) "y_test.txt" -> Assoc. Activity
   (iii) "subject_test.txt" -> Assoc. Subject ID
C) Data Labels (same for each set) obtained from "features.txt"   
D) The activity Labels from "activity_labels.txt"

Part 1:
  Merge (using cbind) training data into one set (Subject, Activity, Data).
  Cleaned the table by giving good names to all columns.
  
  Merge (using cbind) test data into one set (Subject, Activity, Data).
  Cleaned the table by giving good names to all columns.
  
  Merege (using rbind) traing data and test data into one Test_Data set
  
Part 2:
  Created a subset of the data containing only the measurements mean and std (standard deviation)
  For a tidy data set, arranged resulting subset first by Subject, then by Activity
  
Part 3:
  Replaced the Activity Numbers with their respective names
  
Part 4:
  Slightly mondified variable names.
  (i) replaced t at beginning of some names with time_ (for time domain)
  (ii) replaced f at beginning of some names with freq_ (for the frequency domain)
  
Part 5:
  Created a subset of data from the table achieved after step 4 that contained the means (average values)
  of each variable for each activity and each subject.
  Option to save table (with row.name == False) is the last (commented out) line of code.
   

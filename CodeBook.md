### Variables
* Subject gives the subject ID number
* Activity gives the type of activity done, translated into actual actions
* All other variables are the averages of the same variable as in the original data set. For your convenience, their definitions are copied here:

"These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag"

### Data
The data set is tidy because each variable is a column and each row is an observation.
For each possible combination of subject and activity, we have exactly one row.
In each row, each column gives the average of the specified variable

### Transformations
1. Download, unzip and read in all relevant files (X_test, X_train, y_test, y_train, subject_test, subject_train, activity_labels)
2. Select columns that have "mean" or "std" in the column from X_test and X_train
3. Merge y_test and subject_test into X_test and merge y_train and subject_train into X_train
4. Merge X_test and X_train together as X_total
5. For each subject and each activity, take averages of each factor and report to tidy_table
6. Output result as tidy_table.txt

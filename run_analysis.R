# For more analysis, check out CodeBook.md

# Download files
#download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "data.zip", method = "curl")
#unzip("data.zip")

# Read in all relevant files
features <- read.table(file = "UCI HAR Dataset/features.txt")
activity_labels <- read.table(file = "UCI HAR Dataset/activity_labels.txt")
X_test <- read.table(file = "UCI HAR Dataset/test/X_test.txt", col.names = features$V2)
subject_test <- read.table(file = "UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
y_test <- read.table(file = "UCI HAR Dataset/test/y_test.txt", col.names = "Activity")
X_train <- read.table(file = "UCI HAR Dataset/train/X_train.txt", col.names = features$V2)
subject_train <- read.table(file = "UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
y_train <- read.table(file = "UCI HAR Dataset/train/y_train.txt", col.names = "Activity")

# Select relevant columns
X_test <- X_test[, grep("mean\\(\\)|std\\(\\)", features$V2)]
X_train <- X_train[, grep("mean\\(\\)|std\\(\\)", features$V2)]

# Merge into one giant data table
X_test <- cbind(X_test, subject_test, y_test)
X_train <- cbind(X_train, subject_train, y_train)
X_total <- rbind(X_test, X_train)

# Take averages by subject and activity
tidy_table <- aggregate(X_total, by = list(X_total$Subject, X_total$Activity), FUN = mean )

# Clean up columns
tidy_table$Subject <- NULL # Remove last 2 columns
tidy_table$Activity <- NULL
colnames(tidy_table)[1:2] <- c("Subject", "Activity") # Rename first two columns
tidy_table$Activity <- sapply(tidy_table$Activity, FUN = function(x) activity_labels[x, 2])
write.table(tidy_table, "tidy_table.csv", sep = ", ", row.names = FALSE)

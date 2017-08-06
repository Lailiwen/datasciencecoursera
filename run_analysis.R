### Getting and Cleaning Data Course Project ###

# 1. Merges the training and the test sets to create one data set.

# Reading in training files
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Reading in test files
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

####
features <- read.table('./UCI HAR Dataset/features.txt')
activityLabels = read.table('./UCI HAR Dataset/activity_labels.txt')

# Assigning column names
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityID"
colnames(subject_train) <- "subjectID"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityID"
colnames(subject_test) <- "subjectID"

colnames(activityLabels) <- c('activityID','activityType')

# Merging datasets
trainingData <- cbind(y_train, subject_train, x_train)
testData <- cbind(y_test, subject_test, x_test)
allData <- rbind(trainingData,testData)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
colNames <- colnames(allData)
mean_sd <- (grepl("activityID" , colNames) | 
            grepl("subjectID" , colNames) | 
            grepl("mean.." , colNames) | 
            grepl("std.." , colNames) 
)
subset <- allData[,mean_sd == TRUE]

# 3. Uses descriptive activity names to name the activities in the data set.
subset_named <- merge(subset, activityLabels,
                         by='activityID',
                         all.x=TRUE)

# 4. Appropriately labels the data set with descriptive variable names.
names(subset_named) <- gsub("Acc", "Acceleration", names(subset_named))
names(subset_named) <- gsub("^t", "Time", names(subset_named))
names(subset_named) <- gsub("^f", "Frequency", names(subset_named))
names(subset_named) <- gsub("BodyBody", "Body", names(subset_named))
names(subset_named) <- gsub("mean", "Mean", names(subset_named))
names(subset_named) <- gsub("std", "Std", names(subset_named))
names(subset_named) <- gsub("Mag", "Magnitude", names(subset_named))

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidyData<- aggregate(. ~subjectID + activityID + activityType, subset_named, mean)
tidyData <- tidyData[order(tidyData$subjectID, tidyData$activityID),]
write.table(tidyData,file="tidyData.txt",row.name=FALSE)
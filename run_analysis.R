# Load reshape2 library for melt and dcast methods
library(reshape2)

# Load activities names
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
activities <- activities[,-1]

# Load features names
features <- read.table("UCI HAR Dataset/features.txt")
features <- features[,-1]

# Load test and train data
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Rename columns
names(X_test) <- features
Y_test[,1] = activities[Y_test[,1]]
names(Y_test) <- "Activity"
names(subject_test) <- "Subject"
names(X_train) <- features
Y_train[,1] = activities[Y_train[,1]]
names(Y_train) <- "Activity"
names(subject_train) <- "Subject"

# Select columns with mean and standard deviation measurements
X_test <- X_test[,grepl("mean|std", features)]
X_train <- X_train[,grepl("mean|std", features)]

# Merge all data
data <- rbind(cbind(X_train, Y_train, subject_train), cbind(X_test, Y_test, subject_test))

# Creating tidy data set with mean for each feature
melt_data = melt(data, id = c("Subject", "Activity"), measure.vars = features[grepl("mean|std", features)])
tidy_data = dcast(melt_data, Subject + Activity ~ variable, mean)

# Write tidy data set to txt file
write.table(tidy_data, file = "tidy_data.txt", row.name=FALSE)
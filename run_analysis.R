###############################################################################
# STEP 1: Merges the training and the test sets to create one data set        #
###############################################################################

# We read the file contained in the train and test folders to create the new
# dataset:

train.data <- read.table("./train/X_train.txt")  # Train set
train.label <- read.table("./train/Y_train.txt")  # Labels for train set
train.subject  <- read.table("./train/subject_train.txt") # Ids for train

test.data <- read.table("./test/X_test.txt")  # Test set
test.label <- read.table("./test/Y_test.txt")  # Labels for test set
test.subject  <- read.table("./test/subject_test.txt") # Ids for test

# We combine the two datasets by rows for each possible pair of sets:

join.data <- rbind(train.data, test.data)
join.label <- rbind(train.label, test.label)
join.subject <- rbind(train.subject, test.subject)

################################################################################
# STEP 2: Extract only the measurements on the mean and standard deviation for #
# each measurement                                                             #
################################################################################

# In order to obtain the position of the mean and standard deviation variables 
# in the dataset, we read the names from the activity_labels.txt

features <- read.table("features.txt")

# We look for "mean" or "std":

meanStd.index <- grep("-(mean|std)\\(\\)", features[, 2])

# Subset the correct columns:

join.data <- join.data[, meanStd.index]

# Correction the name of the attributes:

names(join.data) <- gsub("\\(\\)", "", features[meanStd.index, 2]) # Remove "()"
names(join.data) <- gsub("mean", "Mean", names(join.data)) # Capitalize "mean"
names(join.data) <- gsub("std", "Std", names(join.data)) # capitalize "std"
names(join.data) <- gsub("-", "", names(join.data)) # remove "-" in column names

################################################################################
# STEP 3: Uses descriptive activity names to name the activities in the data   #
# set                                                                          #
################################################################################

# We obtain the descriptive name by reading the activity name associated with 
# each label in the activity_labels.txt file

activities <- read.table("activity_labels.txt")

# we remove the underscore symbol and capitalize only the second word if it 
# exists.

activities[, 2] <- (gsub("_", "", activities[, 2]))
activities[, 2] <- tolower(activities[, 2])
substr(activities[2, 2], 8, 8) <- toupper(substr(activities[2, 2], 8, 8))
substr(activities[3, 2], 8, 8) <- toupper(substr(activities[3, 2], 8, 8))

# We assign the names in the label set

join.label[, 1] <- activities[join.label[, 1],2]
names(join.label) <- "activity"

################################################################################
# STEP 4: Appropriately labels the data set with descriptive variable names.   #                                                                 #
################################################################################

# Correct column name:

names(join.subject) <- "subject"

# Combine all the data sets in the final data set:

data <- cbind(join.data, join.label, join.subject)

################################################################################
# STEP 5: From the data set in step 4, creates a second, independent tidy data #
# set with the average of each variable for each activity and each subject     #                                                                 #
################################################################################


library(plyr)

tidy.data <- ddply(data, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(tidy.data, "tidy_data.txt", row.names = FALSE)



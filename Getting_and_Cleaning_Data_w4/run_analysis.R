
## Read the train and test data sets separately and than merge the two. 
## each data set contains "n" observations (rows) of 561 variables (columns

## The variables/columns names of both the train and test data sets are stored in a separate file (features.txt). Also, two variables: "subject" performing 
## the activity (subject_train.txt or subject_test.txt) and the actual "activity" (y_train.txt or y_test.txt) are stored separate files and will need to be merged.


## store column/variables names from the features.txt into a table

variables <- read.table("features.txt",header = FALSE, nrows=561)

##get a list of the actual names from the read file (the read table created a data frame with two columns the first one have the row number the second on the actual name/variable)

variables <- dplyr::pull(variables, V2)

## read train data set, adding the the column/variable names
train_data <- read.table("X_train.txt", header = FALSE, col.names = variables, nrow = 7352)

## store the information on the subjects performing the measurements recorded in the X_train.txt in the data frame subject_train 

subject_train <- read.table("subject_train.txt", header = FALSE, col.names = "subject")

##store the information on the activities described by the measurements recorded in the X_train.txt in the data frame activity_train
##activities are described by a code: 1 through 6
activity_train <- read.table("y_train.txt", header = FALSE, col.names = "activity")

## create a data frame that contains the the key for the activity code in activity_train
activity_labels <- read.table("activity_labels.txt")


## read train data set, adding the the column/variable names
train_data <- read.table("X_train.txt", header = FALSE, col.names = variables, nrow = 7352)

## Add two columns one with the information on the subject performing each entry on the X_train.txt file and another with the activity being described by the vector/measurement 
## Columns will be added in position 1 and 2 (beginning of the table)
full_train <- data.frame(subject_train, activity_train, train_data)


##Repeat the same process for test data set, the variables are the same so the same data  frame can be used to add the columns names to test_data

## read test data set, adding the the column/variable names
test_data <- read.table("X_test.txt", header = FALSE, col.names = variables, nrow = 2947)

subject_test <- read.table("subject_test.txt", header = FALSE, col.names = "subject")

activity_test <- read.table("y_test.txt", header = FALSE, col.names = "activity")
## Add two columns one with the subject performing each entry on the X_test.txt file and another one with the activity being described by the vector/measurement 
## Columns will be added in position 1 and 2 (beginning of the table)
full_test <- data.frame(subject_test, activity_test, test_data)


##combine/merge the two data sets (train and test)
complete_data <-rbind(full_train, full_test)



##Convert the data frame with the complete data set to a tibble data frame (tbl_df) for easier data analysis called complete_data_2
complete_data_2 <- as_tibble(complete_data)

##extract only the variables that are mean or standard deviation measurement
##subsetting the data, keeping the information on the subject and the activity corresponding to the measurements
select_data_1 <- complete_data_2 %>% select(subject, activity, (contains("mean") | contains("std")))

##this subset (select_data_1) contains only 88 columns and 10299 rows (experiments), and contains all mean and std measurements 

## Replacing the activity codes by the actual names of the activities (in 3 steps)
## Step 1 : merge activity_labels
act_select_1 <- merge(activity_labels, select_data_1, by.x = "V1", by.y = "activity")

##Step 2: remove extra column added due to the merge
act_select_1 <- select(act_select_1, -1)

## Step 3: replace V2 with the activity name 
names(act_select_1)[names(act_select_1) == "V2"] <- "activity"

##act_select_1 is a data frame, with the selected variables of select_data_1 (mean and std), the activity being recorded as well as the subject performing the activity are included.
##Most variable names had already been associated by passing the name of the columns when the table was read. The table has 88 columns and 10299 rows (observations)



##Part 2 
## create a second independent tidy data set with the average of each variable for each activity and each subject.
## group the data fram by subject and activity and summarize the data by presenting the mean of each variable, mean_ is added to the variable/columns name to highlight that it now represents a mean of values

group_summarize <- act_select_1 %>% group_by(subject,activity) %>% summarize_at(vars("tBodyAcc.mean...X":"fBodyBodyGyroJerkMag.std.."), mean, na.rm = TRUE) %>% rename_at(vars("tBodyAcc.mean...X":"fBodyBodyGyroJerkMag.std.."), function(x) paste0("mean_",x))






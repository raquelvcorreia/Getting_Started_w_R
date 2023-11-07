# GettingAndCleaningData_week4

## Raw data is in the folder "UCI HAR Dataset" and it can be downloaded from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

## the script run.analysis.R reads the two datasets train and test separetly, and adds the columns/variables names, appends the activity and subject variable to the data the two complete datasets (including the subject and activity information) are stored in the full_train and full_test data frames respectively.

## These two data frames are merged in one data frame (complete_data) that contains the train dataset followed by the test data frame.

## complete_data was converted into a tibble data frame (tbl_df) to facilitate data analysis called complete_data_2


## A subset of the complete_data_2, with only the variables that are a mean or standard deviation, as well as the subject and activity, are stored in the data frame "act_select_1". This data frame, is a tidy data set with 88 columns/variables and 10299 rows/observation, where all variables have distinctive names and the activity numbers have been replaced by the actual activity names
# tidy_select_1.csv, is the csv version of act_select_1

## An additionally, in group_summarize, an additional anlysis was done where the act_select_1 data set was organized by subject and activity and the remaining variables summarized/collapsed using the average. The variable names were changed, by additng the prefix 'mean_' to reflect that the data present it the columns is now the average off the observations for that variable for each activity and each subject. 

# tidy_summarize.csv, is the csv version of group_summarize
# tidy_final.txt is the text file version of the data set in group_summarize and it was created with write.table() using row.name=FALSE

## write.csv was used to generate the csv's uploaded to this repository
## 

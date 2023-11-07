Week 4 Assignment CodeBook

Data used: Human Activity Recognition Using Smartphones Dataset Version 1.0
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
Data can be downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

Two data sets are used:

'X_train.txt': Training set.

'X_test.txt': Test set.


on both data sets each of observation/measurment is described by a 561-feature vector, meaning each row has 561 columns/variables


'features.txt' - contains a list with the names/features (561) beeing measure and corresponds to the names of variables being measured in X_train.txt and X_test.txt. 


The information on the activity being performed when each observation was recorded (note that the activity is being described by a number/class) is found on the following files
'y_train.txt': Training labels.

'y_test.txt': Test labels.

The activity class can be decoded using the following file:
'activity_labels.txt': Links the class labels with their activity name.




Analysis being performed by the script 'run.analysis.R' and the data frames and lists being created along the analysis:
'variables'
		List of variables' names. 
		A data frame created by reading the file 'freatures.txt', which contains descriptive names of the variables being recorded in train and test data sets. The list of names is than extracted and stored in the list variables, which has 561 entries.

'train_data' 
		A data frame created by reading the file X_train.txt, while being read the columns/variables are labeled using the list 'variables' that is passed as an argument of read.table
'subject_train'
		is a data frame created by reading the file 'subject_train.txt', it contains the information about the subject performing the activity being recorded, the name of the variable added ("subject")

'activity_train'
		a data frame created by reading the file 'y.train.txt', and the name of the column/variable being stored added ("activity")
		1 WALKING
		2 WALKING_UPSTAIRS
		3 WALKING_DOWNSTAIRS
		4 SITTING
		5 STANDING
		6 LAYING


'activity_labels'
		a data frame created by reading the file "activity_labels.txt", it contains the key between the activity codes in activity train and the actual activity being performed

'full_train'
		complete information on the train data set, it's a data frame with 563 columns/variables and 7352 rows/observations, it merges the three data.frames 'subject_train, activity_train and train_data in one data frame


'test_data' 
		A data frame created by reading the file X_train.txt, while being read the columns/variables are labeled using the list 'variables' that is passed as an argument of read.table
'subject_test'
		is a data frame created by reading the file 'subject_train.txt', it contains the information about the subject performing the activity being recorded, the name of the variable added ("subject")

'activity_test'
		a data frame created by reading the file 'y.test.txt', and the name of the column/variable being stored added ("activity")
		1 WALKING
		2 WALKING_UPSTAIRS
		3 WALKING_DOWNSTAIRS
		4 SITTING
		5 STANDING
		6 LAYING
		

'full_test'
		complete information on the train data set, it's a data frame with 563 columns/variables and 2947 rows/observations, it merges the three data.frames 'subject_test, activity_test and train_test in one data frame


'complete_data'
		a data frame that merges full_train and full_test into one data frame, full_test is added at the end of full_train

'complete_data_2'
		tibble data frame version of complete_data

'select_data_1'
		subset of complete_data_2, comprising only the variables/columns that contain a mean or std measurment, the variables corresponding to the subject and activity are also included.

'act_select_1'
		data frame "select_data_1", where the activity code is replaced by the name of the activity using the key stored in 'activity_labels'

'group_summarize'
		act_select_1 is grouped by subject and activity and all the variables are summarized by the means for each activity and subject. "mean_" is added to variable names for which an average is being presented (all variables with exception of subject and activity)



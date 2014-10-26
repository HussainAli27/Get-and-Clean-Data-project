#Final Data Set using run_analysis.R script
==========================
##Just Run the main function and it will return the required dataframe.

##The funtion script created the Data Frame in the following way:

###1. Merge: It merges the features data in the train(X_train) with the features data in the test (Y_train) folder. Doing it also requires to the merge the subject and activity data in these folders. After merging them these three data frames are combined in to one data frames.

###2. Extract: The data frame now has 563 columns(561 features + 1 subject column + 1 activity column). But we have to extract the first 2 (subject and activity) and other columns containing only the mean and std variables(79).

###3. The activities are defined in numbers from 1-6. replace these integers with characters based on the activity_labels.txt file placed in the main folded of the DATA.

###4. Change the Columns names(79) to character variables based on the features.txt file in the main folder of the DATA.

###5. Calculate the average on each column for each subject and each activity. This way the resultant data frame will have 6(activities)*30(subjects)=180 rows. Save this resultant data frame in a FinalDataset.txt file.




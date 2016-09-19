# The run_analysis .R does the following:
1. read training datasets
2. read test datasets
3. combine training and test datasets
4. read names for 561 feature and identify those ending with mean() or std()
5. keep columns of X corresponding to means and stds; the descriptive variable names are obtained from feature names after
 dropping () and replacing "-" by "_"
6. ead names for activities change labels in Y by activity names
7.combine X, Y, and subject to one dataset
8. calculate average for each variable for each activity/subject
9. Create a dataset in local drive.

The codebook.xlsx file describes the name, type, levels, labels and units of 68 variables. 

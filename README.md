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
Variable Number	Varible Name	Varible Type	Levels	Variable Labels	Units
1	 subject                   	Integer	1 to 30	People who attended this experiment, aged from 19-48	
2	  activity                  	Factor	Laying, Sitting, Standing, Walking, Walking upstairs, Walking downstairs	six activities in this experiment	
3	  tBodyAcc_mean()_X       	Numeric		Average of mean body acceleration signals in x direction	g (gravity of earth_>9.80665m/seg2)
4	  tBodyAcc_mean()_Y         	Numeric		Average of mean body acceleration signals in y direction	g (gravity of earth_>9.80665m/seg2)
5	  tBodyAcc_mean()_Z        	Numeric		Average of mean body acceleration signals in z direction	g (gravity of earth_>9.80665m/seg2)
6	  tBodyAcc_std()_X          	Numeric		Average of standard deviation of body acceleration signals in x direction	g (gravity of earth_>9.80665m/seg2)
7	  tBodyAcc_std()_Y           	Numeric		Average of standard deviation of body acceleration signals in y direction	g (gravity of earth_>9.80665m/seg2)
8	  tBodyAcc_std()_Z          	Numeric		Average of standard deviation of body acceleration signals in z direction	g (gravity of earth_>9.80665m/seg2)
9	  tGravityAcc_mean()_X      	Numeric		Average of mean gravity acceleration signals in x direction	g (gravity of earth_>9.80665m/seg2)
10	  tGravityAcc_mean()_Y      	Numeric		Average of mean gravity acceleration signals in y direction	g (gravity of earth_>9.80665m/seg2)
11	  tGravityAcc_mean()_Z     	Numeric		Average of mean gravity acceleration signals in z direction	g (gravity of earth_>9.80665m/seg2)
12	  tGravityAcc_std()_X      	Numeric		Average of standard deviation of gravity acceleration signals in x direction	g (gravity of earth_>9.80665m/seg2)
13	  tGravityAcc_std()_Y       	Numeric		Average of standard deviation of gravity acceleration signals in y direction	g (gravity of earth_>9.80665m/seg2)
14	  tGravityAcc_std()_Z       	Numeric		Average of standard deviation of gravity acceleration signals in z direction	g (gravity of earth_>9.80665m/seg2)
15	 tBodyAccJerk_mean()_X      	Numeric		Average of mean acceleration jerk signals in x dirsction	g (gravity of earth_>9.80665m/seg2)
16	  tBodyAccJerk_mean()_Y      	Numeric		Average of mean acceleration jerk signals in y dirsction	g (gravity of earth_>9.80665m/seg2)
17	 tBodyAccJerk_mean()_Z     	Numeric		Average of mean acceleration jerk signals in z dirsction	g (gravity of earth_>9.80665m/seg2)
18	 tBodyAccJerk_std()_X      	Numeric		Average of standard deviation of acceleration jerk signals in x dirsction	g (gravity of earth_>9.80665m/seg2)
19	  tBodyAccJerk_std()_Y     	Numeric		Average of standard deviation of acceleration jerk signals in y dirsction	g (gravity of earth_>9.80665m/seg2)
20	  tBodyAccJerk_std()_Z       	Numeric		Average of standard deviation of acceleration jerk signals in z dirsction	g (gravity of earth_>9.80665m/seg2)
21	  tBodyGyro_mean()_X      	Numeric		Average of mean gyroscope 3-axial raw signals in x direction	rad/seg
22	  tBodyGyro_mean()_Y         	Numeric		Average of mean gyroscope 3-axial raw signals in y direction	rad/seg
23	  tBodyGyro_mean()_Z      	Numeric		Average of mean gyroscope 3-axial raw signals in z direction	rad/seg
24	  tBodyGyro_std()_X         	Numeric		Average of standard deviation of gyroscope 3-axial raw signals in x direction	rad/seg
25	  tBodyGyro_std()_Y          	Numeric		Average of standard deviation of gyroscope 3-axial raw signals in y direction	rad/seg
26	  tBodyGyro_std()_Z          	Numeric		Average of standard deviation of gyroscope 3-axial raw signals in z direction	rad/seg
27	  tBodyGyroJerk_mean()_X    	Numeric		Average of mean gyroscope jerk signals in x dirsction	rad/seg
28	  tBodyGyroJerk_mean()_Y    	Numeric		Average of mean gyroscope jerk signals in y dirsction	rad/seg
29	  tBodyGyroJerk_mean()_Z    	Numeric		Average of mean gyroscope jerk signals in z dirsction	rad/seg
30	  tBodyGyroJerk_std()_X     	Numeric		Average of standard deviation of gyroscope jerk signals in x dirsction	rad/seg
31	  tBodyGyroJerk_std()_Y     	Numeric		Average of standard deviation of gyroscope jerk signals in y dirsction	rad/seg
32	  tBodyGyroJerk_std()_Z     	Numeric		Average of standard deviation of gyroscope jerk signals in z dirsction	rad/seg
33	  tBodyAccMag_mean()        	Numeric		Average of mean magnitude of acceleration signals	g (gravity of earth_>9.80665m/seg2)
34	  tBodyAccMag_std()        	Numeric		Average of standard deviation of magnitude of acceleration signals 	g (gravity of earth_>9.80665m/seg2)
35	  tGravityAccMag_mean()      	Numeric		Average of mean magnitude of gravity signals 	g (gravity of earth_>9.80665m/seg2)
36	  tGravityAccMag_std()      	Numeric		Average of standard deviation of magnitude of gravity signals	g (gravity of earth_>9.80665m/seg2)
37	  tBodyAccJerkMag_mean()    	Numeric		Average of mean  magnitude of acceleration jerk signals	g (gravity of earth_>9.80665m/seg2)
38	  tBodyAccJerkMag_std()      	Numeric		Average of standard deviation of magnitude of acceleration jerk signals	g (gravity of earth_>9.80665m/seg2)
39	  tBodyGyroMag_mean()        	Numeric		Average of mean magnitude of gyroscope signals	rad/seg
40	  tBodyGyroMag_std()        	Numeric		Average of standard deviation of magnitude of gyroscope signals	rad/seg
41	  tBodyGyroJerkMag_mean()   	Numeric		Average of mean magnitude of gyroscope jerk signals	rad/seg
42	  tBodyGyroJerkMag_std()    	Numeric		Average of standard deviation of  magnitude of gyroscope jerk signals	rad/seg
43	  fBodyAcc_mean()_X         	Numeric		Average of mean FFT acceleration signals in x direction	g (gravity of earth_>9.80665m/seg2)
44	  fBodyAcc_mean()_Y         	Numeric		Average of mean FFT acceleration signals in y direction	g (gravity of earth_>9.80665m/seg2)
45	  fBodyAcc_mean()_Z        	Numeric		Average of mean FFT acceleration signals in z direction	g (gravity of earth_>9.80665m/seg2)
46	 fBodyAcc_std()_X         	Numeric		Average of standard deviation of  FFT acceleration signals in x direction	g (gravity of earth_>9.80665m/seg2)
47	 fBodyAcc_std()_Y         	Numeric		Average of standard deviation of  FFT acceleration signals in y direction	g (gravity of earth_>9.80665m/seg2)
48	 fBodyAcc_std()_Z          	Numeric		Average of standard deviation of  FFT acceleration signals in z direction	g (gravity of earth_>9.80665m/seg2)
49	 fBodyAccJerk_mean()_X   	Numeric		Average of mean FFT acceleration jerk signals in x direction	g (gravity of earth_>9.80665m/seg2)
50	 fBodyAccJerk_mean()_Y    	Numeric		Average of mean FFT acceleration jerk signals in y direction	g (gravity of earth_>9.80665m/seg2)
51	 fBodyAccJerk_mean()_Z      	Numeric		Average of mean FFT acceleration jerk signals in z direction	g (gravity of earth_>9.80665m/seg2)
52	 fBodyAccJerk_std()_X       	Numeric		Average of standard deviation of  FFT acceleration jerk signals in x direction	g (gravity of earth_>9.80665m/seg2)
53	 fBodyAccJerk_std()_Y      	Numeric		Average of standard deviation of  FFT acceleration jerk signals in y direction	g (gravity of earth_>9.80665m/seg2)
54	 fBodyAccJerk_std()_Z       	Numeric		Average of standard deviation of  FFT acceleration jerk signals in z direction	g (gravity of earth_>9.80665m/seg2)
55	 fBodyGyro_mean()_X         	Numeric		Average of mean FFT gyroscope signals in x direction	rad/seg
56	 fBodyGyro_mean()_Y       	Numeric		Average of mean FFT gyroscope signals in y direction	rad/seg
57	fBodyGyro_mean()_Z       	Numeric		Average of mean FFT gyroscope signals in z direction	rad/seg
58	  fBodyGyro_std()_X         	Numeric		Average of standard deviation of  FFT gyroscope signals in x direction	rad/seg
59	 fBodyGyro_std()_Y        	Numeric		Average of standard deviation of  FFT gyroscope signals in y direction	rad/seg
60	  fBodyGyro_std()_Z         	Numeric		Average of standard deviation of  FFT gyroscope signals in z direction	rad/seg
61	  fBodyAccMag_mean()       	Numeric		Average of mean FFT magnitude acceleration signals 	g (gravity of earth_>9.80665m/seg2)
62	  fBodyAccMag_std()         	Numeric		Average of standard deviation of  FFT magnitude acceleration signals	g (gravity of earth_>9.80665m/seg2)
63	  fBodyBodyAccJerkMag_mean()	Numeric		Average of mean FFT magnitude acceleration jerk signals 	g (gravity of earth_>9.80665m/seg2)
64	 fBodyBodyAccJerkMag_std() 	Numeric		Average of standard deviation of FFT magnitude acceleration jerk signals 	g (gravity of earth_>9.80665m/seg2)
65	  fBodyBodyGyroMag_mean()   	Numeric		Average of mean FFT magnitude gyroscope signals 	rad/seg
66	  fBodyBodyGyroMag_std()    	Numeric		Average of standard deviation  FFT magnitude gyroscope signals 	rad/seg
67	 fBodyBodyGyroJerkMag_mean()	Numeric		Average of mean FFT magnitude gyroscope jerk signals 	rad/seg
68	 fBodyBodyGyroJerkMag_std() 	Numeric		Average of standard deviaiton FFT magnitude gyroscope jerk signals 	rad/seg

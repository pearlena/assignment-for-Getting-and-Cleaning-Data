rm(list = ls());

## read training datasets
Xtrain = read.table('train/X_train.txt', header = FALSE);
Ytrain = read.table('train/Y_train.txt', header = FALSE);
Strain = read.table('train/subject_train.txt', header = FALSE);

## read test datasets
Xtest = read.table('test/X_test.txt', header = FALSE);
Ytest = read.table('test/Y_test.txt', header = FALSE);
Stest = read.table('test/subject_test.txt', header = FALSE);

## combine training and test datasets
X = rbind(Xtrain, Xtest);
Y = rbind(Ytrain, Ytest);
S = rbind(Strain, Stest);

## read names for 561 features
## and identify those ending with mean() or std()
feature = read.table('features.txt', header = FALSE, as.is = TRUE);
index = sort(c(grep("mean()", feature[, 2], fixed = TRUE), 
               grep("std()", feature[, 2], fixed = TRUE)));

## keep columns of X corresponding to means and stds
## the descriptive variable names are obtained from feature names after
## dropping () and replacing "-" by "_"
X_extract = X[, index];
xnames = gsub('-', '_', feature[index, 2]);
xnames = gsub('\\(\\)', '', xnames);
names(X_extract) = xnames;

## read names for activities
## change labels in Y by activity names
activity_labels = read.table('activity_labels.txt', header = FALSE, as.is = TRUE);
Y_updated = data.frame(activity = activity_labels$V2[Y$V1]);

## combine X, Y, and subject to one dataset
names(S) = 'subject'
mydata = cbind(S, Y_updated, X_extract)
head(mydata)

## calculate average for each variable for each activity/subject.
mydata_ave = aggregate(mydata[, -c(1, 2)], 
                       list(subject = mydata$subject, activity = mydata$activity), 
                       mean);



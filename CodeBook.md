## Code Doc

* load data set X_train and X_test, then vertically merge as a dataset X.
* load data set subject_train and subject_test, then vertically merge as a dataset subject.
* load data set y_train and y_test, then vertically merge as a dataset y.
* load data set features and find the mean and standard deviation for each measurement, then use it to extract needed columns of data set X with column labels.
* load data set activity_labels, and use its descriptive activity names and data set y's activity id to generate a new data set activity.
* horizontally merge dataset subject, activity, X to a new data set data.
* melt dataset data by specifying activity, subject as the only ID variables.
* Cast the molten data frame with activity and subject as the only IDs and mean as the aggregation function.
* save the new independent tidy data set. 

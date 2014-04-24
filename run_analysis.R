library(reshape2)

gen_varname <- function(varname) {
    varname <- gsub("_","",varname)
	varname <- gsub("\\s","",varname)
	varname <- gsub("\\.","",varname)
	varname <- gsub('\\(|\\)',"",varname)
	varname <- tolower(varname)
}

run_analysis <- function(fname) {
	# 1. Merges the training and the test sets to create one data set.
	X_train <- read.table("train/X_train.txt")
	X_test <- read.table("test/X_test.txt")
	X <- rbind(X_train, X_test)

	subject_train <- read.table("train/subject_train.txt")
	subject_test <- read.table("test/subject_test.txt")
	subject <- rbind(subject_train, subject_test)

	y_train <- read.table("train/y_train.txt")
	y_test <- read.table("test/y_test.txt")
	y <- rbind(y_train, y_test)

	# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
	features <- read.table("features.txt")[,2]
	used <- grep("-(mean|std)\\(\\)", features)
	X <- X[, used]
	used_features <- features[used]
	names(X) <- gen_varname(used_features)

	# 3. Uses descriptive activity names to name the activities in the data set
	activity_labels <- read.table("activity_labels.txt")[,2]
	activity = data.frame(activity=factor(y[,1], labels=activity_labels))

	# 4. Appropriately labels the data set with descriptive activity names. 
	names(subject) <- "subject"
	data <- cbind(subject, activity, X)

    # 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
    data_names <- names(data)
    melted_data <- melt(data, id=data_names[1:2], measure.vars=data_names[3:length(data_names)])
	tidy_data <- dcast(melted_data, activity + subject ~ variable, mean)  
    write.table(tidy_data, fname)
}

print("runing analysis.txt...")
run_analysis("hci_har_analysis_tidy.txt")
print("Done.")
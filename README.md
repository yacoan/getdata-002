## Usage

* download data set file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and extract.
* download run_analysis.R to folder "<extraction path>/UCI HAR Dataset"
* change dir to "<extraction path>/UCI HAR Dataset" at RGui
* run below R script:
** install.packages("reshape2")  # needed when reshape2 library doesn't exist
** source("run_analysis.R") # generate data set hci_har_analysis_tidy.txt
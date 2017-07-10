
# Introduction

This project is a part of getting and cleaning data course on Coursera provided by Johns Hopkins University.The purpose of the project is to demonstarte the ability to collect, work with and clean a data set. The goal is to prepare a tidy data set that can be used for later analysis.Following items were required for a sucessful submission-
* a tidy dataset
* a link to a Github repository with the script for performing the analysis
* a code book that describes the variables, the data, and any transformations or work that was performed to clean up the data called CodeBook.md

# Data Source

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# R-Script
R Script (run_analysis.r) does the following -
1. create a folder called data if it already does not exist, download the zipped data and unzip it
```
if (!file.exists("./data")){dir.create("./data")}
furl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(furl,destfile = "./data/dataset.zip", mode="wb")
unzip("./data/dataset.zip",exdir = "./data/textfiles")
```
2. Appropriately labels the data set with descriptive variable names.
3. Merges the training and the test sets to create one data set.
4. Extracts only the measurements on the mean and standard deviation for each measurement.
```
##selecting only the measurements on the mean and std dev for each measurement
match.string <- c("mean","std")
df.selected.col <- df.merged[,c(1:2,grep(paste(match.string,collapse = "|"),colnames(df.merged)))]
```
5. Uses descriptive activity names to name the activities in the data set
```
##descriptive naming of the activities in the data set
df.with.activityLabel <- within(df.selected.col,activity_id <- factor(activity_id,labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")))
```
6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
```
##creating a tidy data set with the average of each variable for each activity and each subject
tidy.data <- df.with.activityLabel %>% group_by_(.dots=c("subject_id","activity_id")) %>% summarise_all(funs(mean))
```

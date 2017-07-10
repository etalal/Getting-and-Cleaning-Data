library(dplyr)

##create a folder called data if it already does not exist, download the zipped data and unzip it
if (!file.exists("./data")){dir.create("./data")}
furl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(furl,destfile = "./data/dataset.zip", mode="wb")
unzip("./data/dataset.zip",exdir = "./data/textfiles")

## read the training data set
filepath.train <- "./data/textfiles/UCI HAR Dataset/train/"
df.train <- read.table(paste(filepath.train,"X_train.txt",sep=""))

##read the features vector in a list and change the training dataset col names 
features <- scan("./data/textfiles/UCI HAR Dataset/features.txt",what=list(NULL,feature.names=character()))
colnames(df.train) = features$feature.names

## read the subject id who participated in the experiment for each row of training dataset
subject.train <- read.table(paste(filepath.train,"subject_train.txt",sep=""))
colnames(subject.train) = c("subject_id")

##read the activity id for each row of the training dataset
activity.train <- read.table(paste(filepath.train,"y_train.txt",sep=""))
colnames(activity.train) = c("activity_id")

##combine subject id and activity id with the training dataset
df.train <- do.call("cbind",list(subject.train,activity.train,df.train))


filepath.test <- "./data/textfiles/UCI HAR Dataset/test/" 

## read the test data set
df.test <- read.table(paste(filepath.test,"X_test.txt",sep=""))
colnames(df.test) = features$feature.names

## read the subject id who participated in the experiment for each row of test dataset
subject.test <- read.table(paste(filepath.test,"subject_test.txt",sep=""))
colnames(subject.test) = c("subject_id")

##read the activity id for each row of the test dataset
activity.test <- read.table(paste(filepath.test,"y_test.txt",sep=""))
colnames(activity.test) = c("activity_id")

##combine subject id and activity id with test dataset
df.test <- do.call("cbind",list(subject.test,activity.test,df.test))

##merge training and test data sets to create one data set
df.merged <- rbind(df.train,df.test)

##selecting only the measurements on the mean and std dev for each measurement
match.string <- c("mean","std")
df.selected.col <- df.merged[,c(1:2,grep(paste(match.string,collapse = "|"),colnames(df.merged)))]

##descriptive naming of the activities in the data set
df.with.activityLabel <- within(df.selected.col,activity_id <- factor(activity_id,labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")))

##creating a tidy data set with the average of each variable for each activity and each subject
tidy.data <- df.with.activityLabel %>% group_by_(.dots=c("subject_id","activity_id")) %>% summarise_all(funs(mean))

##writing the tidy data frame in to a text file
write.table(tidy.data,file.path("./data","tidy_dataset.txt"),row.names = FALSE,quote=FALSE)

## read and view the tidy data set
data <- read.table("./data/tidy_dataset.txt", header=TRUE)
View(data)

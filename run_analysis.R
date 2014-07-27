#read in test data
datatest <- read.table("UCI HAR Dataset/test/X_test.txt")

#read in the activity ids for test data
acttest <- read.table("UCI HAR Dataset/test/y_test.txt")

#read in training data
datatrain <- read.table("UCI HAR Dataset/train/X_train.txt") 

#read in the activity ids for training data
acttrain <- read.table("UCI HAR Dataset/train/y_train.txt") 

#read in the subject ids for test data
subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt")

#read in the subject ids for training data
subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt")

#read in the names for variables monitored in the test and training data
variablenames <- read.table("UCI HAR Dataset/features.txt", colClasses = "character")
variablenames <- variablenames[,2]

#merge training and test data sets
datafull <- rbind(datatest,datatrain)

#extract only mean and standard deviation variable outcomes from data
stdmatch <- "std()"
meanmatch <- "mean()"
freqmatch <- "Freq"
stdlist <- grepl(stdmatch,variablenames)
meanlist <- grepl(meanmatch,variablenames)
freqlist <- grepl(freqmatch,variablenames)
msdata <- data.frame(matrix(nrow = 10299, ncol = 0))
enames <- character()
for (k in 1:561)
{
  if (stdlist[k] == TRUE || meanlist[k] == TRUE && freqlist[k] == FALSE)
  {
    msdata <- cbind(msdata, datafull[,k])
    enames <- c(enames,variablenames[k])
  }  
}

#add column names to extracted data
library(stringr)
enames <- str_replace_all(enames, "[[:punct:]]", "")
enames <- chartr("m","M", enames)
enames <- gsub("fBodyBody","fBody", enames)
enames <- gsub("tBody","TimeBody",enames)
enames <- gsub("tGrav","TimeGrav", enames)
enames <- gsub("fBody","FrequencyBody", enames)
enames <- gsub("std","Std", enames)
enames <- gsub("Acc","Acceleration", enames)
colnames(msdata) <- enames

#assign the column names for the activity ids of test data and training data
colnames(acttest) <- "Activity"
colnames(acttrain) <- "Activity"

#combine activity ids of test and training data
actfull <- rbind(acttest,acttrain)

#assign the column names for the subject ids of test and training data 
colnames(subjecttest) <- "SubjectID"
colnames(subjecttrain) <- "SubjectID"

#combine subject ids of test and training data
subjectfull <- rbind(subjecttest,subjecttrain)

#add activity ids to exctracted data
msdata <- cbind(msdata,actfull)

#add subject id to activity training data
msdata <- cbind(msdata, subjectfull)

#order columns of extracted data with subject id and activity in first 2 columns
subjectid <- ncol(msdata)
activity <- subjectid - 1
actcol <- subjectid - 2
msdata <- msdata[c(subjectid,activity,1:actcol)]

#Replace activity ids with descriptive activity names
for( i in 1:nrow(msdata))
{
  if (msdata[i,2] == 1){msdata[i,2] <- "Walking"}
  if (msdata[i,2] == 2){msdata[i,2] <- "Walking_Upstairs"}
  if (msdata[i,2] == 3){msdata[i,2] <- "Walking_Downstairs"}
  if (msdata[i,2] == 4){msdata[i,2] <- "Sitting"}
  if (msdata[i,2] == 5){msdata[i,2] <- "Standing"}
  if (msdata[i,2] == 6){msdata[i,2] <- "Laying"}
}

#creates independent data set with the average of each variable for each activity and each subject
msaggdata <- aggregate(msdata, by=list(msdata$SubjectID,msdata$Activity), FUN=mean, na.rm=TRUE)

#removes extra subject and activity columns from new data set
msaggdata$SubjectID <- NULL
msaggdata$Activity <- NULL

#names the additional subject and activity columns
colnames(msaggdata)[1] <- "SubjectID"
colnames(msaggdata)[2] <- "Activity"

#orders the rows by Activity type
msaggdata <- msaggdata[order(msaggdata$Activity), ]

#removes the column for row names
row.names(msaggdata) <- seq(nrow(msaggdata))

#writes tidy data set to text file
write.table(msaggdata ,file="tidydata.txt",sep="\t")

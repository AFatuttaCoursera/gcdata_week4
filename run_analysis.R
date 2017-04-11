##library loading
library(data.table)

##1.Merges the training and the test sets to create one data set.

##reading test data
subjTest <- read.table("./gcdata_week4/UCI HAR Dataset/test/subject_test.txt", header = FALSE)

dataTest <- read.table("./gcdata_week4/UCI HAR Dataset/test/X_test.txt", header = FALSE)

activityTest <- read.table("./gcdata_week4/UCI HAR Dataset/test/Y_test.txt", header = FALSE)

##reading train data
subjTrain <- read.table("./gcdata_week4/UCI HAR Dataset/train/subject_train.txt", header = FALSE)

dataTrain <- read.table("./gcdata_week4/UCI HAR Dataset/train/X_train.txt", header = FALSE)

activityTrain <- read.table("./gcdata_week4/UCI HAR Dataset/train/y_train.txt", header = FALSE)

##merging the 2 datasets and assigning readable names

subjFull <- rbind(subjTest,subjTrain)

dataFull <- rbind(dataTest,dataTrain)

activityFull <- rbind(activityTest,activityTrain)


##2.Extracts only the measurements on the mean and standard deviation for each measurement.

##I read first the feature list and then filter with regexp *mean* and *std* like names
feat<- read.table("./dc_prj/UCI HAR Dataset/features.txt")
names(feat)<- c("id","name")
featList <- grepl( "^.*(mean|std)\\(\\).*$",feat$name)

##extracing only data for the feature list with *mean* and *std*
dataFull <- dataFull[,featList]


##3.Uses descriptive activity names to name the activities in the data set

##reading activity labels from the data set
actLabels <-read.table("./dc_prj/UCI HAR Dataset/activity_labels.txt")

##assign lables to the activity list
activityFull$activityName <- actLabels[ activityFull[,1],2]


##4.Appropriately labels the data set with descriptive variable names.

names(subjFull) <- c("subjectId")
names(activityFull) <- c("activityId","activityName" )

##I will use the original data sets names for the extracted data
names(dataFull)<- feat[featList,"name"]

##merging the 3 datasets into a final one

finalSet <- data.table(cbind(subjFull, activityFull,dataFull))


##5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
newTidySet <- data.table(finalSet[, lapply(.SD, mean, na.rm=TRUE), by = list(subjectId,activityId,activityName) ])

write.table(x = newTidySet, sep = ";", file = "./gcdata_week4/newTidySet.txt", na = "NA",row.name=FALSE)

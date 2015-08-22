# Clear workspace
rm(list=ls())

# 1. Merge training and test sets to create one data set.

# set working directory to the location where unzipped UCI HAR Dataset resides
setwd('/Users/mypak/UCI HAR Dataset/')

# Read data from text files in UCI HAR Dataset
features     = read.table('./features.txt',header=FALSE) 
activitytype = read.table('./activity_labels.txt',header=FALSE) 
subjecttrain = read.table('./train/subject_train.txt',header=FALSE) 
xTrain       = read.table('./train/x_train.txt',header=FALSE) 
yTrain       = read.table('./train/y_train.txt',header=FALSE) 
subjecttest  = read.table('./test/subject_test.txt',header=FALSE) 
xTest        = read.table('./test/x_test.txt',header=FALSE) 
yTest        = read.table('./test/y_test.txt',header=FALSE) 

# Assign column names to the above data 
colnames(activitytype)  = c('activityId','activityType');
colnames(subjecttrain)  = "subjectId"
colnames(xTrain)        = features[,2] 
colnames(yTrain)        = "activityId"
colnames(subjecttest) = "subjectId"
colnames(xTest)       = features[,2] 
colnames(yTest)       = "activityId"

# Create final training set by merging subjecttrain, xTrain and yTrain
trainingdata = cbind(subjecttrain,xTrain,yTrain)


# Create final test set by merging the subjecttest, xTest and yTest
testdata = cbind(subjecttest,xTest, yTest)


# Combine training and test data 
combineddata = rbind(trainingdata,testdata)

# Create a vector for the column names from combineddata which will be used to select
# desired mean() and stddev() columns
colNames  = colnames(combineddata) 

# 2. Extract only the measurements on the mean and standard deviation for each measurement 

# Create a logicalVector that contains TRUE values for the ID, mean() and stddev() columns; FALSE for others
logicalVector = (grepl("activity..",colNames) | grepl("subject..",colNames) | grepl("-mean..",colNames) & !grepl("-meanFreq..",colNames) & !grepl("mean..-",colNames) | grepl("-std..",colNames) & !grepl("-std()..-",colNames))

# Subset combineddata table based on the logicalVector to keep only the desired columns
combineddata = combineddata[logicalVector==TRUE];

# 3. Use descriptive activity names to name the activities in the data set

# Merge combineddata set with activitytype table to include descriptive activity names
combineddata = merge(combineddata,activitytype,by='activityId',all.x=TRUE);

# Update the colNames vector to include new column names after merged
colNames  = colnames(combineddata); 

# 4. Appropriately label the data set with descriptive activity names 

# Clean the variable names
for (i in 1:length(colNames)) 
{
  colNames[i] = gsub("\\()","",colNames[i])
  colNames[i] = gsub("-std$","StdDev",colNames[i])
  colNames[i] = gsub("-mean","Mean",colNames[i])
  colNames[i] = gsub("^(t)","time",colNames[i])
  colNames[i] = gsub("^(f)","freq",colNames[i])
  colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
  colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
  colNames[i] = gsub("[Gg]yro","Gyro",colNames[i])
  colNames[i] = gsub("AccMag","AccMagnitude",colNames[i])
  colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
  colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
  colNames[i] = gsub("GyroMag","GyroMagnitude",colNames[i])
};

# Reassign new descriptive column names to the combineddata
colnames(combineddata) = colNames

# 5. Create a second, independent tidy data set with the average of each variable
# for each activity and each subject 

# Create combineddataNoActivityType without the activityType column
combineddataNoActivityType  = combineddata[,names(combineddata) != 'activityType']

# Summarise combineddataNoActivityType table to include just the mean of each variable for each activity and each subject
tidyData    = aggregate(combineddataNoActivityType[,names(combineddataNoActivityType) != c('activityId','subjectId')],by=list(activityId=combineddataNoActivityType$activityId,subjectId = combineddataNoActivityType$subjectId),mean);

# Merge tidyData with activitytype to include descriptive activity names
tidyData    = merge(tidyData,activitytype,by='activityId',all.x=TRUE)

# Write out the tidyData 
write.table(tidyData, './tidyData.txt',row.names=TRUE,sep='\t')


This code book describes the variables, the data, and work done to clean up the data.

A full description of where the data was obtained - check out http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Dataset: UCI HAR Dataset comprises of data collected from the accelerometers from the Samsung Galaxy S smartphone.
Source data is from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The dataset includes the following files:

'README.txt'

'features_info.txt': Shows information about the variables used on the feature vector.

'features.txt': List of all features.

'activity_labels.txt': Links the class labels with their activity name.

'train/X_train.txt': Training set.

'train/y_train.txt': Training labels.

'test/X_test.txt': Test set.

'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

Output
A data.table named tidyData is set with the following columns.  All units are maintained from the original data set. A file named tidyData.txt is written from running run_analysis.R. The description of the columns are described below.

| column       | description                                                  | type    |
| ------------ | ------------------------------------------------------------ | ------- |
| SubjectId    | Identifier of the subject                                    | integer |
| ActivityId   | Type of the activity i.e. 6 types                            | factor  |
| MeanSamples  | Mean of variables by Subject + Activity provided in tidyData | numeric |


| Column                       | Original Name               |
| ---------------------------- | --------------------------- |
| ActivityId                   |                             |
| SubjectId                    |                             |
| Time.BodyAcc.Mean.X          | tBodyAcc-mean()-X           |
| Time.BodyAcc.Mean.Y          | tBodyAcc-mean()-Y           |
| Time.BodyAcc.Mean.Z          | tBodyAcc-mean()-Z           |
| Time.BodyAcc.Std.X           | tBodyAcc-std()-X            |
| Time.BodyAcc.Std.Y           | tBodyAcc-std()-Y            |
| Time.BodyAcc.Std.Z           | tBodyAcc-std()-Z            |
| Time.GravityAcc.Mean.X       | tGravityAcc-mean()-X        |
| Time.GravityAcc.Mean.Y       | tGravityAcc-mean()-Y        |
| Time.GravityAcc.Mean.Z       | tGravityAcc-mean()-Z        |
| Time.GravityAcc.Std.X        | tGravityAcc-std()-X         |
| Time.GravityAcc.Std.Y        | tGravityAcc-std()-Y         |
| Time.GravityAcc.Std.Z        | tGravityAcc-std()-Z         |
| Time.BodyAccJerk.Mean.X      | tBodyAccJerk-mean()-X       |
| Time.BodyAccJerk.Mean.Y      | tBodyAccJerk-mean()-Y       |
| Time.BodyAccJerk.Mean.Z      | tBodyAccJerk-mean()-Z       |
| Time.BodyAccJerk.Std.X       | tBodyAccJerk-std()-X        |
| Time.BodyAccJerk.Std.Y       | tBodyAccJerk-std()-Y        |
| Time.BodyAccJerk.Std.Z       | tBodyAccJerk-std()-Z        |
| Time.BodyGyro.Mean.X         | tBodyGyro-mean()-X          |
| Time.BodyGyro.Mean.Y         | tBodyGyro-mean()-Y          |
| Time.BodyGyro.Mean.Z         | tBodyGyro-mean()-Z          |
| Time.BodyGyro.Std.X          | tBodyGyro-std()-X           |
| Time.BodyGyro.Std.Y          | tBodyGyro-std()-Y           |
| Time.BodyGyro.Std.Z          | tBodyGyro-std()-Z           |
| Time.BodyGyroJerk.Mean.X     | tBodyGyroJerk-mean()-X      |
| Time.BodyGyroJerk.Mean.Y     | tBodyGyroJerk-mean()-Y      |
| Time.BodyGyroJerk.Mean.Z     | tBodyGyroJerk-mean()-Z      |
| Time.BodyGyroJerk.Std.X      | tBodyGyroJerk-std()-X       |
| Time.BodyGyroJerk.Std.Y      | tBodyGyroJerk-std()-Y       |
| Time.BodyGyroJerk.Std.Z      | tBodyGyroJerk-std()-Z       |
| Time.BodyAccMag.Mean         | tBodyAccMag-mean()          |
| Time.BodyAccMag.Std          | tBodyAccMag-std()           |
| Time.GravityAccMag.Mean      | tGravityAccMag-mean()       |
| Time.GravityAccMag.Std       | tGravityAccMag-std()        |
| Time.BodyAccJerkMag.Mean     | tBodyAccJerkMag-mean()      |
| Time.BodyAccJerkMag.Std      | tBodyAccJerkMag-std()       |
| Time.BodyGyroMag.Mean        | tBodyGyroMag-mean()         |
| Time.BodyGyroMag.Std         | tBodyGyroMag-std()          |
| Time.BodyGyroJerkMag.Mean    | tBodyGyroJerkMag-mean()     |
| Time.BodyGyroJerkMag.Std     | tBodyGyroJerkMag-std()      |
| FFT.BodyAcc.Mean.X           | fBodyAcc-mean()-X           |
| FFT.BodyAcc.Mean.Y           | fBodyAcc-mean()-Y           |
| FFT.BodyAcc.Mean.Z           | fBodyAcc-mean()-Z           |
| FFT.BodyAcc.Std.X            | fBodyAcc-std()-X            |
| FFT.BodyAcc.Std.Y            | fBodyAcc-std()-Y            |
| FFT.BodyAcc.Std.Z            | fBodyAcc-std()-Z            |
| FFT.BodyAccJerk.Mean.X       | fBodyAccJerk-mean()-X       |
| FFT.BodyAccJerk.Mean.Y       | fBodyAccJerk-mean()-Y       |
| FFT.BodyAccJerk.Mean.Z       | fBodyAccJerk-mean()-Z       |
| FFT.BodyAccJerk.Std.X        | fBodyAccJerk-std()-X        |
| FFT.BodyAccJerk.Std.Y        | fBodyAccJerk-std()-Y        |
| FFT.BodyAccJerk.Std.Z        | fBodyAccJerk-std()-Z        |
| FFT.BodyGyro.Mean.X          | fBodyGyro-mean()-X          |
| FFT.BodyGyro.Mean.Y          | fBodyGyro-mean()-Y          |
| FFT.BodyGyro.Mean.Z          | fBodyGyro-mean()-Z          |
| FFT.BodyGyro.Std.X           | fBodyGyro-std()-X           |
| FFT.BodyGyro.Std.Y           | fBodyGyro-std()-Y           |
| FFT.BodyGyro.Std.Z           | fBodyGyro-std()-Z           |
| FFT.BodyAccMag.Mean          | fBodyAccMag-mean()          |
| FFT.BodyAccMag.Std           | fBodyAccMag-std()           |
| FFT.BodyBodyAccJerkMag.Mean  | fBodyBodyAccJerkMag-mean()  |
| FFT.BodyBodyAccJerkMag.Std   | fBodyBodyAccJerkMag-std()   |
| FFT.BodyBodyGyroMag.Mean     | fBodyBodyGyroMag-mean()     |
| FFT.BodyBodyGyroMag.Std      | fBodyBodyGyroMag-std()      |
| FFT.BodyBodyGyroJerkMag.Mean | fBodyBodyGyroJerkMag-mean() |
| FFT.BodyBodyGyroJerkMag.Std  | fBodyBodyGyroJerkMag-std()  |



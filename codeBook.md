# Feature Selection
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag


# Features in Tidy Data set

1. subject_id
    * Subject who performed different activity. it ranges from 1 to 30
2. activity_id
     1.Walking
     2.WALKING_UPSTAIRS
     3.WALKING_DOWNSTAIRS
     4.SITTING
     5.STANDING
     6.LAYING
3. tBodyAcc-mean()-XYZ
   * mean of body accelaration signal in time domain for each subject, each activity in X, Y and Z direction
   * feature is normalized and value is within [-1,1]
4. tBodyAcc-std()-X
   * standard deviation of body accelaration signal in time domain for each subject, each activity in X, Y and Z direction
   * feature is normalized and value is within [-1,1]
5. tGravityAcc-mean()-XYZ
   * mean of gravitational accelaration signal in time domain for each subject, each activity in X, Y and Z direction
   * feature is normalized and value is within [-1,1]
6. 

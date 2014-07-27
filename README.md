READ ME
=======

This repo contains 4 files: Raw Data, a Tidy Data Set, A Code Book describing each variable and its values in the tidy data set, and an exact recipe used to take the raw data and translate it to the tiday data set.

RAW DATA
The raw data are from the Human Activity Recognition Using Smartphones Dataset[Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012].  In the repo, the name of the file containing the data is rawhar.zip.   The data are from experiments carried out with a group of 30 volunteers.  Per the readme from the raw data, a further a description follows: 

 "Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

For more information on the raw data, the zip file contains a readme and other pertinent text files.

TIDY DATA SET

The raw data has multiple data sets that were combined to form the tidy data set.  Specifically, there is a data set for training and a data set for testing.  Some of the volunteers were in the testing data set, and some of the volunteers were in the training data set.  In the tidy data, both sets are combined.   Furthermore, the raw data has seperate files that contain the activity labels for the training and testing data, and it also had seperate files that contain the volunteer ids for the corresponding training and testing data.  In the tidy data, the activities and the ids of the volunteers have all been merged with the training and testing data. 

The tidy data set includes only the mean and standard deviation for each variable.    In the original raw data measurements for each variable included included:

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

In the tidy data set, only mean(), std() are present.  Thus, in the tidy data set measurements for mean() and std() are present for the following variables:

tBodyAcc-XYZ 
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The expanded list can be found in the Code Book file located in the repo.

Aditionally, the tidy data set only includes the average of each variable for each activity and each subject.   As an example, the second volunteer(subject), who has an id of 2, performed 31 standing activities.  The raw data has corresponding measurements for all the above listed variables (e.g. tBodyAcc-X) for each 31 standing activities.  The tidy data set has averaged the 31 standing activity tBodyAcc-X measurements. 

The tidy data has descriptive names--hence, for the average 31 standing activity tBodyAcc-X measurements for subject 2, the variable in the tidy data set is "AverageTimeBodyAccelerationMeanX."

The data is overall tidy with respect to principles laid out by Hadley Wickham, E.G. each variable measured is in one column, and each observation of that variable is in a different row.  

CODE BOOK

The code book contains information about the variables in the data set contained in the tidy data.

RECIPE

The recipe is an r script file.  The name of the file is run_analysis.r.   It will work with the raw data unzipped in the folder where the run_anlaysis.r file is saved.  Thus, a folder named "UCI HAR Dataset" should be seen from the folder with the run_analysis.r script.  The script itself is fully commented, step by step.  For further specificity of the steps, view the code.  

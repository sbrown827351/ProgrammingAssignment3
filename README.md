# Coursera Getting and Cleaning Data Course Assignment

This read-me describes the  data and overview of the actions that have been applied to the data for this assignment.

## The Data Source

[Original Data Source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
[Original Description of the Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Attribute Information

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Data Processing

First, the training and test data sets are merged into one. Second, data is extracted for the mean and standard deviation. Then, descriptions are cleaned up in the file. Finally, there is a file created from the merged and clean data which presents the averages of the activties and subjects. 


### Libraries Used
The libraries used in the R Script are `dplyr` and the library is loaded at the beginning of the function


### Loading data and creating merged data
The data for the training and test sets are split up into three specific sections being subject, activity and features.  Each of these are in different folders and files. This data is loaded separately and then merged into one file. Headers and descriptions are added based on the seperate file included with the test data. The data is then filtered for anything with Mean or Std. 


### Export data to file
The data is averaged by activities and subject and then written to file 'tidydata.txt'.

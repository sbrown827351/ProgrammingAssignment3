# CodeBook
This code book describes the  data and transformations used by `run_analysis.R` and the variables to produce the output of tidydata.txt

## The Data Source

[Original Data Source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
[Original Description of the Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Data Set Information

### Input 

- `X_train.txt` contains variable features that are intended for training.
- `y_train.txt` contains the activities corresponding to `X_train.txt`.
- `subject_train.txt` contains information on the subjects from whom data is collected.
- `X_test.txt` contains variable features that are intended for testing.
- `y_test.txt` contains the activities corresponding to `X_test.txt`.
- `subject_test.txt` contains information on the subjects from whom data is collected.
- `activity_labels.txt` contains metadata on the different types of activities.
- `features.txt` contains the name of the features in the data sets.

## Data Processing
The following are the transformations:

- `X_test.txt` is read into table `xtestdata`
- `y_test.txt` is read into table `ytestdata`
- `subject_test.txt` is read into table `subjectdata`
- `X_train.txt` is read into table `xtable`
- `y_train.txt` is read into table `ytable`
- `subject_train.txt` is read into table `subjecttable`
- `features.txt` is read into table `features`
- `activity_labels.txt` is read into table `activity`
- The respective files for Train and Test are Subject, Features and Activity are merged into the corresponding `merged_subject_tables`, `merged_y_tables` and `merged_x_tables`
- The `merged_subject_tables`, `merged_y_tables` and `merged_x_tables`` are merged to create ‘merged_data’
- xdata_filtered is created with data from columns in `merged_x_tables` that contain std or mean
- Activity column in merged_y_tables is updated with descriptive names of activities taken from `Activity`. 
- Acronyms in variable names in merged_data are replaced with descriptive names
- `tidydata` is created as a mean for each activity and subject of merged_data and then written to file 'tidydata.txt'

## Output
The output data `tidydata.txt` is a space delimited value file. The header line contains the names of the variables and represents the mean and standard deviation.
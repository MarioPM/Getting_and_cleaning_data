# Getting and Cleaning Data Course Project CodeBook

This file describes the variables, the data and the transformations 
used to clean up the data.

## The data

The data was obtained from [UCI](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
It contains Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

## The script 

The script `run_analysis.R` performs the 5 steps described in the guide of the
project.


1. Read the files and merge all the similar data (same variables). This is,
 `X_train.txt` and `X_test.txt` are combined to obtain the set `join.label`,
  `X_train.txt` and `Y_test.txt` are combined to obtain the set `label.data`
  and finally, `subject_train.txt` and `subject_test.txt` are combined 
  to obtain the set `join.subject`,
2. We extract only the measurements on the mean and standard deviation for each
observation by using regular expressions. In this way, we obtain a 10299 x 66
dataframe. Moreover,  we remove the "()" and "-" symbols in the names
and we use a more appropiate scheme to capitalize the names of the variables.
3. We use the `activity_labels.txt` to give descriptive activity names to
the names in the `join.label` dataframe.
4. We combine all the dataframes to obtain a tidy dataframe.
5. Finally, we generate a second independent tidy data set with the average of
each measurement for each activity and each subject. As we have 30 unique subjects 
and 6 unique activities, our new dataframe has 180 observations.


## Variables

* `train.data`, `train.label`, `train.subject`, `test.data`, `test.label` and
`test.subject`are the original data from the data set.
* `join.data`, `join.label` and `join.subject` merge the previous datasets
to further analysis.
* `meanStd.index` is a numeric vector used to extract the requiered columns
from the `join.data` dataframe.
*  `features` contains the correct names for the `join.data` dataset.
* `activities` contains the correct names for the `join.label` dataset.
* `data` merges `join.data`, `join.label` and `join.subject`.
* `tidy.data` contains the average of
each measurement for each activity and each subject 
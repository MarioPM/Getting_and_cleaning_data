# Getting and Cleaning Data - Course Project

This repository hosts the *Course Project* 
for the course [Getting and Cleaning Data The dataset](https://www.coursera.org/learn/data-cleaning). The project uses the
dataset [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
which includes several measures captured by the embedded accelerometer and gyroscope
of the a telephone while the subjects perfom six different activities (walking, 
walking downstairs, walking upstairs, sitting, standing and laying).

## Files

The repository contains the following files:

* The `CodeBook.md` file describes the data, the meaning of the variables and the transformations 
performed to clean up the data.
* The `run_analysis.R` contains all the code following all the steps indicated in
the project's guide. Its read the files `features.txt` and àctivity_labels.txt`
from the current directory and the sets contained in the `train` and `test` folders.
* The `tidy_data_means` contains the relevant averages required n 
a tidy file using the specifications of the project's guide.




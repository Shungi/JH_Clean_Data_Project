## John Hopkins Getting and Cleaning Data Course Project
## Kaala Malone
## October 2020
#
#       Data obtained from UCI Machine Learning Repository
#       Human Activity Recognition Using Smartphones Data Set
#       More information about this dataset can be found at
#       http://archive.ics.uci.edu/ml/datasets/Human+Activity
#       +Recognition+Using+Smartphones#
#
#
##############################
library(tidyverse)

#Download Data, Save to working directory and unzip files

URL <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles
%2FUCI%20HAR%20Dataset.zip"

download.file(URL,"./PhoneActivityData.zip")

# I am unzipping onto a windows machine

unzip(zipfile ="./PhoneActivityData.zip", exdir = getwd())


# Check out what the unzipped folder is called discover it's called
# "UCI HAR Dataset", at his point I just dig through the files on my machine to
# to understand the dataset

list.files()

# grab needed files out of folder for training set, I set options
# to digits = 8 because it was bugging me that it didn't print all the digits 
# past the decimal

options(digits = 8)

#features contains all the variable names needed for both the test and training 
# data

features<-read_lines("./UCI HAR Dataset/features.txt")

old_activity <-c("1","2","3","4","5","6")
new_activity <-c("walking","walkingupstairs","walkingdownstairs","sitting",
                 "standing","laying")

test_values<- read_table("./UCI HAR Dataset/test/X_test.txt", 
                         col_names = features)

test_subjects <-read_lines("./UCI HAR Dataset/test/subject_test.txt")

#read in the test activity

test_activity <-read_lines("./UCI HAR Dataset/test/y_test.txt")

#replace the numbers with descriptive 
for(i in 1:6)
{
        test_activity<-sub(old_activity[i],new_activity[i],test_activity)
}
test_activity

test_values <-test_values %>% select(contains("mean")|contains("std"))
     

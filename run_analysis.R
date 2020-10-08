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

# I get annoyed when I print something and my doubles get rounded 
options(digits = 8)

#features contains all the variable names needed for both the test and training 
# data

features<-read_lines("./UCI HAR Dataset/features.txt")

# setting up my labels I'll need to rename my activities

old_activity <-c("1","2","3","4","5","6")
new_activity <-c("walking","walkingupstairs","walkingdownstairs","sitting",
                 "standing","laying")

#load up values test_values and subjects

test_values<- read_table("./UCI HAR Dataset/test/X_test.txt", 
                         col_names = features)

test_subjects <-read_lines("./UCI HAR Dataset/test/subject_test.txt")

#read in the test activity

test_activity <-read_lines("./UCI HAR Dataset/test/y_test.txt")

#replace the numbers with descriptive values of the activity


# create new table containing only standard deviations and means
test_values <-test_values %>% select(contains("mean")|contains("std"))

#bind subject and activity to test_values to make one test tibble
test <-bind_cols(test_subjects,test_activity,test_values)   

#rename the column 1 and 2 to something sensible
test <- test %>% rename(subject = ...1, activity = ...2)

# load up files for and create tibble for training data

training_values<- read_table("./UCI HAR Dataset/train/X_train.txt", 
                         col_names = features)
training_subjects <-read_lines("./UCI HAR Dataset/train/subject_train.txt")


training_activity <-read_lines("./UCI HAR Dataset/train/y_train.txt")

training_values <-training_values %>% select(contains("mean")|contains("std"))

training <-bind_cols(training_subjects,training_activity,training_values)   

training <- training %>% rename(subject = ...1, activity = ...2)


# rowbind training and test data to make one dataset 

fulldata <- bind_rows(test,training)

#changing the class of subject to numeric and arranging it by subject
fulldata <- fulldata %>% mutate(subject = as.numeric(subject)) %>%
        arrange(subject)

#replace the numbers with descriptive values of the activity
for(i in 1:6){
        fulldata$activity <-sub(old_activity[i],new_activity[i],
                                fulldata$activity)
}

# removed columns 49-54 because they are angle measurements not means or 
# standard deviations
fulldata <-fulldata[,-(49:54)]



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


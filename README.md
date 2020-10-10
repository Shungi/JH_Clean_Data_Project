# JH_Clean_Data_Project
Project for John Hopkins Coursera Course Getting and Cleaning Data. 

run_analysis is an R script that merges the training and test data from the UCI Human Activity Recognition Using Smartphones dataset. 

It creates 2 datasets the first extracts only the measurements on the mean and standard deviation for each measurement. It gets saved as a file called UCIdatameanstd.txt. The activity codes have been recoded from the original data from numbers to descriptive names using the guide provided by UCI 

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

The columns of the dataset were labeled with the provided variables given in the features text. Provided by UCI. I merged the subject text and the y text files with the X values for each test and training data to create 2 additional columns for subject and activity respectively. 

I chose not to rename the features as no I could come up with no better descriptions than the ones already provided. I have added the features_info.txt provided by UCI to serve as a variable codebook.  

The second dataset is saved as UCIdatameanofmean.text was created from the UCIdatameanstd.txt (although in this case I used the tibble fulldata I created in the script ) which finds the average of each variable for each activity/subject combination.  

Per the principles of tidy data set forth by Hadley Wickham in his paper Tidy Data each column represents a variable and each row represents one observation. 

The text files for the modified data were created using read.table so write.table can be used to read data sets into R if you so choose. This was suggested by David Hood on his blog post Getting and Cleaning Data the Assignment. 

References

UCI Machine Learning Repository Human Activity Recognition Using Smartphones Data Set, http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Hadley Wickham, Tidy Data https://vita.had.co.nz/papers/tidy-data.pdf

Hood David, Getting and Cleaning Data the Assignment https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/

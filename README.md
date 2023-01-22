# GettingDataCourse

Run_Analysis project is divided in 3 main functions:
1- run_analysis
2- Find_Files
3- Dataset

In order to run this script, "tidyverse" library is required. Library is called in "run_analysis" function.


run_analysis includes, by default, the argument to access "UCI HAR Dataset" as long as it is in working directory.

By running run_analysis, a dataset will be in output in "Tidy_DataSet" which is the required output by the project course.

run_analysis start by calling the function "Find_Files", which creates in output "Files" a list of the files and their path to complete the required output.



With the output "Files", the function "Dataset" is performed and outputs "Data_File" which is the complete data set as requested in course instructions 1 to 4:

1 - Merges the training and the test sets to create one data set.

2 - Extracts only the measurements on the mean and standard deviation for each measurement. 

3 - Uses descriptive activity names to name the activities in the data set

4 - Appropriately labels the data set with descriptive variable names



Data_File is then used as input to created "Tidy_Dataset", which fulfills the request in course instruction 5:
5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.







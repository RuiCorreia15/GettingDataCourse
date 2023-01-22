run_analysis <- function(MainFolder = "UCI HAR Dataset"){
  library(tidyverse)
  Files <- Find_Files(MainFolder)
  File_names <- c("Find_Features","Activity Label","Train_Subject","Train_X","Train_Y","Test_Subject", "Test_X","Test_Y")
  Data_File <- Dataset(Files)
  Tidy_Dataset <- Data_File %>% group_by(Subject, Activity) %>% summarise_all(mean)
  Tidy_Dataset
}

Find_Files <- function(MainFolder){
  Find_Features <- list.files(MainFolder, pattern = "features.txt", recursive = TRUE)
  Activity_labels <- list.files(MainFolder, pattern = "labels.txt$", recursive = TRUE)
  Test_Subject <- list.files(MainFolder, pattern = "subject_test.txt", recursive = TRUE)
  Test_X <- list.files(MainFolder, pattern = "^X_test.txt", recursive = TRUE)
  Test_Y <- list.files(MainFolder, pattern = "^y_test.txt", recursive = TRUE)
  Train_Subject <- list.files(MainFolder, pattern = "subject_train.txt", recursive = TRUE)
  Train_X <- list.files(MainFolder, pattern = "^X_train.txt", recursive = TRUE)
  Train_Y <- list.files(MainFolder, pattern = "^y_train.txt", recursive = TRUE)
  File_vector <- c(Find_Features, Activity_labels, Train_Subject, Train_X, Train_Y, Test_Subject, Test_X, Test_Y)
  for (i in seq_along(File_vector)){
    File_vector[i] <- paste(MainFolder, File_vector[i], sep = "/")
  }
  Files <- File_vector
  Files
}

Dataset <- function(Files){
  Features_Table <- read.table(Files[1], header = FALSE)
  Features <- c("Subject", "Activity",Features_Table[,2])
  subjects1 <- read.table(Files[3], header = FALSE)
  df1 <- read.table(Files[4], header = FALSE)
  df2 <- read.table(Files[5], header = FALSE)
  Train_Data <- data.frame(subjects1,df2, df1)
  subjects2 <- read.table(Files[6], header = FALSE)
  df3 <- read.table(Files[7], header = FALSE)
  df4 <- read.table(Files[8], header = FALSE)
  Test_Data <- data.frame(subjects2,df4, df3)
  colnames(Train_Data) <- Features
  colnames(Test_Data) <- Features
  Data_set <- rbind(Train_Data,Test_Data)
  Filter_set <- Data_set[,grepl("mean|std", colnames(Data_set))]
  ID_Set <- Data_set[,1:2]
  Data_set <- cbind(ID_Set,Filter_set)
  Act_Labels <- read.table(Files[2], header = FALSE)
  Data_set$Activity <- Act_Labels$V2[match(Data_set$Activity, Act_Labels$V1)]
  Data_set
  }
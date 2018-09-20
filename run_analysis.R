run_analysis <- function(){
  
  library(dplyr)
  
  # Load data and store in tables  
  features <- read.table("UCI HAR Dataset/features.txt", col.names=c("ftr_ID", "ftr_desc"))
  activity <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("act_ID", "act_desc"))
  
  subjectdata <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subj")
  xtestdata <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$ftr_desc)
  ytestdata <- read.table("UCI HAR Dataset/test/Y_test.txt",col.names = "y_id")
  
  subjecttable <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subj")
  xtable <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$ftr_desc)
  ytable <- read.table("UCI HAR Dataset/train/Y_train.txt",col.names = "y_id")
  
  #Merge individual tables to prepare for overall merge
  merged_subject_tables <- rbind(subjectdata, subjecttable)
  merged_x_tables <- rbind(xtestdata, xtable)
  merged_y_tables <- rbind(ytestdata, ytable)
  
  
  #Extract mean and std measurements
  xdata_filtered <- merged_x_tables[, grep("-(mean|std)\\(\\)",features[,2])]
  names(xdata_filtered) <- features[grep("-(mean|std)\\(\\)", features[, 2]), 2]
  
  #Add descriptions for activities
  merged_y_tables[, 1] <- activity[merged_y_tables[, 1], 2]
  names(merged_y_tables) <- "Activity"
  
  #Add description for Subject table
  names(merged_subject_tables) <- "Subject"
  
  #Combine all data into one table
  merged_data <- cbind(xdata_filtered, merged_y_tables, merged_subject_tables)
  
  #Simplify descriptions for variables
  names(merged_data) <- make.names(names(merged_data))
  names(merged_data) <- gsub('\\.mean',"-Mean",names(merged_data))
  names(merged_data) <- gsub('\\.std',"-StandardDeviation",names(merged_data))
  names(merged_data) <- gsub('Freq\\.',"Frequency-",names(merged_data))
  names(merged_data) <- gsub('Freq$',"Frequency",names(merged_data))
  names(merged_data) <- gsub('Acc',"Acceleration",names(merged_data))
  names(merged_data) <- gsub('Mag',"Magnitude",names(merged_data))
  names(merged_data) <- gsub('^t',"TimeDomain.",names(merged_data))
  names(merged_data) <- gsub('^f',"FrequencyDomain.",names(merged_data))
  
  #Write first set of data to file
  write.table(merged_data, "step1data.txt")
   
  
  #Summarize and write tidy data file
  tidydata <- aggregate(. ~Subject + Activity, merged_data, mean)
  tidydata <- tidydata[order(tidydata$Subject,tidydata$Activity),]
  write.table(tidydata, "tidydata.txt")
  
}
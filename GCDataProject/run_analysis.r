  ## read data
  x_t <-read.table("x_train.txt")
  y_t <-read.table("y_train.txt")
  s_t <-read.table("subject_train.txt")
  
  
  x_te <-read.table("x_test.txt")
  y_te <-read.table("y_test.txt")
  s_te <-read.table("subject_test.txt")
 

  ## Merges the training and the test sets to create 
  ## one data set
  x_total <-rbind(x_t, x_te)
  y_total <-rbind(y_t, y_te)
  s_total <-rbind(s_t, s_te)
  

  ## save my data files
  write.table(x_total, "my_x.txt", sep=" ")
  write.table(y_total, "my_y.txt", sep=" ")
  write.table(s_total, "my_s.txt", sep=" ")
  

  ## Extracts only the measurements on the mean and standard 
  ## deviation for each measurement.
  mx <-read.table("my_x.txt")
  my <-read.table("my_y.txt")
  ms <-read.table("my_s.txt")
 
  
  acc_ms <-mx[,c(1:6)]
  tga_ms <-mx[,c(41:46)]
  tbaj_ms <-mx[,c(81:86)]
  tbg_ms <-mx[,c(121:126)]
  tbgj_ms <-mx[,c(161:166)]
  tbam_ms <-mx[,c(201,202)]
  tgam_ms <-mx[,c(214,215)]
  tbajm_ms <-mx[,c(227,28)]
  tbgm_ms <-mx[,c(240,241)]
  tbgjm_ms <-mx[,c(253,254)]
  fba_ms <-mx[,c(266:271)]
  fba_mf <-mx[,c(294:296)]
  fbaj_ms <-mx[,c(345:350)]
  fbaj_mf <-mx[,c(373:375)]
  fbg_ms <-mx[,c(424:429)]
  fbg_mf <-mx[,c(452:454)]
  fbam_ms <-mx[,c(503,504)]
  fbam_mf <-mx[,513]
  fbbajm_m1 <-mx[,c(516,517)]
  fbbajm_m2 <-mx[,526]
  fbbgm_ms <-mx[,c(529,530)]
  fbbgm_mf <-mx[,539]
  fbbgjm_ms <-mx[,c(542,543)]
  fbbgjm_mf <-mx[,552]
  angle_tbam <-mx[,555]
  angle_tbajm <-mx[,556]
  angle_tbgm <-mx[,557]
  angle_tbgjm <-mx[,558]
  angle_x <-mx[,559]
  angle_y <-mx[,560]
  angle_z <-mx[,561]
 
  meanstd_a <-cbind(acc_ms,tga_ms,tbaj_ms,tbg_ms,tbgj_ms,tbam_ms,tgam_ms,tbajm_ms,tbgm_ms,tbgjm_ms)
  meanstd_b <-cbind(fba_ms,fba_mf,fbaj_ms,fbaj_mf,fbg_ms,fbg_mf,fbam_ms,fbam_mf,fbbajm_m1,fbbajm_m2)
  meanstd_c <-cbind( fbbgm_ms,fbbgm_mf,fbbgjm_ms,fbbgjm_mf,angle_tbam,angle_tbajm,angle_tbgm,angle_tbgjm,angle_x, angle_y, angle_z)
  
  meanstd <-cbind(meanstd_a, meanstd_b, meanstd_c)
  
  
  ## Uses descriptive activity names to name the activities 
  ## in the data set
  
  a <-nrow(my)
  for (i in 1:a)
  {
    if (my[i,1]=="1")
    {
      my[i,1] <-"walking"
    }
    else if(my[i,1]=="2")
    {
      my[i,1] <-"walking_upstairs"
    }
    else if(my[i,1]=="3")
    {
      my[i,1] <-"walking_downstairs"
    }
    else if(my[i,1]=="4")
    {
      my[i,1] <-"sitting"
    }
    else if(my[i,1]=="5")
    {
      my[i,1] <-"standing"
    }
    else 
    {
      my[i,1] <-"laying"
    }
  }
  
  ## mergethe s and y matric with mean and std data set
  
  
  msy <-paste(ms[,1],my[,1], sep="_")
  measurement_meanstd <-data.frame(cbind(msy,ms,meanstd))
  
  str(measurement_meanstd)
  write.table(measurement_meanstd, "measurement_meanstd.txt", sep=" ")
  
  ## make the column name
  co1 <-c("x_tBodyAcc_mean", "y_tBodyAcc_mean", "z_tBodyAcc_mean", "x_tBodyAcc_std", "y_tBodyAcc_std", "z_tBodyAcc_std")
  co2 <-c("x_tGravityAcc_mean", "y_tGravityAcc_mean", "z_tGravityAcc_mean", "x_tGravityAcc_std", "y_tGravityAcc_std", "z_tGravityAcc_std")
  co3 <-c("x_tBodyAccJerk_mean", "y_tBodyAccJerk_mean", "z_tBodyAccJerk_mean","x_tBodyAccJerk_std", "y_tBodyAccJerk_std", "z_tBodyAccJerk_std")
  co4 <-c("x_tBodyGyro_mean", "y_tBodyGyro_mean", "z_tBodyGyro_-mean", "x_tBodyGyro_std", "y_tBodyGyro_std", "z_tBodyGyro-std") 
  co5 <-c("x_tBodyGyroJerk_mean", "y_tBodyGyroJerk_mean", "z_tBodyGyroJerk_mean", "x_tBodyGyroJerk_std", "y_tBodyGyroJerk_std", "z_tBodyGyroJerk_std")
  co6 <-c("tBodyAccMag_mean","tBodyAccMag_std","tGravityAccMag_mean", "tGravityAccMag_std","tBodyAccJerkMag_mean","tBodyAccJerkMag_std")
  co7 <-c("tBodyGyroMag_mean", "tBodyGyroMag_std","tBodyGyroJerkMag_mean", "tBodyGyroJerkMag_std")
  co8 <-c("x_fBodyAcc_-mean", "y_fBodyAcc-mean","z_fBodyAcc_mean","x_fBodyAcc_std", "y_fBodyAcc_std","z_fBodyAcc_std")
  co9 <-c("x_fBodyAcc_meanFreq", "y_fBodyAcc_meanFreq", "z_fBodyAcc_meanFreq")
  co10 <-c("x_fBodyAccJerk_mean", "y_fBodyAccJerk_mean", "z_fBodyAccJerk_mean","x_fBodyAccJerk_std", "y_fBodyAccJerk_std", "z_fBodyAccJerk_std")
  co11 <-c("x_fBodyAccJerk_meanFreq", "y_fBodyAccJerk_meanFreq", "z_fBodyAccJerk_meanFreq")
  co12 <-c("x_fBodyGyro_mean", "y_fBodyGyro_mean", "z_fBodyGyro_mean", "x_fBodyGyroc_std", "y_fBodyGyroc_std", "z_fBodyGyroc_std")
  co13 <-c("x_fBodyGyro-meanFreq", "y_fBodyGyro_meanFreq", "z_fBodyGyro_meanFreq", "fBodyAccMag_mean", "fBodyAccMag_std")         
  co14 <-c("fBodyAccMag_meanFreq", "fBodyBodyAccJerkMag_mean", "fBodyBodyAccJerkMag_std","fBodyBodyAccJerkMag2_mean")
  co15 <-c("fBodyBodyGyroMag_mean", "fBodyBodyGyroMag_std", "fBodyBodyGyroMag_meanFreq", "fBodyBodyGyroJerkMag_mean", "fBodyBodyGyroJerkMag_std")
  co16 <-c("fBodyBodyGyroJerkMag_meanFreq", "angle(tBodyAccMean,gravity)", "angle(tBodyAccJerkMean),gravityMean)")
  co17 <-c("angle(tBodyGyroMean,gravityMean)", "angle(tBodyGyroJerkMean,gravityMean")
  co18 <-c("angle(X,gravityMean)", "angle(Y,gravityMean)", "angle(Z,gravityMean)")
  colname <-c("subject_activity","subject", co1,co2,co3,co4,co5,co6,co7,co8,co9,co10,co11,co12,co13,co14,co15,co16,co17,co18)
  colnames(measurement_meanstd) <-colname
                   
  oo <-order(measurement_meanstd[,2],decreasing=FALSE)
  measurement_mean_s<-measurement_meanstd[oo,]
  measurement_means <-measurement_mean_s[,-2]
  ## calculate the means
  
  s <-split(measurement_means, measurement_means$subject_activity)
  measurement_ms <-sapply(s,function(measurement_meanstd) colMeans(measurement_meanstd[,-1]))
  measurement_mes <-t(measurement_ms)
 
  subject_activity <-levels(factor(msy))

  measurement_meas <-data.frame(cbind(subject_activity,measurement_mes))
  
  write.table(measurement_meas, "measurement_mean_std.txt", sep=" ", row.name=FALSE)
  
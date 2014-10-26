




## main
main<-function(){
  ## part1: merging data
  data<-merge();
  ## part2: extract mean and std
  data<-extract(data);
  ##part3: descriptive names to activities
  data[,2]<-sapply(data[,2],disAct);
  
  ##step4: assign column names according based on the features directory
  data<-nameCol(data);
  
  ##part5: calculating the averages by the "subject" and "activity" columns
  createAvgSet(data)
  
  return(data);
}



merge<-function(){

X_one<-rbind(read.table("UCI HAR Dataset/train/X_train.txt"), read.table("UCI HAR Dataset/test/X_test.txt"));
Y_one<-rbind(read.table("UCI HAR Dataset/train/Y_train.txt"), read.table("UCI HAR Dataset/test/Y_test.txt"));
subject_one<-rbind(read.table("UCI HAR Dataset/train/subject_train.txt"), read.table("UCI HAR Dataset/test/subject_test.txt"));

data<-cbind(subject_one, Y_one, X_one);
return(data);

}

extract<-function(data){
  names<-read.table("UCI HAR Dataset/features.txt")[2];
  
  z<-union(grep("std",names[1:563,]), grep("mean",names[1:563,]));
  z<-z[order(z)];
  data<-data[,c(1,2,z+2)];
  return(data);
  
}

disAct<-function(a){
  if(a==1){
    a<-"WALKING";
  }
  if(a==2){
    a<-"WALKING UPSTAIRS";
  }
  if(a==3){
    a<-"WALKING DOWNSTAIRS";
  }
  if(a==4){
    a<-"SITTING";
  }
  if(a==5){
    a<-"STANDING";
  }
  if(a==6){
    a<-"LAYING";
  }
  return(a);
  
}


nameCol<-function(data){
  names<-read.table("UCI HAR Dataset/features.txt")[2];
  z<-union(grep("std",names[1:563,]), grep("mean",names[1:563,]));
  names<-names$V2[z[order(z)]];
  
  colnames(data)<-c("subject", "activity",as.character(names));
  
  return(data);
  
}

createAvgSet<-function(data){
  fd<-aggregate(dat4, by=list(dat4[,1],dat4[,2]), FUN=mean, na.rm=TRUE);
  fd[,3]<-NULL;
  fd[,4]<-NULL;
  write.table(fd,"FinalDataset.txt",row.name=FALSE)

}


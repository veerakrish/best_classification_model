library(readr)
training_data<-read_csv("TR1.csv")
test_data<-training_data[,-7]
library('rpart')
library('rpart.plot')
#stage 1
mm1<-rpart(Class~Sub1+Sub2+Sub3,data=training_data)
mm2<-rpart(Class~Sub4+Sub5+Sub6,data=training_data)
predictions1<-predict(mm1,test_data,type="class")
predictions2<-predict(mm2,test_data,type="class")
acop<-training_data$Class
acop<-as.factor(acop)
predictions1<-as.integer(predictions1)
predictions2<-as.integer(predictions2)
acop<-as.integer(acop)
iv1<-which(acop-predictions1 == -1)
iv2<-which(acop-predictions2 == -1)
iv<-as.data.frame(iv1)
iv<-cbind(iv,iv2)

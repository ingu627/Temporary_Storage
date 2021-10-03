train<- read.csv("f:/data/titanic/train.csv")
test<- read.csv("f:/data/titanic/test.csv")

str(train)
train<-train[,-c(4,9,11)]
str(test)
test<-test[,-c(3,8,10)]

train$Sex
test$Sex
#male -> 0, female -> 1

# table(train$Sex)
# female   male 
# 314    577 
# table(test$Sex)
# female   male 
# 152    266 
sum(is.na(train$Sex))
sum(is.na(test$Sex))

train$Sex <- ifelse(train$Sex == 'male', 1, 0)
test$Sex <- ifelse(test$Sex == 'male', 1, 0)
train$Sex


head(train,3)

table(train$Embarked)
sum(is.na(train$Embarked))
str(train)
#Embarked가 ""인 데이터 행 출력
train[train$Embarked == "",]$Embarked<-"C"

str(train)

#승선 항구별 Fare의 평균 출력
# class(tapply(train$Fare, train$Embarked, mean))
# class(aggregate(data=train, Fare ~ Embarked, mean))
# train %>% group_by(Embarked) %>% 
#   summarise(fare_mean = mean(Fare))
# 
# train %>% 
#   group_by(Embarked) %>%  
#   select(Fare) %>% 
#   summarise(mean(Fare))

#train$Embarked, test$Embarked
#C:0, Q:1, S:2로 변경하여 저장

train$Embarked <- ifelse(train$Embarked=="C",0,
                         ifelse(train$Embarked=="Q",1,2))

test$Embarked <- ifelse(test$Embarked=="C",0,
                        ifelse(test$Embarked=="Q",1,2))

head(train,3)
str(train)

#na를평균나이로 대체
sum(is.na(train$Age))

train$Age

train_age<-na.omit(train$Age)
train_age_avg<-mean(train_age)
train$Age[is.na(train$Age)]<-train_age_avg

sum(is.na(test$Age))

test_age<-na.omit(test$Age)
test_age_avg<-mean(test_age)
test$Age[is.na(test$Age)]<-test_age_avg

sum(is.na(train$Fare))
sum(is.na(test$Fare))

test_fare<-na.omit(test$Fare)
test_fare_avg<-mean(test_fare)
test$Fare[is.na(test$Fare)]<-test_fare_avg

sum(is.na(test$Fare))

# train$Age
# 18세 미만 -> 1
# 18세 이상 -> 0
train$Age<-ifelse(train$Age<18, 1, 0)
test$Age<-ifelse(test$Age<18, 1, 0)

normalize<-function(x){
  num <- x -min(x)
  denom<-max(x)-min(x)
  return (num/denom)
}

train$Pclass<-normalize(train$Pclass)
test$Pclass<-normalize(test$Pclass)

head(train,3)

train$Fare<-normalize(train$Fare)
test$Fare<-normalize(test$Fare)

head(train,3)

survived<-train$Survived
passengers<-test$PassengerId

train<-train[, -c(1,2,6,7,9)]
test<-test[, -c(1,5,6,8)]

library(class)
res<-knn(train, test, survived, k=25)
res
submission<-data.frame(PassengerId=passengers, Survived=res)
submission
str(submission)
write.csv(submission, "submission.csv", row.names = FALSE)








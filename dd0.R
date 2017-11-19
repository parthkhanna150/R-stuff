library(dpylr)

data_set = read.csv("NYC-vehicle-collisions.csv")
data_set$DATETIME = paste(data_set$DATE,data_set$TIME)
data_set = data_set[,-1]
data_set$DATE_TMP = as.Date(data_set$DATE, format ='%m/%d/%Y')
data_set$DATE = data_set$DATE_TMP
data_set = [, -30]

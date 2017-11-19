library(dplyr)
View(data_set)
library(dplyr)
data_set = read.csv("nyc-subway-turnstile-and-weather.csv.xlsx")
View(data_set)
data_set = read.csv("nyc-subway-turnstile-and-weather.csv")
View(data_set)
data_set = data_set[,-1]
data_set = read.csv("NYC-vehicle-collisions.csv")
data_set = data_set[,-1]
View(data_set)
View(data_set)
data_set = read.csv("NYC-vehicle-collisions.csv")
data_set = data_set[,-1]
null = dplyr::filter(data_set, BOROUGH ==  NULL)
null = dplyr::filter(data_set, is.null(BOROUGH)==TRUE)
null = dplyr::filter(data_set, is.null(BOROUGH))
null = dplyr::filter(data_set, BOROUGH!=1 | BOROUGH!=2 | BOROUGH!=3 | BOROUGH!=4 | BOROUGH!=5)
View(null)
null = dplyr::filter(data_set, BOROUGH!=1 & BOROUGH!=2 & BOROUGH!=3 & BOROUGH!=4 & BOROUGH!=5)
null = dplyr::filter(data_set, BOROUGH != '1' & BOROUGH != '2' & BOROUGH != '3' & BOROUGH != '4' & BOROUGH != '5')
data_set = read.csv("NYC-vehicle-collisions.csv")
View(data_set)
data_set = dplyr::mutate(data_set, DATETIME = DATE+TIME)
data_set = dplyr::mutate(data_set, DATETIME = DATE.concat(TIME)
_
data_set = dplyr::mutate(data_set, DATETIME = DATE.concat(TIME))
data_set = dplyr::mutate(data_set, DATETIME = data_set[2:3])
data_set = dplyr::mutate(data_set, DATETIME = c(2,3)
)
data_set$DATETIME = paste(data_set$DATE,data_set$TIME)
View(data_set)
data_set = data_set[,-1]
data_set$DATETIME = as.numeric(as.POSIXct(DATETIME))
data_set$unixtime = as.numeric(as.POSIXct(DATETIME))
data_set$unixtime = as.numeric(as.POSIXct())
data_set$DATE = as.Date(data_set$DATE, format = '%d-%m-%y')
View(data_set)
data_set = read.csv("NYC-vehicle-collisions.csv")
View(data_set)
View(data_set)
data_set$DATE_TMP = as.Date(data_set$DATE, format ='%d/%m/%Y')
data_set$DATE_TMP = as.Date(data_set$DATE, format ='%d/%m/%Y')
View(data_set)
data_set$DATE_TMP = as.Date(data_set$DATE, format ='%m/%d/%Y')
View(data_set)
data_set$DATE = data_set$DATE_TMP
data_set$DATE = data_set$DATE_TMP
data_set = [, -30]
data_set = data_set[, -30]
View(data_set)
data_set$DATETIME = as.numeric(as.POSIXct(DATE))
data_set$DATETIME = as.numeric(as.POSIXct($DATE))
data_set$DATETIME = as.numeric(as.POSIXct(DATE))
data_set$DATETIME = as.numeric(as.POSIXct(DATE))
data_set$DATETIME = as.numeric(as.POSIXct(data_set$DATE))
View(data_set)
data_set = data_set[-c(1:4),]
data_set$DATE = data_set$DATETIME
data_set = data_set[,-30]
View(data_set)
data_set = data_set[,-1]
View(data_set)
function (x) {}
function (x) { }
function (x) { x<-  }
persons_killed = dplyr::filter(data_set, `PERSONS.KILLED` != 0)
View(persons_killed)
null = dplyr::filter(data_set, data_set$BOROUGH == NULL)
null = dplyr::filter(data_set, data_set$BOROUGH == NULL)
persons_injured = dplyr::filter(data_set, `PERSONS.INJURED` != 0)
persons_injured = dplyr::filter(data_set, `CYCLISTS.INJURED` != 0)
persons_injured = dplyr::filter(data_set, `CYCLISTS.INJURED` != 0)
persons_injured = dplyr::filter(data_set, `PERSONS.INJURED` != 0)
cyclists_injured = dplyr::filter(data_set, `CYCLISTS.INJURED` != 0)
motorists_killed = dplyr::filter(data_set, `MOTORISTS.KILLED` != 0)
motorists_injured = dplyr::filter(data_set, `MOTORISTS.INJURED` != 0)
pedestrians_injured = dplyr::filter(data_set, `PEDESTRIANS.INJURED` != 0)
pedestrians_killed = dplyr::filter(data_set, `PEDESTRIANS.KILLED` != 0)
tmp = read.csv("NYC-vehicle-collisions.csv")
View(tmp)
date = tmp[,2]
date = date[-c(1:4),]
data_set$ELIAS = as.Date(data_set$DATE)
data_set$ELIAS = as.Date(data_set$DATE)
data_set$ELIAS = as.Date(as.POSIXct(data_set$DATE))
data_set$ELIAS = as.Date(as.POSIXct(data_set$DATE, origin="1970-01-01"))
data
data_set = read.csv("NYC-vehicle-collisions.csv")
data_set = data_set[,-1]
data_set$DATE_TMP = as.Date(data_set$DATE, format ='%m/%d/%Y')
data_set$DATE = data_set$DATE_TMP
data_set = data_set[-c(1:4),]
data_set$ELIAS = as.numeric(as.POSTXct(data_set$DATETIME))
data_set$ELIAS = as.numeric(as.POSIXct(data_set$DATETIME))
data_set$ELIAS = as.numeric(as.POSIXct(paste(data_set$DATETIME, " EST"))
)
as.numeric(as.POSIXct("3/17/2015 16:45"))
as.numeric(as.POSIXct("3/17/2015 16:45 EST"))
data_set$ELIAS = as.numeric(as.POSIXct(paste(data_set$DATE_TMP, paste( data_set$TIME, " EST")))
)
as.numeric(as.POSIXct("2015-03-19 01:2 EST"))
as.numeric(as.POSIXct("2015-03-19 01:3 EST"))
data_set$ELIAS2 = paste(data_set$DATE_TMP, paste(data_set$TIME, "EST"))
data_set$ELIAS3= as.numeric(as.POSIXct(data_set$ELIAS2))
as.numeric(as.POSIXct("2015-03-16 11:50 EST"))
data_set$ELIAS3= as.numeric(as.POSIXct(ELIAS2))
data_set$ELIAS3= as.numeric(as.POSIXct($ELIAS2))
data_set$ELIAS3= as.numeric(as.POSIXct(data_set$ELIAS2))

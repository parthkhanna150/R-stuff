# Goal: 
# 1) Analyse hourly and seasonal patterns with respect the collision factors and 
#    to possibly figure out the kind of areas that are accident 
#    prone in particular circumstances. Then looking at different parameters,
#    suggest ways to reduce accidents

# Some surprising observations:
#    Pedestrian injured/killed number highest
#    Highest number of collisions during afternoon
#    

data_set = read.csv("NYC-vehicle-collisions.csv")
data_set = data_set[,-1]
data_set = data_set[,-7]
data_set = data_set[ , -which(names(data_set) %in% c("OFF.STREET.NAME","VEHICLE.2.FACTOR","VEHICLE.3.FACTOR", "VEHICLE.4.FACTOR", "VEHICLE.5.FACTOR","VEHICLE.3.TYPE", "VEHICLE.4.TYPE", "VEHICLE.5.TYPE"))]
main_boroughs = dplyr::filter(data_set, BOROUGH==1 | BOROUGH==2 | BOROUGH==3 | BOROUGH==4 | BOROUGH==5)
# factor_inattention = main_boroughs[ grep("INATTENTION" | grep("DISTRACTION"), main_boroughs$VEHICLE.1.FACTOR),]

main_boroughs = dplyr::mutate(main_boroughs, hour = gsub("^(.*?):.*", "\\1", main_boroughs$TIME))
main_boroughs = dplyr::mutate(main_boroughs, month = substr(main_boroughs$DATE, 1, 2))

all_injured = dplyr::filter(main_boroughs, `PERSONS.INJURED` != 0)
all_killed = dplyr::filter(main_boroughs, `PERSONS.KILLED` != 0)
cyclists_injured = dplyr::filter(main_boroughs, `CYCLISTS.INJURED` != 0)
cyclists_killed = dplyr::filter(main_boroughs, `CYCLISTS.KILLED` != 0)
motorists_injured = dplyr::filter(main_boroughs, `MOTORISTS.INJURED` != 0)
motorists_killed = dplyr::filter(main_boroughs, `MOTORISTS.KILLED` != 0)
pedestrians_injured = dplyr::filter(main_boroughs, `PEDESTRIANS.INJURED` != 0)
pedestrians_killed = dplyr::filter(main_boroughs, `PEDESTRIANS.KILLED` != 0)

main_boroughs$hour = as.numeric(main_boroughs$hour)
midnight = dplyr::filter(main_boroughs, hour >= 1 & hour <= 6)
morning = dplyr::filter(main_boroughs, hour >= 7 & hour <= 12)
afternoon = dplyr::filter(main_boroughs, hour >= 13 & hour <= 18)
# evening = dplyr::filter(main_boroughs, hour >= 19 & hour <=0)
# didn't work cause the number don't make sense
evening = dplyr::filter(main_boroughs, !(hour >= 1 & hour <= 18))

main_boroughs$month = as.numeric(main_boroughs$month)
temperatures = read.csv("NYC-temperatures.csv")
names(main_boroughs)[names(main_boroughs) == "month"] = "Month"
main_boroughs_temp = dplyr::inner_join(main_boroughs, temperatures, by = "Month")
main_boroughs_temp = dplyr::mutate(main_boroughs_temp, time_of_day = ifelse(hour %in% 0:5, "Midnight",
ifelse(hour %in% 6:12, "Morning", 
ifelse(hour %in% 13:18, "Afternoon","Evening"))))
main_boroughs_temp = main_boroughs_temp[ , -which(names(main_boroughs_temp) %in% c("Avg..Precip.","Record.Low", "Record.High"))]
main_boroughs_temp = dplyr::mutate(main_boroughs_temp, season = ifelse(Month %in% 5:8, "Summer",
ifelse(Month %in% 9:11, "Fall","Winter")))
winter = dplyr::filter(main_boroughs_temp, season == 'Winter')
fall = dplyr::filter(main_boroughs_temp, season == 'Fall')
summer = dplyr::filter(main_boroughs_temp, season == 'Summer')


# library(ggplot2)
# temp_plot_ = ggplot(factor_distraction, aes(VEHICLE.1.FACTOR, PERSONS.KILLED))
# temp_plot_ + geom_point()
# Goal: 
# 1) Analyse hourly patterns with respect the collision factors and 
#    map them to possibly figure out the kind of areas that are accident 
#    prone and further suggest ways to reduce accidents

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
main_boroughs$hour = as.numeric(main_boroughs$hour)

all_injured = dplyr::filter(main_boroughs, `PERSONS.INJURED` != 0)
all_killed = dplyr::filter(main_boroughs, `PERSONS.KILLED` != 0)
cyclists_injured = dplyr::filter(main_boroughs, `CYCLISTS.INJURED` != 0)
cyclists_killed = dplyr::filter(main_boroughs, `CYCLISTS.KILLED` != 0)
motorists_injured = dplyr::filter(main_boroughs, `MOTORISTS.INJURED` != 0)
motorists_killed = dplyr::filter(main_boroughs, `MOTORISTS.KILLED` != 0)
pedestrians_injured = dplyr::filter(main_boroughs, `PEDESTRIANS.INJURED` != 0)
pedestrians_killed = dplyr::filter(main_boroughs, `PEDESTRIANS.KILLED` != 0)

midnight = dplyr::filter(main_boroughs, hour >= 1 & hour <= 6)
morning = dplyr::filter(main_boroughs, hour >= 7 & hour <= 12)
afternoon = dplyr::filter(main_boroughs, hour >= 13 & hour <= 18)
# evening = dplyr::filter(main_boroughs, hour >= 19 & hour <=0)
# didn't work cause the number don't make sense
evening = dplyr::filter(main_boroughs, !(hour >= 1 & hour <= 18))

# library(ggplot2)
# temp_plot_ = ggplot(factor_distraction, aes(VEHICLE.1.FACTOR, PERSONS.KILLED))
# temp_plot_ + geom_point()


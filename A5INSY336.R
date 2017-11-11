#----------------------------------Part I----------------------------------
install.packages("dplyr")
library(dplyr)
#copy over the csv file to the current working directory, then read it:
data_set = read.csv(file="tmdb_5000_movies.csv", header = TRUE)

#1
high_vote_share = data_set %>% group_by(original_language) %>% summarise(max(vote_average))

#2
data_set = dplyr::full_join(data_set, high_vote_share, by="original_language")

#3
avg_budget = data_set %>% group_by(original_language) %>% summarise(mean(budget))

#4
new_data_frame = dplyr::full_join(data_set, avg_budget, by="original_language")

#5
new_data_frame = dplyr::mutate(new_data_frame, diff_vote = (`max(vote_average)` - vote_average))

#6
new_data_frame = dplyr::mutate(new_data_frame, diff_budget = (budget - `mean(budget)`))
 
#7
diff_vote = c(new_data_frame$diff_vote)
diff_budget = c(new_data_frame$diff_budget)
correlation = cor(diff_vote, diff_budget)

#----------------------------Part II---------------------------------------

data_set_2 = read.csv(file="tmdb_5000_movies.csv", header = TRUE)

#1
data_set_2 = subset(data_set_2, (budget != 0))
data_set_2 = subset(data_set_2, (!is.null(budget)))

#2
new_data_frame_2 = data_set_2 %>% mutate(rank = dense_rank(budget))
#num_rank = dplyr::count(new_data_frame_2, rank)
#num_rank is a table of 435 observations (of 2 variables)
new_data_frame_3 = dplyr::mutate(new_data_frame_2, percentile = (rank/435)*100)
percentile_top = dplyr::filter(new_data_frame_3, new_data_frame_3$percentile >= 90)

#3
percentile_51 = dplyr::filter(new_data_frame_3, new_data_frame_3$percentile > 51 & new_data_frame_3$percentile < 52)

#4
vote_avg_top = mean(percentile_top$vote_average)

#5
vote_avg_51 = mean(percentile_51$vote_average) 
vote_avg_51top_diff = vote_avg_51 - vote_avg_top

#----------------------------------Part I----------------------------------
install.packages("dplyr")
library(dplyr)

data_set = read.csv(file="tmdb_5000_movies.csv", header = TRUE)

high_vote_share = data_set %>% group_by(original_language) %>% summarise(max(vote_average))
data_set = dplyr::full_join(data_set, high_vote_share, by="original_language")
avg_budget = data_set %>% group_by(original_language) %>% summarise(mean(budget))
new_data_frame = dplyr::full_join(data_set, avg_budget, by="original_language")
new_data_frame = dplyr::mutate(new_data_frame, diff_vote = (`max(vote_average)` - vote_average))
new_data_frame = dplyr::mutate(new_data_frame, diff_budget = (budget - `mean(budget)`))
 
diff_vote = c(new_data_frame$diff_vote)
diff_budget = c(new_data_frame$diff_budget)
cor(diff_vote, diff_budget)

#----------------------------Part II---------------------------------------

data_set_2 = read.csv(file="tmdb_5000_movies.csv", header = TRUE)
data_set_2 = subset(data_set_2, (budget != 0))
data_set_2 = subset(data_set_2, (!is.null(budget)))

##movies with high budgets (percentile)
new_data_frame_2 = data_set_2 %>% mutate(rank = dense_rank(budget))
new_data_frame_2 = dplyr::mutate(new_data_frame_2, percentile = (rank/435)*100)

##Top 80% based on budget
Top_80Percentile=dplyr::filter(new_data_frame_2,new_data_frame_2$percentile>=80)
Top_90Percentile=dplyr::filter(new_data_frame_2,new_data_frame_2$percentile>=90)

##51st percentile
Top_51Percentile=dplyr::filter(new_data_frame_2,new_data_frame_2$percentile>51 & new_data_frame_2$percentile<52)
rm(Query)

##Mean of vote average for top 90 percentile of the budget

mean(Top_80Percentile$vote_average)
mean(Top_90Percentile$vote_average)
##Mean of vote average for movies in the 51st percentile

mean(Top_51Percentile$vote_average) 


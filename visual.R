library(ggplot2)
library(dplyr)
data_set = read.csv("tmdb_5000_movies.csv")
data_set_clean1 = dplyr::filter(data_set, budget > 0 & revenue > 0 & (original_language == 'ja' | original_language == 'hi' | original_language == 'vi'))
plot_name = ggplot(data_set_clean1, aes(budget, revenue))
plot_name + geom_point()

# better data integrity - remove outliers
data_set_clean1$l_budget = log(data_set_clean1$budget)
data_set_clean1$l_revenue = log(data_set_clean1$revenue)
plot_name= ggplot(data_set_clean1, aes(l_budget, l_revenue))
plot_name + geom_point(aes(colour = factor(original_language)))

# reduce data ink
plot_name + geom_point(aes(colour = factor(original_language))) + theme_classic()

# box-plot summary
box_plot = ggplot(data_set_clean1, aes(original_language, l_revenue))
box_plot + geom_boxplot()

# scatter-plots, multiplot-grid
viet_movie = dplyr::filter(data_set_clean1, original_language == "vi")
plot_name= ggplot(viet_movie, aes(l_budget, l_revenue)) 
p1 = plot_name + geom_point() + theme_classic()

hindi_movie = dplyr::filter(data_set_clean1, original_language == "hi")
plot_name= ggplot(hindi_movie, aes(l_budget, l_revenue)) 
p2 = plot_name + geom_point() + theme_classic()

jap_movie = dplyr::filter(data_set_clean1, original_language == "ja")
plot_name= ggplot(jap_movie, aes(l_budget, l_revenue))
p3 = plot_name + geom_point() + theme_classic()

library(grid)
grid.arrange(p1, p2, p3)

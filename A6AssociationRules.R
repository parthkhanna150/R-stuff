#install.packages("arules")
library(arules)

course_data = read.csv("Coursetopics.csv")
new_df = as(as.matrix(course_data), 'transactions')
rules = apriori(new_df, parameter = list(supp = 0.01, conf = 0.01, target = "rules"))
inspect(sort(rules, by = "lift"))

#install.packages("arulesViz")
library(arulesViz)

regression = subset(rules, subset = lhs %in% "Regression")
plot(regression, method = "graph")
inspect(regression)
forecast = subset(rules, subset = lhs %in% "Forecast")
inspect(forecast)
plot(forecast, method = "graph")
regression_forecast = subset(rules, subset = lhs %in% "Regression" & lhs %in% "Forecast")

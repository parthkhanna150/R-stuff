install.packages("arules")
library(arules)

# cosmetics_data$Trans. = NULL
# or
# cosmetics_data = cosmetics_data[,-1]
# or
# cosmetics_data = dplyr::select(cosmetics_data, -Trans.)
# or
cosmetics_data = cosmetics_data %>% select(-one_of('Trans.'))

new_df = as(as.matrix(cosmetics_data), 'transactions')

rules = apriori(new_df, parameter = list(supp = 0.2, conf = 0.5, target = "rules"))
inspect(rules)
# inspect(sort(rules, by = "lift"))

install.packages("arulesViz")
library(arulesViz)

plot(rules, method = "graph")
mascara = subset(rules, subset = lhs %in% "Mascara")
# inspect(mascara)
plot(mascara, method = "graph")

concealer = subset(rules, subset = lhs %in% "Concealer")
plot(concealer, method = "graph")

concealer_rhs = subset(rules, subset = rhs %in% "Concealer")
inspect(concealer_rhs)
plot(concealer_rhs, method = "graph")

lift2 = subset(rules, subset = lift>2)
inspect(lift2)
plot(lift2, method = "graph")




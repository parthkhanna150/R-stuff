library(dplyr)
oct_tweets = dplyr::filter(trump_data1, month ==9)
first_5 = dplyr::slice(trump_data1, 1:5)

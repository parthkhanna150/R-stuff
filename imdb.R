install.packages("rvest")
library(rvest)

url = "http://www.imdb.com/movies-in-theaters/"
webpage = read_html(url)
rank_data_html <- html_nodes(webpage,'time')
rank_data <- html_text(rank_data_html) 
head(rank_data)


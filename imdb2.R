#install.packages("rvest")
library(rvest)

url = "http://www.imdb.com/search/title?count=100&release_date=2017,2017&title_type=feature"
webpage = read_html(url)
genre_data_html <- html_nodes(webpage,'.genre')
genre_data <- html_text(genre_data_html) 
genre_data = gsub("\n", "", genre_data)
genre_data = trimws(genre_data)
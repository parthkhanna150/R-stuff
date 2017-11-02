library(rvest)
library(dplyr)
url = "https://weather.gc.ca/city/pages/qc-147_metric_e.html"
webpage = read_html(url)

day_nodes = html_nodes(webpage, ".high")
day_text = html_text(day_nodes)
# removing only day-time temperature day from the variable
day_text = day_text[c(1,3,5,7,9)]
day_text_clean = gsub("\n", "", day_text)
day_text_clean = trimws(day_text_clean)
# day_text_clean

night_nodes = html_nodes(webpage, ".low")
night_text = html_text(night_nodes)
# removing only night-time temperature day from the variable
night_text = night_text[c(3,5,7,9,11)]
night_text_clean = gsub("\n", "", night_text)
night_text_clean = trimws(night_text_clean)
# night_text_clean

date_nodes = html_nodes(webpage, '.div-row1')
date_text = html_text(date_nodes)
# collecting only the 5 dates with both nighttime and daytime temperatures
date_text = date_text[2:6]
# date_text
date_text_clean = gsub("\n              Fri\n              ","", date_text)
date_text_clean = gsub("\n              Sat\n              ","", date_text_clean)
date_text_clean = gsub("\n              Sun\n              ","", date_text_clean)
date_text_clean = gsub("\n              Mon\n              ","", date_text_clean)
date_text_clean = gsub("\n              Tue\n              ","", date_text_clean)
date_text_clean = trimws(date_text_clean)
# date_text_clean

difference = day_text_clean - night_text_clean
temperature_dataframe = data.frame(date_text_clean, day_text_clean, night_text_clean, difference)
colnames(temperature_dataframe) = c("Date", "Max Temperature", "Min Temperature", "Difference")
# temperature_dataframe

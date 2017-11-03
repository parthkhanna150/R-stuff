library(rvest)
url= "https://weather.gc.ca/city/pages/qc-147_metric_e.html"
webpage = read_html(url)

day_nodes = html_nodes(webpage, '.high')
night_nodes = html_nodes(webpage, '.low')
date_nodes = html_nodes(webpage, '.div-row1')

day_text = html_text(day_nodes)
night_text = html_text(night_nodes)
date_text = html_text(date_nodes)

day_temp = day_text[c(1,3,5,7,9)]
night_temp = night_text[c(3,5,7,9,11)]

max_temp = gsub("\n","",day_temp)
min_temp = gsub("\n","",night_temp)
max_temp = gsub("??C","",max_temp)
min_temp = gsub("??C","",min_temp)

date_text = gsub("\n","",date_text)
date_text = trimws(date_text)
date_text = date_text[2:6]

max_temp_num = as.numeric(max_temp)
min_temp_num = as.numeric(min_temp)

difference = max_temp_num - min_temp_num
dataframe_final = date.frame(date_text, max_temp_num, min_temp_num, difference)
#dataframe_final

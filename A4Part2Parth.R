install.packages("rvest")
library(rvest)
yelp_link = "https://www.yelp.ca/search?find_desc=Restaurants&find_loc=Montreal%2C+QC&ns=1"
yelp_names_html = read_html(yelp_link)
yelp_names_html = html_nodes(yelp_names_html, "#super-container .js-analytics-click span")
yelp_names_text = html_text(yelp_names_html)
yelp_names_final = yelp_names_text[2:11]

address = html_nodes(webpage, 'address')
address_clean = html_text(address)
address_clean = gsub("\n","", address_clean)
address_clean_trimmed = trimws(address_clean)
final_address = address_clean_trimmed[2:11]
# final_address

phone = html_nodes(webpage, '.biz-phone')
phone_clean = html_text(phone)
phone_clean = gsub("\n","", phone_clean)
phone_clean_trimmed = trimws(phone_clean)
final_phone = phone_clean_trimmed[2:11]
# final_phone
 
costs = html_nodes(webpage, '.price-range')
costs_clean = html_text(costs)
costs_clean_trimmed = trimws(costs_clean)
final_costs = costs_clean_trimmed
# final_costs

data_frame_data = data.frame(yelp_names_final, final_address, final_phone, final_costs)
restos_cheap = dplyr::filter(data_frame_data, final_costs == "$$")


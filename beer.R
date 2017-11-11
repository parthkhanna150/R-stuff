library(rvest)
url = "http://www.capitolbeer.com/the-beers/on-tap/"
webpage = read_html(url)

beer_pos_nodes = html_nodes(webpage, '#main .number')
beer_pos_text = html_text(beer_pos_nodes)

beer_names_nodes = html_nodes(webpage,'#main h2')
beer_names_text = html_text(beer_names_nodes)

beer_frame = data.frame(beer_pos_text, beer_names_text)
write.csv(beer_frame, file = "beer.csv")
beer
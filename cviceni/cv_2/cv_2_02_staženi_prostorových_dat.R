temp <- tempfile()
download.file("http://services.cuzk.cz/shp/stat/epsg-5514/1.zip",temp)

unzip(temp, exdir = here::here("raw_data"), junkpaths = TRUE)
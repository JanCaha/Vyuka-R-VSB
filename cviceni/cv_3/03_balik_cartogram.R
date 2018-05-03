library(tidyverse)
library(sf)
library(tmap)
library(cartogram)

data_okresy <- read_csv(here::here("raw_data", "data_okresy.csv"))
okresy <- st_read(here::here("raw_data", "OKRESY_P.shp"), stringsAsFactors = FALSE)

okresy <- okresy %>% 
  right_join(data_okresy, by = c("LAU1_KOD" = "nuts_kod"))


okresy <- as_Spatial(okresy)

okresy_cartogram <- cartogram(okresy, "ucast_procenta", itermax=5)

tm_shape(okresy_cartogram) +
  tm_polygons(col = "ucast_procenta")


okresy_cartogram_separate <- nc_cartogram(okresy, "ucast_procenta")

tm_shape(okresy_cartogram_separate) +
  tm_polygons(col = "ucast_procenta") +
tm_shape(okresy) +
  tm_borders()

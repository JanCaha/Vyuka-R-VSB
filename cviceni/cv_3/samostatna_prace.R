# minimální varianta, která splní požadavky
library(tidyverse)
library(sf)
library(tmap)

data_okresy <- read_csv(here::here("raw_data", "data_okresy.csv"))
okresy <- st_read(here::here("raw_data", "OKRESY_P.shp"), stringsAsFactors = FALSE)

View(okresy)
View(data_okresy)

okresy <- okresy %>% 
  right_join(data_okresy, by = c("LAU1_KOD" = "nuts_kod"))

tm_shape(okresy) +
  tm_polygons(col = "ucast_procenta", palette = "Reds")

ggplot(okresy, aes(ucast_procenta)) +
  geom_histogram()

kraje <- okresy %>% 
  group_by(NUTS3_KOD) %>% 
  summarise(volici = sum(zapsani_voliciu),
            vydane_obalky = sum(vydane_obalky)) %>% 
  mutate(ucast = (vydane_obalky / volici) * 100 )

tm_shape(kraje) +
  tm_polygons(col = "ucast", palette = "Reds")

library(sf)

okresy <- st_read(here::here("raw_data", "OKRESY_P.shp"), stringsAsFactors = FALSE)

okresy <- okresy %>% 
  right_join(data, by = c("LAU1_KOD" = "nuts_kod"))

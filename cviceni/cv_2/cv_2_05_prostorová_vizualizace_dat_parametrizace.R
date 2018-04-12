library(tidyverse)
library(sf)
library(tmap)

id_strana = 1

data_okresy <- read_csv(here::here("raw_data", "data_okresy.csv")) 
data_strany <- read_csv(here::here("raw_data", "data_strany.csv")) 
ciselnik_stran <- read_csv(here::here("raw_data", "ciselnik_strany.csv")) 

okresy <- st_read(here::here("raw_data", "OKRESY_P.shp"), 
                  stringsAsFactors = FALSE)

strana <- ciselnik_stran %>% 
  filter(strana_id == id_strana) %>% 
  pull(strana_nazev)

data <- data_strany %>% 
  filter(id_strany == id_strana)

okresy_volby <- okresy %>% 
  right_join(data, by = c("LAU1_KOD" = "nuts_kod"))

titulek_mapy <- paste0("Získaná procenta hlasů pro stranu:\n ", strana)

nazev_mapy <- paste0("volební_mapa_strany_", id_strana, ".png")

mapa <- 
tm_shape(okresy_volby) +
  tm_polygons(col = "hlasu_procenta", n = 5 , 
              style = "quantile", palette = "OrRd", 
              title = "Procenta hlasů \n (%)") +
tm_scale_bar(position = c("left", "bottom"), breaks = c(0, 50, 100), size = 0.75) + 
tm_layout(frame = FALSE,
          legend.title.size = 1.3,
          legend.text.size = 0.8, 
          legend.format = list(text.separator = "-"),
          legend.position = c(0.85, 0.6),
          main.title = titulek_mapy,
          main.title.position = "center")

save_tmap(mapa, here::here("produced_data", nazev_mapy))

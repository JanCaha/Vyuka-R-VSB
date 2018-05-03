library(raster)
library(tmap)
library(viridis)

dsm <-  raster(here::here("raw_data", "surface.tif"))

crs(dsm)
dsm

tm_shape(dsm) +
  tm_raster(palette = viridis(7)) +
  tm_layout(legend.outside = TRUE,
            legend.format = list(text.separator = "-"))

slope <- terrain(dsm, opt = "slope", unit = "degrees")
aspect <- terrain(dsm, opt = "aspect", unit = "degrees")
dsm_hillshade <- hillShade(slope, aspect, direction = 315, normalize = TRUE)

vis <- tm_shape(dsm) +
  tm_raster(palette = viridis(7)) +
  tm_shape(dsm_hillshade) +
  tm_raster(palette = "Greys", alpha = 0.3, legend.show = FALSE) +
  tm_layout(legend.outside = TRUE,
            legend.format = list(text.separator = "-"))

tmap_save(vis, here::here("produced_data", "vizualizace_rastru.png"))

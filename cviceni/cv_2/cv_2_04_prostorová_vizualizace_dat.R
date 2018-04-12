library(tmap)

tm_shape(okresy) +
  tm_polygons(col = "hlasu_procenta", n = 5 , style = "quantile",
              palette = "OrRd", title = "Procenta hlasů \n (%)") +
  tm_scale_bar(position = c("left", "bottom"), 
               breaks = c(0, 50, 100), size = 0.75) + 
  tm_layout(frame = FALSE,
            legend.title.size = 1.3,
            legend.text.size = 0.8, 
            legend.format = list(text.separator = "-"),
            legend.position = c(0.85, 0.6),
            main.title = "Získaná procenta hlasů pro stranu: \n STAROSTOVÉ A NEZÁVISLÍ",
            main.title.position = "center")


tmap_mode("view")
tm_shape(okresy) +
  tm_polygons(col = "hlasu_procenta", n = 5 , style = "quantile",
              palette = "OrRd", title = "Procenta hlasů \n (%)") +
  tm_scale_bar(position = c("left", "bottom"), 
               breaks = c(0, 50, 100), size = 0.75) + 
  tm_layout(frame = FALSE,
            legend.title.size = 1.3,
            legend.text.size = 0.8, 
            legend.format = list(text.separator = "-"),
            legend.position = c(0.85, 0.6),
            main.title = "Získaná procenta hlasů pro stranu: \n STAROSTOVÉ A NEZÁVISLÍ",
            main.title.position = "center")

tmap_mode("plot")
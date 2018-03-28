# --------------------------
# instalace a načtení balíků
# --------------------------

library(nycflights13)
library(ggplot2)
library(dplyr)

# --------------------------
# načtení dat a jejich zobrazení
# --------------------------

data(flights)
View(flights)

data(diamonds)
View(diamonds)

# --------------------------
# extrakce části dat
# --------------------------

# řádek
diamonds[1,]
# sloupec
diamonds$carat
# buňka
diamonds[1,2]
# několik řádků a sloupců
diamonds[c(1,5,7), c(1,2,3)]
# výběr podmínkou
diamonds[diamonds$color == "E", ]
diamonds[diamonds$price > 18800, ]

# --------------------------
# operace s daty pomocí balíku dplyr
# --------------------------

# bez využití pipeline, pouze funcí
filter(diamonds, price > 18800)

# s využitím pipeline
diamonds %>% filter(price > 18800)

diamonds %>% 
  slice(1)

diamonds %>% 
  slice(1:5)

diamonds %>% 
  slice(-5:-nrow(diamonds))

# dvě podmínky splněné současně
diamonds %>% 
  filter(price > 18800, cut == "Ideal")
# identický zápis
diamonds %>% 
  filter(price > 18800 & cut == "Ideal")

# alespoň jedna splěná podmínka
diamonds %>% 
  filter(price > 18800 | cut == "Ideal")

# komplexní podmínka
diamonds %>% 
  filter((price > 15000 | cut == "Ideal") & carat > 3)

# výběr pěti prvků s nejvyšší hodnotou proměnné carat
diamonds %>% 
  top_n(5, carat)

# výběr minima
diamonds %>% 
  top_n(-10, price)

diamonds %>% 
  top_n(10, desc(price))

# výběr prvků a atributů pro další zpracování
data_pro_dalsi_analyzu <- diamonds %>% 
  select(color, cut, price) %>% 
  filter(price > 15000)

# přidání sloupce
diamonds_new <- diamonds %>% 
  mutate(price_per_carat = price / carat)

# přidání sloupce
# v názvech proměnných v data frame lze použít i mezery a další znaky, 
# ale pak je nutné je vždy vkládat v ``
diamonds_new <- diamonds %>% 
  mutate(`price per carat` = price / carat)

# setřídění podle proměnné
diamonds_new <- diamonds_new %>% 
  arrange(desc(price_per_carat))
View(diamonds_new)

# setřídění podle více proměnných
diamonds_new <- diamonds_new %>% 
  arrange(desc(price), cut)
View(diamonds_new)

# vytvoření seskupených dat
diamonds_grouped <- diamonds %>% 
  group_by(color, cut)

# vytvoření seskupených dat a výpočet charakteristik pro jednotlivé skupiny
diamonds_grouped <- diamonds_grouped %>% 
  summarise(mean_price = mean(price),
            median_carat = median(carat),
            sum_price = sum(price),
            count = n())

# propojování dat - join
data("flights")
data("airlines")

joined_data <- flights %>% left_join(airlines, by = "carrier")
View(joined_data)
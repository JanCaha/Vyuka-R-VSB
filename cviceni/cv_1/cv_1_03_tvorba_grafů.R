# instace balíku
install.packages("here")

# pomocí toho příkazů se spustí daný soubor a dojde k interpretaci příkazů v něm
# v Global Environment se vytvoří proměnné
source(here::here("cviceni", "cv_1", "cv_1_02_analyza_dat.R"))

# základní jednoduchý graf
ggplot(diamonds_new, aes(carat, price)) +
  geom_point()

# doplnění grafu o barvu
ggplot(diamonds_new, aes(carat, price, color = color)) +
  geom_point()

# další položky grafu
ggplot(diamonds, aes(carat, price, color = color)) +
  geom_point() +
  scale_color_brewer(palette = "Set1") +
  scale_y_continuous(breaks = seq(0, 20000, by = 5000),
                     limits = c(0, 20000)) +
  labs(x = "Karáty", y = "Cena", color = "Barva", 
       title = "Porovnání ceny diamantů podle karátů a barvy") +
  theme_bw()

# --------------------------
# instalace a načtení balíků
# --------------------------

install.packages("nycflights13")
library(nycflights13)

install.packages(c("ggplot2", "dplyr", "gapminder"))
library(ggplot2)
library(dplyr)

# --------------------------
# tvorba proměnných, vektorů a seznamů proměnných
# --------------------------

promenna <- 1
promenna_1 <- 3.1415926
promenna_2 <- "textova proměnná"
promenna_3 <- TRUE

vektor_promennych <- c(1, 4, 7, 2, 5, 6,9, 15)
seznam_promennych <- list("a", 5, 8.45)

# --------------------------
# matematické operace
# --------------------------

x <- 2
y <- 4

vector_x <- c(5, 7, 2)

x + y
x - y
x * y 
x / y

z <- x * y

vector_x + vector_x

vector_z <- vector_x * vector_x
vector_z

# --------------------------
# funkce proměnných
# --------------------------

sin(x)

log(y, base = 3)

cos(vector_x)

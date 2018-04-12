library(tidyverse)

data_okresy <- read_csv(here::here("raw_data", "data_okresy.csv")) 
data_strany <- read_csv(here::here("raw_data", "data_strany.csv")) 
ciselnik_stran <- read_csv(here::here("raw_data", "ciselnik_strany.csv")) 

data <- data_strany %>% 
  filter(id_strany == 7)

library(tidyverse)

social <- read_csv("data-raw/users-by-social-media-platform.csv") %>%
  select(-Code)
colnames(social) <- c("platform", "year", "users")
social <- social %>%
  mutate(users = users / 1000000)
usethis::use_data(social)

endangered <- read_csv("data-raw/endangered_lang.csv")
colnames(endangered) <- c("id", "name", "name_fr", "name_es", "countries", "country_code", "iso", "degree", "alternate", "endonym", "speakers", "sources", "latitude", "longitude", "location")

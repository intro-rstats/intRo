library(tidyverse)

social <- read_csv("data-raw/users-by-social-media-platform.csv") %>%
  select(-Code)
colnames(social) <- c("platform", "year", "users")
social <- social %>%
  mutate(users = users / 1000000)
usethis::use_data(social)

endangered <- read_csv("data-raw/endangered_lang.csv")
colnames(endangered) <- c("id", "name", "name_fr", "name_es", "countries", "country_code", "iso", "degree", "alternate", "endonym", "speakers", "sources", "latitude", "longitude", "location")
usethis::use_data(endangered)

harry_potter <- read_csv("data-raw/harry_potter.csv")
usethis::use_data(harry_potter)

source("https://gist.githubusercontent.com/z3tt/301bb0c7e3565111770121af2bd60c11/raw/ae538a28f2701f261a9ccf4ad20377e1b345fdab/data-ggplot-evolution-vol1.r")
usethis::use_data(df_ratios)

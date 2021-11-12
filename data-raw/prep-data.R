library(tidyverse)

social <- read_csv("data-raw/users-by-social-media-platform.csv") %>%
  select(-Code)
colnames(social) <- c("platform", "year", "users")
social <- social %>%
  mutate(users = users / 1000000)
usethis::use_data(social)

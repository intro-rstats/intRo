library(tidyverse)

social <- read_csv("data-raw/users-by-social-media-platform.csv") %>%
  select(-Code)
colnames(social) <- c("platform", "year", "users")
social <- social %>%
  mutate(users = users / 1000000)
usethis::use_data(social)

endangered <- read_csv("https://raw.githubusercontent.com/stefanocoretta/glottolog-cldf/master/cldf/values.csv") %>%
  filter(Parameter_ID == "aes") %>%
  mutate(
    status = case_when(
      Value == "<NA>" ~ "unknown",
      Value == "1" ~ "not endangered",
      Value == "2" ~ "threatened",
      Value == "3" ~ "shifting",
      Value == "4" ~ "moribund",
      Value == "5" ~ "nearly extinct",
      Value == "6" ~ "extinct"
    )
  )
usethis::use_data(endangered)

harry_potter <- read_csv("data-raw/harry_potter.csv")
usethis::use_data(harry_potter)

source("https://gist.githubusercontent.com/z3tt/301bb0c7e3565111770121af2bd60c11/raw/ae538a28f2701f261a9ccf4ad20377e1b345fdab/data-ggplot-evolution-vol1.r")
usethis::use_data(df_ratios)

slavery_tot <- read_csv("data-raw/Trans-Atlantic_Slave_Trade_totals.csv")
usethis::use_data(slavery_tot)

pyramids <- read_csv("data-raw/pyramids.csv")
usethis::use_data(pyramids)

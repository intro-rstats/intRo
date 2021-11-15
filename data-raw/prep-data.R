library(tidyverse)

social <- read_csv("data-raw/users-by-social-media-platform.csv") %>%
  select(-Code)
colnames(social) <- c("platform", "year", "users")
social <- social %>%
  mutate(users = users / 1000000)
usethis::use_data(social)


languages <- read_csv("https://raw.githubusercontent.com/stefanocoretta/glottolog-cldf/master/cldf/languages.csv")
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
  ) %>%
  left_join(y = languages, by = c("Language_ID" = "ID")) %>%
  drop_na(Macroarea) %>%
  mutate(
    status = factor(status, levels = c("not endangered", "threatened", "shifting", "moribond", "nearly extinct", "extinct", "unknown"))
  ) %>%
  filter(status != "unknown") %>%
  droplevels() %>%
  select(Name, Glottocode, status, Macroarea, Latitude, Longitude)
usethis::use_data(endangered)

harry_potter <- read_csv("data-raw/harry_potter.csv") %>%
  mutate(
    element = case_when(
      sign %in% c("Aries", "Leo", "Sagittarius") ~ "Fire",
      sign %in% c("Taurus", "Virgo", "Capricorn") ~ "Earth",
      sign %in% c("Gemini", "Libra", "Aquarius") ~ "Air",
      sign %in% c("Cancer", "Pisces", "Scorpio") ~ "Water"
    )
  )
usethis::use_data(harry_potter)

source("https://gist.githubusercontent.com/z3tt/301bb0c7e3565111770121af2bd60c11/raw/ae538a28f2701f261a9ccf4ad20377e1b345fdab/data-ggplot-evolution-vol1.r")
usethis::use_data(df_ratios)

slavery_tot <- read_csv("data-raw/Trans-Atlantic_Slave_Trade_totals.csv")
usethis::use_data(slavery_tot)

slavery <- read_csv("data-raw/Trans-Atlantic_Slave_Trade_Database.csv")
usethis::use_data(slavery)

slavery_dis <- slavery %>%
  pivot_longer(Europe:other, names_to = "country", values_to = "count") %>%
  mutate(count = count / 1e6)
usethis::use_data(slavery_dis)

pyramids <- read_csv("data-raw/pyramids.csv")
usethis::use_data(pyramids)

messy_fruit <- tibble(
  status = c("sold", "bought"),
  orange = c(3, 6),
  apple = c(10, 25),
  banana = c(4, 4)
)
usethis::use_data(messy_fruit)

yoda_corpus <- read_csv("data-raw/yoda-corpus.csv")
usethis::use_data(yoda_corpus)

land_use_untidy <- read_csv("data-raw/land-use-world.csv") %>%
  filter(year > 1000)
usethis::use_data(land_use_untidy)
land_use <- land_use_untidy %>%
  pivot_longer(built_up:cropland, names_to = "use", values_to = "area") %>%
  mutate(area = area/1000000000)
usethis::use_data(land_use)

library(rnaturalearth)
europe <- ne_countries(continent = "Europe", scale = "large", returnclass = "sf")
usethis::use_data(europe)
alb_cities <- read_csv("./data-raw/alb-cities.csv")
alb_capitals <- alb_cities %>% filter(!is.na(capital))
usethis::use_data(alb_capitals)

personality <- read_csv("data-raw/2018-personality-data.csv") %>%
  mutate(across(where(is.numeric), round)) %>%
  pivot_longer(openness:extraversion, names_to = "trait", "response") %>%
  select(-userid)
usethis::use_data(personality)

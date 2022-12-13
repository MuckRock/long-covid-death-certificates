library(tidyverse)
library(janitor)
library(rio)
library(here)
library(lubridate)

# Load raw data for each state 
minnesota<- read_csv(here("data","raw","minnesota_all_deaths.csv"))
chicago <- read_csv(here("data", "raw","chicago_med_examiner_deaths.csv")) %>%
  clean_names()
los_angeles <- read_csv(here("data","raw", "los_angeles_med_examiner_deaths.csv")) %>%
  clean_names()
san_diego <- read_csv(here("data", "raw", "san_diego_med_examiner_deaths.csv")) %>%
  clean_names()
santa_clara <- read_csv(here("data", "raw", "santa_clara_med_examiner_deaths.csv")) %>%
  clean_names()
new_mexico <- read_csv(here("data", "raw", "new_mexico_med_examiner_all_deaths.csv")) %>% 
  clean_names()

# Long COVID deaths are identified using CDC methodology, 
# using regular expressions to find the following strings of text:
# "chronic COVID," "long COVID," "long haul COVID," "long hauler COVID,"
# "post-acute sequelae of COVID-19," "post-acute sequelae SARS-CoV-2 infection," "PASC," 
# "post COVID," and "post COVID syndrome." 

# Search for regular expressions in each dataset 
mn_long_covid_deaths <- minnesota %>% 
  filter(if_any(all_of(c("cause_of_death_line_a", "cause_of_death_line_b", "cause_of_death_line_c", "cause_of_death_line_d", "other_contributing_factors")),~grepl(".*chronic.covid.*|.*long.cov.*|.*long.haul.cov.*|.*long.hauler.cov.*|.*post.acute.sequelae.*cov.*|.*post.acute.sequelae.*sars.*|.*post.cov.*|.*pasc.*", ignore.case=TRUE, .))) %>% 
  mutate(death_date = as_date(death_date, format = "%m/%d/%Y"))
chicago_long_covid_deaths <- chicago %>%
  filter(if_any(all_of(c("primary_cause", "primarycause_linea", "primarycause_lineb","primarycause_linec", "contributin_factors")),~grepl(".*chronic.covid.*|.*long.cov.*|.*long.haul.cov.*|.*long.hauler.cov.*|.*post.acute.sequelae.*cov.*|.*post.acute.sequelae.*sars.*|.*post.cov.*|.*pasc.*", ignore.case=TRUE, .)))
los_angeles_long_covid_deaths <- los_angeles %>%
  filter(if_any(all_of(c("cause_a", "cause_b", "cause_b", "cause_b", "cause_c", "cause_d", "cause_other")),~grepl(".*chronic.covid.*|.*long.cov.*|.*long.haul.cov.*|.*long.hauler.cov.*|.*post.acute.sequelae.*cov.*|.*post.acute.sequelae.*sars.*|.*post.cov.*|.*pasc.*", ignore.case=TRUE, .)))
san_diego_long_covid_deaths <- san_diego %>%
  filter(if_any(all_of(c("cod_string", "contributing_conditions", "how_injury_occurred" )),~grepl(".*chronic.covid.*|.*long.cov.*|.*long.haul.cov.*|.*long.hauler.cov.*|.*post.acute.sequelae.*cov.*|.*post.acute.sequelae.*sars.*|.*post.cov.*|.*pasc.*", ignore.case=TRUE, .)))
santa_clara_long_covid_deaths <- santa_clara %>%
  filter(if_any(all_of(c("cause_of_death", "other_significant_condition" )),~grepl(".*chronic.covid.*|.*long.cov.*|.*long.haul.cov.*|.*long.hauler.cov.*|.*post.acute.sequelae.*cov.*|.*post.acute.sequelae.*sars.*|.*post.cov.*|.*pasc.*", ignore.case=TRUE, .)))
new_mexico_long_covid_deaths <- new_mexico %>% 
  filter(if_any(all_of(c("tex_tline_a", "tex_tline_b", "tex_tline_c", "tex_tline_d","text_part2")),~grepl(".*chronic.covid.*|.*long.cov.*|.*long.haul.cov.*|.*long.hauler.cov.*|.*post.acute.sequelae.*cov.*|.*post.acute.sequelae.*sars.*|.*post.cov.*|.*pasc.*", ignore.case=TRUE, .)))

# Export Long COVID death data to CSVs for analysis 
export(mn_long_covid_deaths, "minnesota_long_covid_deaths.csv")
export(chicago_long_covid_deaths, "chicago_long_covid_deaths.csv")
export(los_angeles_long_covid_deaths, "los_angeles_long_covid_deaths.csv")
export(san_diego_long_covid_deaths, "san_diego_long_covid_deaths.csv")
export(santa_clara_long_covid_deaths, "santa_clara_long_covid_deaths.csv")
export(new_mexico_long_covid_deaths, "new_mexico_long_covid_deaths.csv")


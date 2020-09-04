library(binom)
library(here)
library(tidyverse)
library(conflicted)
library(googlesheets4)
conflicted::conflict_prefer("select", "dplyr")
conflicted::conflict_prefer("filter", "dplyr")

# insert your own email address
gs4_auth("nicholas.tierney@monash.edu") 
sheet_url <- "https://docs.google.com/spreadsheets/d/1bxrBnQ8_ceX9Lz0-cRAB4VGBeW3SXluDQe-V84vDARM/edit"
gs_football <- read_sheet(sheet_url, skip = 1)

gs_football


#### Calculate proportions
d <- read_csv(here("data",
                  "missing-data-in-football-preliminary.csv"))

d <- filter(d, Study_eligibility == "1")

# Reporting missing
table(d$Any_missing_data_statement, useNA = 'ifany')
successes <- sum(d$Any_missing_data_statement == 1, na.rm = T)
trials <- sum(!is.na(d$Any_missing_data_statement))
binom.confint(x = successes, n = trials, conf.level = 0.95, methods = "exact")

# Non-reported missing who shared data
d_shared_data = filter(d, Any_missing_data_statement == "0")
table(d_shared_data$Was_data_shared, useNA = 'ifany')
successes <- sum(d_shared_data$Was_data_shared == 1, na.rm = T)
trials <- sum(!is.na(d_shared_data$Was_data_shared))
binom.confint(x = successes, n = trials, conf.level = 0.95, methods = "exact")



# Shared code
table(d$Code_shared, useNA = 'ifany')
# !!comment to explain NAs
# Zero shared code

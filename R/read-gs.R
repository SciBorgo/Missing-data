library(tidyverse)
library(googlesheets4)
library(janitor)
# insert your own email address
gs4_auth(email = "nicholas.tierney@monash.edu") 
#gs4_auth(email = "davidnicholas.borg@gmail.com") 
sheet_url <- "https://docs.google.com/spreadsheets/d/1bxrBnQ8_ceX9Lz0-cRAB4VGBeW3SXluDQe-V84vDARM/edit"
gs_football_r1 <- read_sheet(sheet_url, 
                             range = "A2:O201",
                             col_types = "ciccccdcccccccc")
gs_football_r2_cols <- read_sheet(sheet_url, 
                                  range = "A2:H201",
                                  col_types = "ciccccdc")
gs_football_r2_results <- read_sheet(sheet_url, 
                                     range = "P2:V201",
                                     col_types = "ccccccc")

gs_football_r2 <- bind_cols(gs_football_r2_cols,
                            gs_football_r2_results)

gs_football <- bind_rows(reviewer_1 = gs_football_r1,
                         reviewer_2 = gs_football_r2,
                         .id = "reviewer") %>% 
  clean_names()  %>% 
  mutate(study_eligibility = as.logical(study_eligibility))

library(visdat)
vis_dat(gs_football, sort_type = FALSE)  

# preliminary study
gs_football %>% 
  filter(study_eligibility) %>% 
  group_by(reviewer) %>% 
  count(any_missing_data_statement) 

gs_football %>% 
  filter(study_eligibility) %>% 
  group_by(reviewer) %>% 
  count(any_missing_data_statement)
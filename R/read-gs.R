library(tidyverse)
library(googlesheets4)
library(janitor)
# insert your own email address
gs4_auth(email = "nicholas.tierney@monash.edu") 
#gs4_auth(email = "davidnicholas.borg@gmail.com") 
sheet_url <- "https://docs.google.com/spreadsheets/d/1bxrBnQ8_ceX9Lz0-cRAB4VGBeW3SXluDQe-V84vDARM/edit"
gs_football_r1 <- read_sheet(sheet_url, 
                             range = "A2:M201",
                             col_types = "ciccccccccccc")
gs_football_r2_cols <- read_sheet(sheet_url, 
                                  range = "A2:G201",
                                  col_types = "ciccccc")
gs_football_r2_results <- read_sheet(sheet_url, 
                                     range = "O2:S201",
                                     col_types = "ccccc")

gs_football_r2 <- bind_cols(gs_football_r2_cols,
                            gs_football_r2_results)

gs_football <- bind_rows(reviewer_1 = gs_football_r1,
                         reviewer_2 = gs_football_r2,
                         .id = "reviewer") %>% 
  clean_names() %>% 
  mutate(study_eligibility = as.logical(as.numeric(study_eligibility)),
         exclusion_reason = replace_na(exclusion_reason, "Included")) %>% 
  na_if("NA")

# data shared

library(visdat)
library(naniar)
vis_dat(gs_football_r1, sort_type = FALSE)
vis_dat(gs_football_r2, sort_type = FALSE)

vis_dat(gs_football, sort_type = FALSE)

gs_football %>% 
  filter(study_eligibility) %>% 
  vis_dat(sort_type = FALSE)

gs_football %>% 
  filter(study_eligibility) %>% 
  vis_miss(sort_miss = TRUE)

# preliminary study
gs_football %>% 
  filter(study_eligibility) %>% 
  group_by(reviewer) %>% 
  count(any_missing_data_statement) 

gs_football %>% 
  filter(study_eligibility) %>% 
  group_by(reviewer) %>% 
  count(any_missing_data_statement)

library(irr)
data(video)
video

gs_football %>% 
  filter(study_eligibility) %>% 
  filter(any_missing_data_statement == "NA") %>% 
  View()
  

gs_football %>% 
  filter(study_eligibility) %>% 
  select(reviewer, any_missing_data_statement) %>% 
  pivot_wider(names_from = reviewer,
              values_from = any_missing_data_statement,
              values_fn = list) %>% 
  View()

agree



# relevant agree code
ratings <- as.matrix(na.omit(ratings))
ns <- nrow(ratings)
nr <- ncol(ratings)
if (is.numeric(ratings)) {
  rangetab <- apply(ratings, 1, max) - apply(ratings, 1, 
                                             min)
  coeff <- 100 * sum(rangetab <= 0)/ns
library(tidyverse)
library(googlesheets4)
library(janitor)

read_football_gs <- function(email = "nicholas.tierney@monash.edu"){
# insert your own email address
# gs4_auth(email = "nicholas.tierney@monash.edu") 
gs4_auth(email = email)
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
  na_if("NA") %>% 
  na_if("NA ") %>% 
  na_if(" NA") %>% 
  na_if(" ") %>% 
  filter(study_eligibility) %>% 
  mutate(was_data_shared = case_when(
    was_data_shared == "At_request" ~ "0",
    was_data_shared == "can request" ~ "0",
    was_data_shared == "Public_data" ~ "0",
    TRUE ~ was_data_shared
  )) %>% 
  mutate_at(.vars = vars(any_missing_data_statement:was_data_shared),
            .funs = as.integer)
  gs_football
}

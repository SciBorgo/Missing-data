library(tidyverse)
library(googlesheets4)
library(janitor)
# insert your own email address
gs4_auth(email = "nicholas.tierney@monash.edu") 
sheet_url <- "https://docs.google.com/spreadsheets/d/1bxrBnQ8_ceX9Lz0-cRAB4VGBeW3SXluDQe-V84vDARM/edit"
gs_football_r1 <- read_sheet(sheet_url, range = "A2:O201")
gs_football_r2_cols <- read_sheet(sheet_url, range = "A2:H201")
gs_football_r2_results <- read_sheet(sheet_url, range = "P2:V201")

gs_football_r2 <- bind_cols(gs_football_r2_cols,
                            gs_football_r2_results)

gs_football <- bind_rows(reviewer_1 = gs_football_r1,
                         reviewer_2 = gs_football_r2,
                         .id = "reviewer") %>% 
  clean_names() 

unlist_as_factor <- function(x){
  x %>%
    na_if("NA") %>%
    unlist() %>% 
    as.logical()
}

gs_football %>% 
  select(where(is.list)) %>% 
  pull(1) %>% 
  unlist()
  
gs_football %>% 
  mutate(any_missing_data_statement = unlist_as_logical(any_missing_data_statement))

gs_football %>% 
  mutate_if(.predicate = is.list,
            unlist_as_logical)
  

library(visdat)
vis_dat(gs_football, sort_type = FALSE)  


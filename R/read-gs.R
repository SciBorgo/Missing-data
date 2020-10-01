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
# data shared

library(visdat)
library(naniar)
vis_dat(gs_football_r1, sort_type = FALSE)
vis_dat(gs_football_r2, sort_type = FALSE)

vis_dat(gs_football, sort_type = FALSE)

gs_football %>% 
  select(any_missing_data_statement:was_data_shared) %>% 
  map(unique)
  
gs_football %>% 
  group_by(reviewer) %>% 
  count(any_missing_data_statement)  %>% 
  pivot_wider(names_from = reviewer,
              values_from = n)

gs_football %>% 
  select(title,
         reviewer,
         any_missing_data_statement) %>% 
  pivot_wider(names_from = reviewer,
              values_from = any_missing_data_statement) %>% 
  filter(reviewer_1 != reviewer_2)

pivot_var <- function(data, var){
  data %>% 
  select(title,
         reviewer,
         {{ var }}) %>% 
  pivot_wider(names_from = reviewer,
              values_from = {{ var }})
}

identify_mismatch <- function(data, var){
  pivot_var(data, {{ var }}) %>% 
    filter(reviewer_1 != reviewer_2)
}

identify_mismatch(gs_football, any_missing_data_statement)
identify_mismatch(gs_football, any_statement_about_mcar_mnar_mar)
identify_mismatch(gs_football, were_missing_data_explored)
identify_mismatch(gs_football, was_imputation_used)
identify_mismatch(gs_football, was_data_shared)

# calculate agreement
library(irr)

agree_var <- function(data, var){
  statement_agree <- pivot_var(data, {{ var }}) %>% 
    select(reviewer_1, reviewer_2) %>% 
    irr::agree() 
  
  statement_agree$value
}

agree_var(gs_football, any_missing_data_statement)
agree_var(gs_football, any_statement_about_mcar_mnar_mar)
agree_var(gs_football, were_missing_data_explored)
agree_var(gs_football, was_imputation_used)
agree_var(gs_football, was_data_shared)

#the agreement was `r agree_var(gs_football, was_data_shared)`%

# something something funcitonal programming
gs_football %>% 
  select(reviewer,any_missing_data_statement:was_data_shared) %>% 
  map(agree_var)



gs_football %>% 
  filter(study_eligibility) %>% 
  vis_miss(sort_miss = TRUE)

gs_football %>% 
  filter(study_eligibility) %>% 
  miss_var_summary()

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
gs_football <- readr::read_rds("data/gs-football.rds")

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

# identify table of mismatches  
gs_football %>% 
  group_by(reviewer) %>% 
  count(any_missing_data_statement)  %>% 
  pivot_wider(names_from = reviewer,
              values_from = n)


# Now we bring the third and final review 
gs_mismatches <- readr::read_csv("data/missing-data-mismatches.csv")

gs_mismatches %>% 
  pivot_longer(cols = c(reviewer_1,reviewer_2, third_check),
               names_to = "reviewer",
               values_to = "decision") %>% 
  pivot_wider(names_from = variable,
              values_from = decision)

gs_football %>% 
  pivot_wider(names_from = reviewer,
              values_from = )
# any_missing_data_statement
# list(
#   any_missing_data_statement = identify_mismatch(gs_football,
#                                                  any_missing_data_statement),
#   any_statement_about_mcar_mnar_mar = identify_mismatch(gs_football,
#                                                         any_statement_about_mcar_mnar_mar),
#   
#   were_missing_data_explored = identify_mismatch(gs_football, were_missing_data_explored),
#   
#   was_imputation_used = identify_mismatch(gs_football, was_imputation_used),
#   
#   was_data_shared = identify_mismatch(gs_football, was_data_shared)
# ) %>%
#   bind_rows(.id = "variable") %>%
#   write_csv(path = "data/missing-data-mismatches.csv")


# supp materials - agreement between Reviewer 1 and Reviewer 2



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
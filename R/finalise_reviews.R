##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##'
##' @title
##' @param gs_mismatches
##' @param gs_football
##' @return
##' @author Nicholas Tierney
##' @export
finalise_reviews <- function(gs_mismatches, gs_football) {

  gs_football_final_matches <- gs_football %>% 
    pivot_longer(cols = any_missing_data_statement:was_data_shared,
                 names_to = "variable",
                 values_to = "value") %>% 
    pivot_wider(names_from = reviewer) %>% 
    left_join({ 
      select(gs_mismatches, 
             -reviewer_1,
             -reviewer_2)
    }, 
    by = c("variable", "title")) %>% 
    # double check that we get our data back
    # filter(reviewer_1 != reviewer_2)
    mutate(third_check = as.integer(third_check),
           final_check = case_when(
             is.na(third_check) ~ reviewer_1,
             reviewer_1 != reviewer_2 ~ third_check
           ))  %>%  select(-c(reviewer_1, 
                              reviewer_2,
                              third_check,
                              notes)) %>% 
    pivot_wider(names_from = variable,
                values_from = final_check)
  # filter(reviewer_1 != reviewer_2)
  
  gs_football_final_matches
  

}

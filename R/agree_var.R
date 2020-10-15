agree_var <- function(data, var){
  statement_agree <- pivot_var(data, {{ var }}) %>% 
    select(reviewer_1, reviewer_2) %>% 
    irr::agree() 
  
  statement_agree$value
}

identify_mismatch <- function(data, var){
  pivot_var(data, {{ var }}) %>% 
    filter(reviewer_1 != reviewer_2)
}

pivot_var <- function(data, var){
  data %>% 
    select(title,
           reviewer,
           {{ var }}) %>% 
    pivot_wider(names_from = reviewer,
                values_from = {{ var }})
}

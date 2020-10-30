percent_binom_conf <- function(binom_conf){
  mean_pct <- percent(binom_conf$mean, accuracy = 0.1)
  lower_pct <- percent(binom_conf$lower, accuracy = 0.1)
  upper_pct <- percent(binom_conf$upper, accuracy = 0.1)
  
  return(data.frame(mean_pct = mean_pct,
                    lower_pct = lower_pct,
                    upper_pct = upper_pct))
}


football_binom_confint <- function(data, var){
  
  var_vec <- data %>% pull({{ var }})
  successes <- sum(var_vec, na.rm = TRUE)
  trials <- sum(!is.na(var_vec))
  
  binom.confint(x = successes, 
                n = trials, 
                conf.level = 0.95, 
                methods = "exact")
}
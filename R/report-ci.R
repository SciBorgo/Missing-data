report_ci <- function(var){
  ci_mean <- var$mean_pct
  ci_upper <- var$lower_pct
  ci_lower <- var$upper_pct
  
  glue::glue("{var$mean_pct} \\
           [{var$lower_pct} - \\
           {var$upper_pct}]")
}
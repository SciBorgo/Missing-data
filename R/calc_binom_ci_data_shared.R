##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##'
##' @title
##' @param 
##' @return
##' @author Nicholas Tierney
##' @export
calc_binom_ci_data_shared <- function(gs_football_final_matches) {

  gs_football_final_matches_dont_report <- gs_football_final_matches %>% 
    filter(any_missing_data_statement == 0)
  
  binom_ci_data_shared <- gs_football_final_matches_dont_report %>% 
    football_binom_confint(var = was_data_shared) %>% 
    percent_binom_conf()
  
  binom_ci_data_shared

}

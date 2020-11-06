##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##'
##' @title
##' @param gs_football_final_matches
##' @return
##' @author Nicholas Tierney
##' @export
calc_binom_ci_miss_reported <- function(gs_football_final_matches) {

  football_binom_confint(
    gs_football_final_matches, 
    any_missing_data_statement
  ) %>% 
    percent_binom_conf()
  

}

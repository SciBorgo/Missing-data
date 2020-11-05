##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##'
##' @title
##' @param gs_football_final_matches
##' @return
##' @author Nicholas Tierney
##' @export
calc_n_no_mention_missings <- function(gs_football_final_matches) {

  gs_football_final_matches_dont_report <- gs_football_final_matches %>% 
    filter(any_missing_data_statement == 0)
  
  n_no_mention_missings <- nrow(gs_football_final_matches_dont_report)
  
  n_no_mention_missings

}

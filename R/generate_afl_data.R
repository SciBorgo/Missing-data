##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##'
##' @title

##' @return
##' @author Nicholas Tierney
##' @export
generate_afl_data <- function() {

  # Aim of this section:
  # Simulate data from a real data set, insert missing
  # 'Study aim': predicting hamstring strain injury, using number of sprints and sprint distance as x-variables
  
  # Simulate dataset
  # NOTE: fix this later in the drake plan
  d <- get_afltables_stats(start_date = "2020-08-01", end_date = "2020-09-01")
  afl_data <- d %>% select(ID, Round, Playing.for, Venue)
  
  # Simulate injury and sprint variables
  injury <- rbinom(n = nrow(d), 1, prob = 0.1)
  sprints <- rpois(n = nrow(d), lambda = 100)
  sprint_distance <- rtruncnorm(n = nrow(afl_data), 
                                           a = 0, 
                                           b = Inf, 
                                           mean = 2000, 
                                           sd = 500) # Check if this is reasonable (mean 2 km per game)
  
  data <- cbind(injury, sprints, sprint_distance)
  
  # Ampute missing values
  data_ampute <- ampute(data = data[,1:3])
  # try and tinker with the amount of missings - so the variables have different
  # amounts of missingness
  # try and introduce some missingness mechanisms
  
  data_with_missing <- data_ampute$amp
  
  # Put the dataset together
  data_plot <- cbind(afl_data, data_with_missing)
  
  # Clean variable names
  data_plot <- data_plot %>% clean_names() %>% rename(team = playing_for)
  
  data_plot_clean <- data_plot %>% 
    mutate(team = recode(team, 
                         "Gold Coast" = "GC",
                         "Greater Western Sydney" = "GWS",
                         "Fremantle" = "FRE",
                         "Collingwood" = "COL",
                         "Port Adelaide" = "PA",
                         "Western Bulldogs" = "WB",
                         "Richmond" = "RIC",
                         "Brisbane Lions" = "BL",
                         "Geelong" = "GEE",
                         "North Melbourne" = "NM",
                         "Adelaide" = "ADE",
                         "Melbourne" = "MEL",
                         "Sydney" = "SYD",
                         "St Kilda" = "STK",
                         "Essendon" = "ESS",
                         "West Coast" = "WC",
                         "Carlton" = "CAR",
                         "Hawthorn" = "HAW")) %>% 
    as_tibble() %>% 
    rename(sprint_dist = sprint_distance)
  
  data_plot_clean

}

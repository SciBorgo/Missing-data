source("R/read-gs.R")

gs_football <- read_football_gs()

readr::write_rds(x = gs_football,
                 path = "data/gs-football.rds")

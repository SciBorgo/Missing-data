
# exploring the data

library(visdat)
library(naniar)
vis_dat(gs_football_r1, sort_type = FALSE)
vis_dat(gs_football_r2, sort_type = FALSE)
vis_dat(gs_football, sort_type = FALSE)

# check values are integers
gs_football %>% 
  select(any_missing_data_statement:was_data_shared) %>% 
  map(unique)
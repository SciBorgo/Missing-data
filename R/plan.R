the_plan <-
  drake_plan(

  
  gs_football = read_rds("data/gs-football.rds"),
  # football_data_exists = fs::file_exists("data/gs-football.rds"),
   # gs_football = {
   #   if (football_data_exists) {
   #     read_rds(file = "data/gs-football.rds")
   #   } else if (!football_data_exists) {
   #     read_football_gs()
   #   } 
   #   },
   # write_football = {
   #   if (!football_data_exists) {
   #     write_rds(x = gs_football, path = "data/gs-football.rds")
   #   }
   # },
   
   paper = target(
     command = {
       rmarkdown::render(knitr_in("paper/paper.Rmd"))
       file_out("paper/paper.html")
     }
   )
   

)

the_plan <-
  drake_plan(

  
  gs_football = read_rds("data/gs-football.rds"),
  gs_mismatches = read_csv("data/missing-data-mismatches.csv"),
  simulated_afl_data = generate_afl_data(),
  gs_football_final_matches = finalise_reviews(gs_mismatches, gs_football),
  
   paper = target(
     command = {
       rmarkdown::render(knitr_in("paper/paper.Rmd"))
       file_out("paper/paper.html")
     }
   ),
  
   supplement_1 = target(
     command = {
       rmarkdown::render(knitr_in("paper/supplement-1.Rmd"))
       file_out("paper/supplement-1.html")
     }
   ),
  
   supplement_2 = target(
     command = {
       rmarkdown::render(knitr_in("paper/supplement-2.Rmd"))
       file_out("paper/supplement-2.html")
     }
   )
   

)

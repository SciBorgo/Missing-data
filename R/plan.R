the_plan <-
  drake_plan(

  
  gs_football = read_rds("data/gs-football.rds"),
  gs_mismatches = read_csv("data/missing-data-mismatches.csv"),
  simulated_afl_data = generate_afl_data(),
  gs_football_final_matches = finalise_reviews(gs_mismatches, gs_football),
  
  n_screened = nrow(gs_football_final_matches),
  n_shared = sum(gs_football_final_matches$was_data_shared == 1),
  binom_ci_miss_reported = calc_binom_ci_miss_reported(gs_football_final_matches),
  n_no_mention_missings = calc_n_no_mention_missings(gs_football_final_matches),
  binom_ci_data_shared = calc_binom_ci_data_shared(gs_football_final_matches),
  prisma_figure = create_prisma_figure(),
  write_prisma_figure = PRISMAstatement:::prisma_pdf(x = prisma_figure, 
                                                     filename = "paper/figures/prisma-figure.pdf"),
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

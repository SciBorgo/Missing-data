##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##'
##' @title

##' @return
##' @author Nicholas Tierney
##' @export
create_prisma_figure <- function() {

  prisma(found = 3863,
         found_other = F,
         no_dupes = 1954, 
         screened = 1373, # (1954 - 1373) 
         screen_exclusions = 581, 
         full_text = 199,
         full_text_exclusions = 62, 
         qualitative = 137, 
         quantitative = 0,
         width = 800, 
         height = 800,
         font_size = 16,
         labels = list(
           full_text_exclusions = "Full-text articles excluded (n = 62),
with reasons:
Commentary/letter (n = 4),
Conference abstract (n = 21),
Full-text not available (n = 9),
Infographic (n = 2),
Not in English (n = 17),
Qualitative study (n = 9)
"))
  

}

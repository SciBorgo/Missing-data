library(googlesheets4)
# insert your own email address
gs4_auth("nicholas.tierney@monash.edu") 
sheet_url <- "https://docs.google.com/spreadsheets/d/1bxrBnQ8_ceX9Lz0-cRAB4VGBeW3SXluDQe-V84vDARM/edit"
gs_football <- read_sheet(sheet_url, skip = 1)

gs_football

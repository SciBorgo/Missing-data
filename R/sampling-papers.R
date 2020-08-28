# Code to sample the papers for review
# possible papers to review after title abstract screening are in file
# "missing-data-endnote-library.csv"
# We then sampled possible papers to get to 10% of the number of screened papers
# Two files were written, "random-sample-137", and "random-sample-62". These two
# were created to get close to 10% of the number of papers in total 199 papers
# were reviewed.

library(tidyverse)
library(here)
d <- read_csv(here("data",
                   "missing-data-endnote-library.csv"))

# repeatable analysis
set.seed(2020-05-21)
articles <- d %>% sample_frac(size = 0.1)
#write.csv(articles, file = "random-sample-137.csv")

articles$sampled <- 1
data <- merge(d, articles, all.x = T)
data$sampled <- data$sampled %>% replace_na(0)
d_second_sample <- filter(data, sampled < 1)
articles_second_sample <- d_second_sample %>% sample_frac(size = 0.05)
#write.csv(articles_second_sample, file = "random-sample-62.csv")


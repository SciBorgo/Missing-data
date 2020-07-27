

library(tidyverse)
#library(ids)

setwd("~/Dropbox/Research projects/Editorial - Missing data in sport and exercise science research")
d = read.csv("missing-data-endnote-library.csv")

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


library(binom)
library(dplyr)

#### Calculate proportions
d = read.csv("missing-data-in-football-preliminary.csv")
d = filter(d, Study_eligibility == "1")

# Reporting missing
table(d$Any_missing_data_statement, useNA = 'ifany')
successes <- sum(d$Any_missing_data_statement == 1, na.rm = T)
trials <- sum(!is.na(d$Any_missing_data_statement))
binom.confint(x = successes, n = trials, conf.level = 0.95, methods = "exact")

# Non-reported missing who shared data
d_shared_data = filter(d, Any_missing_data_statement == "0")
table(d_shared_data$Was_data_shared, useNA = 'ifany')
successes <- sum(d_shared_data$Was_data_shared == 1, na.rm = T)
trials <- sum(!is.na(d_shared_data$Was_data_shared))
binom.confint(x = successes, n = trials, conf.level = 0.95, methods = "exact")



# Shared code
table(d$Code_shared, useNA = 'ifany')
# !!comment to explain NAs
# Zero shared code

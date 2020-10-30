
<!-- README.md is generated from README.Rmd. Please edit that file -->

Missing data in sports science: Current practice in football research and recommendations for reporting missingness
===================================================================================================================

<!-- badges: start -->
<!-- badges: end -->

*David N Borg(1), Robert Nguyen(2), Nicholas J Tierney(3,4)*

1: Griffith University, Menzies Health Institute Queensland, The Hopkins
Centre, Brisbane, Australia.

2: University of New South Wales, Department of Statistics, School of
Mathematics and Statistics, Sydney, Australia

3: Monash University, Department of Econometrics and Business
Statistics, Melbourne, Australia

4: Australian Centre of Excellence for Mathematical and Statistical
Frontiers (ACEMS), Melbourne, Australia

Abstract
========

Missing data are often unavoidable. The reason values go missing, along
with decisions made in how missing data are handled (deleted or
imputed), can have a profound effect on the validity, usability and
accuracy of a study’s results. In this article, we aimed to: estimate
the proportion of studies in football research that included a missing
data statement, highlight several improvable practices in relation to
missing data, and provide recommendations for exploring, visualising and
reporting missingness. Football related articles, published in 2019 were
studied. A survey of 137 articles, sampled at random, was conducted to
determine whether a missing data was included. As expected, the
proportion of studies in football research including a missing data
statement was low, at only X%; which suggests that this aspect of data
analysis is seldom considered by researchers. We suspect that this
result is consistent with the wider sports science literature. We
recommend researchers describe the number and percentage of missing
values, including when there are no missing values. Exploratory analysis
should be conducted to explore missing values, and visualisations
describing missingness overall should be provided in the paper or at
least supplementary materials. Missing values should almost always be
imputed, and imputation methods should be explored to ensure they are
appropriately representative.

To recreate the paper
=====================

Use `drake` and `capsule` to recreate the paper.

You can install `capsule` with:

    # install.packages("remotes")
    remotes::install_github("milesmcbain/capsule")

Get the R packages used with:

    capsule::reproduce_lib()

Then run

    capsule::run(drake::r_make())

This will generate the paper.

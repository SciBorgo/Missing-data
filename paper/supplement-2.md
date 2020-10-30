---
title: "Supplement 2"
output: 
  bookdown::html_document2:
    keep_md: true
  bookdown::pdf_document2:
    toc: false
bibliography: "supp2.bib"
---




# Systematic search details

The systematic search was performed in accordance with the reporting
requirements of the PRISMA statement [@Moher2009]. The search strategy is
described below. The search protocol was not registered, and no funding
was provided to support the undertaking of the search.

# Objective

This review aimed to estimate the proportion of articles that reported 
missing data in football research.

# Method

Football related articles published in 2019 were studied. Three major
sports medicine databases were searched on May 20, 2020, using key terms and limits. 
The databases were: SPORTDiscus, Embase and Cinahl. A
list of the search terms has been provided in
Table \@ref(tab:search-table-print) below.



<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:search-table-print)Key search terms and complete search statements for the databases, SPORTDiscuss, Embase, and Cinahl</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> SPORTDiscus </th>
   <th style="text-align:left;"> Embase </th>
   <th style="text-align:left;"> Cinahl </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> exercise science OR sports science OR physiology OR biomechanics OR nutrition OR training OR testing OR sports medicine OR performance analysis OR performance OR sport psychology OR coaching </td>
   <td style="text-align:left;"> (exercise AND science OR (sports AND science) OR physiology OR biomechanics OR nutrition OR training OR testing OR (sports AND medicine) OR 'performance analysis' OR (('performance'/exp OR performance) AND ('analysis'/exp OR analysis)) OR 'performance'/exp OR performance OR 'sport psychology'/exp OR 'sport psychology' OR (('sport'/exp OR sport) AND ('psychology'/exp OR psychology)) OR 'coaching'/exp OR coaching) AND [2019-2019]/py </td>
   <td style="text-align:left;"> exercise science OR sports science OR physiology OR biomechanics OR nutrition OR training OR testing OR sports medicine OR performance analysis OR performance OR sport psychology OR coaching </td>
  </tr>
  <tr>
   <td style="text-align:left;"> football OR soccer OR indoor soccer OR futsal OR rugby league OR rugby union OR gaelic football OR australian rules football OR AFL OR american football OR gridiron football OR touch football </td>
   <td style="text-align:left;"> (football OR soccer OR (indoor AND soccer) OR futsal OR rugby OR (rugby AND league) OR (rugby AND union) OR (gaelic AND football) OR 'australian rules footbal' OR (('australian'/exp OR australian) AND rules AND footbal) OR afl OR 'american football'/exp OR 'american football' OR (('american'/exp OR american) AND ('football'/exp OR football)) OR 'gridiron football' OR (gridiron AND ('football'/exp OR football)) OR 'touch football' OR (('touch'/exp OR touch) AND ('football'/exp OR football))) AND [2019-2019]/py </td>
   <td style="text-align:left;"> football OR soccer OR indoor soccer OR futsal OR rugby league OR rugby union OR gaelic football OR australian rules football OR AFL OR american football OR gridiron football OR touch football </td>
  </tr>
</tbody>
</table>

Included articles were: (a) published in 2019; (b) in English; 
(c) had an accessible full-text; and (d) included quantitative data. 
Studies containing original data, including case studies (with time-series data) 
and n=1 trials, were considered.
The search results were imported into EndNote (version 9.3.2).
Duplicates were removed, and titles and abstracts were screened against
the inclusion criteria. Of the articles identified for full-text
screening, 10% were sampled, at random, for survey. Because \~30% of the
papers from the initial random sample were not eligible for inclusion
(e.g., full-texts not in English, conference abstracts, qualitative
studies), an additional 5% random sample was taken. It was expected that 
30% of the additional 5% random sample would also be ineligible. With this loss,
it was expected that 10% of the articles that remained after title and abstract 
screening would undergo survey. 
Figure \@ref(fig:prisma) summarises the search process.


<div class="figure" style="text-align: center">
<!--html_preserve--><div id="htmlwidget-0e5409ecbf7fffab05fd" style="width:768px;height:960px;" class="grViz html-widget"></div>
<script type="application/json" data-for="htmlwidget-0e5409ecbf7fffab05fd">{"x":{"diagram":"digraph prisma {\n    node [shape=\"box\", fontsize = 16];\n    graph [splines=ortho, nodesep=1, dpi = 72]\n    a -> nodups;\n    b -> nodups;\n    a [label=\"Records identified through\ndatabase searching\n(n = 3863)\"];\n    b [label=\"Additional records identified\nthrough other sources\n(n = 0)\"]\n    nodups -> incex;\n    nodups [label=\"Records after duplicates removed\n(n = 1954)\"];\n    incex -> {ex; ft}\n    incex [label=\"Records screened\n(n = 1373)\"];\n    ex [label=\"Records excluded\n(n = 581)\"];\n    {rank=same; incex ex}\n    ft -> {qual; ftex};\n    ft [label=\"Full-text articles assessed\nfor eligibility\n(n = 199)\"];\n    {rank=same; ft ftex}\n    ftex [label=\"Full-text articles excluded (n = 62),\nwith reasons:\nCommentary/letter (n = 4),\nConference abstract (n = 21),\nFull-text not available (n = 9),\nInfographic (n = 2),\nNot in English (n = 17),\nQualitative study (n = 9)\n\"];\n    qual -> quant\n    qual [label=\"Studies included in qualitative synthesis\n(n = 137)\"];\n    quant [label=\"Studies included in\nquantitative synthesis\n(meta-analysis)\n(n = 0)\"];\n  }","config":{"engine":"dot","options":null}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
<p class="caption">(\#fig:prisma)Flowchart of the article search and inclusion for the systematic search. The full-text of 137 articles was reviewed.</p>
</div>


Articles were surveyed to determine: (a) whether a missing data
statement was included, or if missing data were acknowledged in a
figure/table; where data were missing, whether (b) data were considered
MCAR, MAR or MNAR; (c) imputation was used; (d) the method used for imputation; 
and (e) whether articles that did not include a missing data
statement shared their data. Two authors independently extracted the
data. Agreement was X%; discrepancies were resolved by NJT. Findings are
reported as the proportion and 95% confidence interval (CI). Confidence
intervals were calculated using the Clopper-Pearson method for the
binomial distribution [@Clopper1934], via the 'binom' package [@binom] in R (version 4.0.2) [@rcore].

# Results

The search returned a total of 3,863 articles (Figure \@ref(fig:prisma)). Of the 199
articles screened, 137 were deemed eligible, representing \~10% of total
articles published on football related studies in 2019 (Figure 1). The
proportion of articles that reported missing data was 5.9% \[95% confidence
interval; X% to X%\] or 8/136. A breakdown of the extracted information
is provided in Table 2.






# Summary

A survey of 137 articles published in 2019 on football related topics
showed that only one in 20 reported missing data, suggesting
that missing data are rarely considered by sport science researchers.

# References {-}

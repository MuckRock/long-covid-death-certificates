# long-covid-deaths
 Death certificate data recieved in public records requests from Chicago, California’s Bay Area, Los Angeles and San Diego and Minnesota, allowing us to search for words associated with Long COVID. 

This repository contains data, analytic code, and findings that support portions of the article, “[TKTK](https://www.google.com),” published TKTKTKTK, 2022.

# Data 
 State and regional agencies provided the [`data`](https://github.com/DillonBergin/long-covid-deaths/tree/main/data) in this repository through public records requests. The requests for several data files can be found on MuckRock's website, filed by Derek Kravitz, including [Cook County](https://www.muckrock.com/foi/cook-county-365/request-for-death-records-132745/), [Los Angeles](https://www.muckrock.com/foi/los-angeles-county-358/cpra-for-case-detail-records-132743/) and [San Diego](https://www.muckrock.com/foi/san-diego-county-55/cpra-for-case-data-132744/). 

The data from Minnesota was provided to us by our partners TK. The data from Santa Clara TK. 

# Methodology
In order to identify potential Long COVID deaths in the death data files located in the [`data`](https://github.com/DillonBergin/long-covid-deaths/tree/main/data) directory, we programmatically searched through the text in the "cause of death" fields for each death in all geographic locations using the same regular expression: `post.cov.*|long.cov.*|post.acute.sequelae.*`. This analysis can be found in in the notebook [`find_long_covid_deaths.Rmd`](https://github.com/DillonBergin/long-covid-deaths/blob/main/analysis/find_long_covid_deaths.Rmd).

TK more on these terms after we see how the CDC conducted their study

# Questions and Feedback
The Documenting COVID-19 project can be reached at [covid@muckrock.com](mailto:covid@muckrock.com)

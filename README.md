# Analysis of death certificates where Long COVID caused or contributed to death  
This repository conatins death certificate data recieved in public records requests from Chicago, California’s Bay Area, Los Angeles and San Diego, New Mexico, and Minnesota, allowing us to search for words associated with Long COVID. 

This analysis formed the basis of our reporting in the article the article, "[We Found Dozens of ‘Long COVID’ Deaths Across the U.S., as Defined by the CDC. Here are Some of Their Stories.](https://www.muckrock.com/news/archives/2022/dec/14/long-covid-cdc-muckrock-analysis)," published Dec. 14, 2022.

This work is part of an ongoing project by MuckRock, reporting on the U.S. government’s response to Long COVID. Do you have something to tell us about that? [We want to hear from Long COVID patients, caregivers, researchers and others in the community](https://www.muckrock.com/news/archives/2022/nov/02/long-covid-callout-cdc-symptoms/) as we continue to investigate government action on this condition.

# Data 
## `data`
State and regional agencies provided the [`data`](https://github.com/DillonBergin/long-covid-deaths/tree/main/data) in this repository through public records requests. The requests for several data files can be found on MuckRock's website, filed by Derek Kravitz and Dillon Bergin, including [Cook County](https://www.muckrock.com/foi/cook-county-365/request-for-death-records-132745/), [Los Angeles](https://www.muckrock.com/foi/los-angeles-county-358/cpra-for-case-detail-records-132743/), [San Diego](https://www.muckrock.com/foi/san-diego-county-55/cpra-for-case-data-132744/) and [New Mexico](https://www.muckrock.com/foi/new-mexico-227/medical-examiner-data-new-mexico-134303/). 

The data from Minnesota was provided to us by our partners at the Minnesota Reformer and the Minneapolis Star-Tribune.

# Methodology
## `etl` (extract-transform-load)
In order to identify potential Long COVID deaths in the death data files located in the [`data`](https://github.com/DillonBergin/long-covid-deaths/tree/main/data) directory, we programmatically searched through the text in the contributing and underlying "cause of death" fields for each death in all geographic locations using the same regular expression: `.*chronic.covid.*|.*long.cov.*|.*long.haul.cov.*|.*long.hauler.cov.*|.*post.acute.sequelae.*cov.*|.*post.acute.sequelae.*sars.*|.*post.cov.*|.*pasc.*`.


This script for this can be found in the notebook [`find_long_covid_key_terms.R`](https://github.com/DillonBergin/long-covid-death-certificates/blob/main/etl/find_long_covid_key_terms.R). This regular expressions was written to replicate the methodology described in the CDC report, ["Identification of Deaths With Post-acute Sequelae of COVID-19 From Death Certificate Literal Text: United States, January 1,2020-June 30, 2022"](https://www.cdc.gov/nchs/data/vsrr/vsrr025.pdf), in which the CDC says that these terms were idenfitied in consultation with "subject matter experts and Centers for Disease Control and Prevention clinical guidance for PASC."

## `analysis` 
The math and code that support the findings in "[After Nationwide Review, CDC is Defining ‘Long COVID’ Deaths. We’ve Found Details About Those Who Died. Here are Some of Their Stories](https://www.muckrock.com/news/archives/2022/dec/14/long-covid-cdc-muckrock-analysis)" can be found in in the [`findings.Rmd`](https://github.com/DillonBergin/long-covid-deaths/tree/main/analysis) 


# Questions and Feedback
MuckRock's editorial team can be reached at [covid@muckrock.com](mailto:covid@muckrock.com)

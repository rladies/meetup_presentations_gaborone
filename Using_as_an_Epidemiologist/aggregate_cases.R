library(here)
library(readr)
library(janitor)
library(summarytools)
library(tidyverse)


aggregate <- read_csv(here ("data", "AggregateData.csv"))

#Tidy-up using Janitor package
aggregate<-clean_names(aggregate)
aggregate = remove_empty(aggregate, which = c("rows","cols"))

#A little exploration (periodname, city, age, career, data)
freq(aggregate$periodname)
freq(aggregate$city)
freq(aggregate$age)
freq(aggregate$career)

#Remove epidemiologists from the analysis
aggregate<- filter(aggregate, career %in% c("astronaut","farmer","pilot","surgeon"))

#Check out an overall summary of data
overall<-aggregate %>%
  dplyr::summarise(sumsurvey = sum(surveyed, na.rm = TRUE),
                   sumtestpos = sum(tested_positive, na.rm = TRUE),
                   sumtestneg = sum(tested_negative, na.rm = TRUE),
                   sumeligible = sum(treatment_eligible, na.rm = TRUE),
                   sumtreated = sum(treatment, na.rm = TRUE),) %>%
  mutate(treatprop = (sumtreated/sumtestpos)*100,
         treatup = (sumtreated/sumeligible)*100)

#Group by career
career<-aggregate %>%
  dplyr::group_by(career) %>%
  dplyr::summarise(sumsurvey = sum(surveyed, na.rm = TRUE),
                   sumtestpos = sum(tested_positive, na.rm = TRUE),
                   sumtestneg = sum(tested_negative, na.rm = TRUE),
                   sumeligible = sum(treatment_eligible, na.rm = TRUE),
                   sumtreated = sum(treatment, na.rm = TRUE),) %>%
  mutate(treatprop = (sumtreated/sumtestpos)*100,
         treatup = (sumtreated/sumeligible)*100)

#Group by age
age<-aggregate %>%
  dplyr::group_by(age) %>%
  dplyr::summarise(sumsurvey = sum(surveyed, na.rm = TRUE),
                   sumtestpos = sum(tested_positive, na.rm = TRUE),
                   sumtestneg = sum(tested_negative, na.rm = TRUE),
                   sumeligible = sum(treatment_eligible, na.rm = TRUE),
                   sumtreated = sum(treatment, na.rm = TRUE),) %>%
  mutate(treatprop = (sumtreated/sumtestpos)*100,
         treatup = (sumtreated/sumeligible)*100)

#Group by career and age
careerage<-aggregate %>%
  dplyr::group_by(career,age) %>%
  dplyr::summarise(sumsurvey = sum(surveyed, na.rm = TRUE),
                   sumtestpos = sum(tested_positive, na.rm = TRUE),
                   sumtestneg = sum(tested_negative, na.rm = TRUE),
                   sumeligible = sum(treatment_eligible, na.rm = TRUE),
                   sumtreated = sum(treatment, na.rm = TRUE),) %>%
  mutate(treatprop = (sumtreated/sumtestpos)*100,
         treatup = (sumtreated/sumeligible)*100)

#Recode period monthly data to quarters
freq(aggregate$periodname)
aggregate<-aggregate %>% mutate(quarter = ifelse(periodname %in% c("Oct-20","Nov-20","Dec-20"),"Q1",
                                                    ifelse(periodname %in% c("Jan-21","Feb-21","Mar-21"),"Q2", 
                                                      ifelse(periodname %in% c("Apr-21","May-21","Jun-21"),"Q3",
                                                        ifelse(periodname %in% c("Jul-21","Aug-21","Sep-21"),"Q4",NA)))))
freq(aggregate$quarter)


##Any trends over quarters?
quarter<-aggregate %>%
  dplyr::group_by(quarter) %>%
  dplyr::summarise(sumsurvey = sum(surveyed, na.rm = TRUE),
                   sumtestpos = sum(tested_positive, na.rm = TRUE),
                   sumtestneg = sum(tested_negative, na.rm = TRUE),
                   sumeligible = sum(treatment_eligible, na.rm = TRUE),
                   sumtreated = sum(treatment, na.rm = TRUE),) %>%
  mutate(treatprop = (sumtreated/sumtestpos)*100,
         treatup = (sumtreated/sumeligible)*100)
         
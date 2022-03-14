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

##Alternatively could do inverse
aggregate<- filter(aggregate, career != c("epidemiologist"))


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
         treatup = (sumtreated/sumeligible)*100,
         prevalence = (sumtestpos/sumsurvey)*100)

#Group by career and age
careerage<-aggregate %>%
  dplyr::group_by(career,age) %>%
  dplyr::summarise(sumsurvey = sum(surveyed, na.rm = TRUE),
                   sumtestpos = sum(tested_positive, na.rm = TRUE),
                   sumtestneg = sum(tested_negative, na.rm = TRUE),
                   sumeligible = sum(treatment_eligible, na.rm = TRUE),
                   sumtreated = sum(treatment, na.rm = TRUE),) %>%
  mutate(treatprop = (sumtreated/sumtestpos)*100,
         treatup = (sumtreated/sumeligible)*100,
         prevalence = (sumtestpos/sumsurvey)*100)

#Recode period monthly data to quarters
freq(aggregate$periodname)
aggregate <-aggregate %>% mutate(quarter = ifelse(periodname %in% c("20-Oct","20-Nov","20-Dec"),"Q1",
                                          ifelse(periodname %in% c("21-Jan","21-Feb","21-Mar"),"Q2",
                                          ifelse(periodname %in% c("21-Apr","21-May","21-Jun"),"Q3",
                                          ifelse(periodname %in% c("21-Jul","21-Aug","21-Sep"),"Q4",NA)))))

freq(aggregate$quarter)

#Could also use case when to avoid nested ifelse

##Any trends over quarters?
quarter<-aggregate %>%
  dplyr::group_by(quarter) %>%
  dplyr::summarise(sumsurvey = sum(surveyed, na.rm = TRUE),
                   sumtestpos = sum(tested_positive, na.rm = TRUE),
                   sumtestneg = sum(tested_negative, na.rm = TRUE),
                   sumeligible = sum(treatment_eligible, na.rm = TRUE),
                   sumtreated = sum(treatment, na.rm = TRUE),) %>%
  mutate(treatprop = (sumtreated/sumtestpos)*100,
         treatup = (sumtreated/sumeligible)*100,
         prevalence = (sumtestpos/sumsurvey)*100)

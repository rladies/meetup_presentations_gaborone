#packages and code to be used in the R packages for data cleaning workshop_25/01/2022

install.packages("janitor")
library(janitor)
install.packages("naniar")
library(naniar)
install.packages("data.table")
library(data.table)
install.packages("datawizard")
library(datawizard)


#extra packages for extra functionality
install.packages("readr")
library(readr)
install.packages("amelia")
library(amelia)
install.packages("tidyverse")
library(tidyverse)

#print an optimised amount of the results from the function
option(maxprint=1000000)

#read the csv using the readr package/ getwd(),use wd depending on wd
HP <- read_csv("C:/Users/Milikani/Documents/NYC_"

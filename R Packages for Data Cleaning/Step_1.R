library(Amelia)
library(naniar)
library(data.table)
library(datawizard)
library(janitor)
library(readr)
library(ggplot2)
library(dplyr)

HP <- read_csv("NYC_2022.csv")
View(HP)

HP <- datawizard::data_remove(HP,"latitude") #remove data.frame,column
HP <- datawizard::data_remove(HP,"longitude") #remove data.frame,column
HP <- datawizard::data_remove(HP,"id")        #remove data.frame,column
HP <- datawizard::data_reorder(HP,c("host_id","name")) #add the names of the cols in the new order
HP <- datawizard::data_reorder(HP,c("host_name","name")) #add the names of the cols in the new order
HP <- datawizard::data_reorder(HP,c("host_id","host_name")) #add the names of the cols in the new order
HP <- janitor::clean_names(HP) #changes to lower case
HP <- datawizard::data_rename(HP,"price","house_price") #changes col name
janitor::get_dupes(HP,colnames(HP)) #checks whether there are any duplicates
janitor::tabyl(HP,host_name) %>% adorn_pct_formatting(digit=0,affix_sign=TRUE)  #col tabulation
janitor::top_levels(as.factor(HP$house_price),5) %>%    #shows the lowest, middle and highest numeric range
  adorn_pct_formatting(digits = 0, affix_sign=TRUE)




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

option(maxprint=1000000)     #print an optimised amount of the results from the function

#read the csv using the readr package/ getwd(),use wd depending on wd
HP <- read_csv("C:/Users/Milikani/Documents/NYC_2022.csv")

View(HP)    #shows table

#use of datawizard package, remove latitude,longtitude and id column
HP <- data_remove(HP,"latitude")     
HP <- data_remove(HP,"longitude")
HP <- data_remove(HP,"id")

#relocate columns using datawizard
HP <- data_reorder(HP,c("host_id","name")
HP <- data_reorder(HP,c("host_name","name")
HP <- data_reorder(HP,c("host_id","host_name")

HP <- clean_names(HP)     #janitor package function yearbuilt and yearrenovated
HP <- data_rename(HP, "price","house_price")     #change of name from price to house_price

get_dupes(HP,host_id)   #check for duplicates  
HP %>% tabyl(neighbourhood) %>% adorn_pct_formatting(digit=0,affix_sign=TRUE)   #get frequency of neighbourhood column with pecentage format
top_levels(as.factor(HP$house_price),5) %>% adorn_pct_formatting(digits=0,affix_sign=TRUE)
                   
#Handling missing values 
any_miss(HP)  #TRUE or FALSE     
miss_var_summary(HP)   #frequency of missing values using lollipop plots
gg_miss_var(HP)     # visual relationship of  missing values 
gg_miss_upset(HP,order.by="freq")  
ggplot(HP,aes(x=YearBuilt,y=YearRemodAdd))_geom_miss_point()+facet_wrap(~calculated_host_istings_count)+theme_dark()       #categorical variable
HP <- impute_mean_if(HP,.predicate=is.double)  #impute(replace) NA with impute mean on double values
HP <- impute_mean_if(HP,.predicate=is.integer)  #impute(replace) NA with impute mean on integer values           
                   
#multiple imputation. an analysis of imputed values and observed values
#use of data.table package to drop columns to use multiple imputation
drop_dt < as.data.table(HP)
drop_col <- c('id','name','host_name','neighbourhood','neighbourhood_group','room_type','longitude','latitude')
col <- drop_dt[,!drop_col,with=FALSE]
res.amelia <- amelia(col,m=5)              #impute 5 datasets
compare.density(res.amelia,var="price")    #use of density plot to analysis of mean imputations
                   
#data wrangling using data.table                 
#change the data frame to data table
HP_dt <- as.data.table(HP)  #set dataframe to datable
class(HP_dt)      #shows data type of HP_dt

#filtering rows based on conditions. unlike data frames, data table is aware of column names
HP_dt[room_type=="Private room" & price>181500]
                   
#select given columns   
HP_dt[neighbourhood=="Harlem",.(neighbourhood,YearBuilt,YearRemodAdd,longitude,latitude)]
#creating a new column
HP_dt[,Mark:=reviews_per_month+numbers_of_reviews]
#delete column
HP_dt[,c("longitude"):=NULL]
                   
#Grouping using by   
average <- HP_dt[,.(mean_price=mean(price)),by=neighbourhood]
HP_dt[,.(.N,mil=max(price),tip=min(price) %>% round(2)),by=neighbourhood]     #chaining statement
                   
#key concept for Binary Search
setkey(HP_dt,neighbourhood)
key(HP_dt)     #shows the key of the data table
                   
#select rows using key   
HP_dt[.("Harlem")]  
room_by_neighbourhood <- HP_dt[.("Bedfore-Stuyvesant",.(neighbourhood_group,neighbourhood,room_type)]
  
#Aggregate using keyby                                 
ans <- HP_dt["Bedford-Stuyvesant",(max=numner_of_reviews),keyby=availability_365]
key(ans)  #available_365 key for ans data table
                                 
#merge/join data tables
final <- merge(average,room_by_neighbourhood)                                 
                   

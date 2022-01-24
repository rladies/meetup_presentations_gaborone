View(HP_dt <- data.table::as.data.table(HP))   #set data frame to data table
class(HP_dt)
head(HP_dt[room_type=="Private room" & house_price>181500],4) #filtering rows based on conditions
head(HP_dt[,.(host_id,host_name,name)],4)   #select given columns                                                       
head(HP_dt[neighbourhood=="Harlem",.(neighbourhood,     #select given cols by row selection
                                     number_of_reviews,
                                     availability_365
                                     )],4)
head(average <- HP_dt[,.(mean_price=mean(house_price)), #grouping using by 
                      by=neighbourhood],4)
head(chain_gang <- HP_dt[,.(.N,maximum=max(house_price),  #chaining statement
              minimum=min(house_price)  
         %>% round(2)),by=neighbourhood],4)   

#key concept for binary search. Sorts the data table by the key
data.table::setkey(HP_dt,neighbourhood)  #setting key for the data table
data.table::key(HP_dt)   #check data table key
head(HP_dt[.("Harlem")],3)     #select rows using key
room_by_neighbourhood <- HP_dt[.("Bedford-Stuyvesant"),
                               .(neighbourhood_group,neighbourhood,
                                room_type)]
head(room_by_neighbourhood)

#group using keyby
head(ans <- HP_dt["Hell's Kitchen",.(neighbourhood,
                                    max_review=number_of_reviews),
                                    keyby=availability_365],4)


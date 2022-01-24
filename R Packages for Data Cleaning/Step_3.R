drop_dt <- data.table::as.data.table(HP) #set data.frame to data.table
drop_col <- c('name',                    #drop column 
              'host_name',        
              'neighbourhood',
              'neighbourhood_group',
              'room_type')
col <- drop_dt[,!drop_col,with=FALSE]   #create new table
res.amelia <- Amelia::amelia(col,m=5)  #5 imputed data sets 
Amelia::compare.density(res.amelia,var="house_price")  #density plot to analysis
HP <- naniar::impute_mean_if(HP,.predicate = is.numeric)
naniar::any_miss(HP)         #check if there are any NA

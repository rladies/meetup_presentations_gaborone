naniar::any_miss(HP)           #check for NA
naniar::miss_var_summary(HP)   #NA frequency 
naniar::gg_miss_var(HP)        #NA visualization
naniar::gg_miss_upset(HP,order.by="freq")  #variable NA values relationship

ggplot2::ggplot(HP,aes(x=year_built,y=year_remod_add))+ #categorical variable
        geom_miss_point()+
        facet_wrap(~calculated_host_listings_count)+
        theme_dark()


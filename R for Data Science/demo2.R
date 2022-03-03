install.packages("readr")       #read file
install.packages("dplyr")        #data manipulation
install.packages("ggplot2")      #graphics and plotting
install.packages("naniar")       #missing values
install.packages("datawizard")    #data manipulation and descriptive statistics
install.packages("bayestestR")
install.packages("gapminder")  #teaching novices data wrangling and visualization in R
install.packages("gganimate")
install.packages("gifski")

library(datawizard)
library(readr)
library(dplyr)
library(ggplot2)
library(naniar)
library(bayestestR)
library(gapminder)
library(gganimate)
library(gifski)

ls("package:ggplot2")  #Functions available:

#DATA COLLECTION
data("starwars")      #data sets saved in RStudio
View(starwars)
getwd()                #get workstation
readr::write_csv(starwars,"/cloud/project/starwars.csv") #write data as csv file in workstation 
jedi <- read_csv("/cloud/project/starwars.csv")
View(jedi)
summary(jedi)


#DATA CLEANING and MANIPULATION
naniar::gg_miss_var(jedi)          #plotting missing values b columns
boxplot(jedi$height)           #displays outliers
datawizard::describe_distribution(jedi$height)
james_earl_jones <- select(jedi, -c(films, vehicles, starships))    #remove columns
View(james_earl_jones)


#PLOTTING(DATA VISUALISATION
ggplot(james_earl_jones, aes(sex, homeworld, colour = name)) + 
  geom_point()

#multiple plots
ggplot(james_earl_jones, aes(x = gender, y = height)) + 
  geom_point() + 
  facet_wrap (~species) 

#more plots
p1 <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, 
                            colour = country)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  facet_wrap(~continent) +
  # Animating the plot
  labs(title = 'Year: {frame_time}', x = 'GDP per capita',
       y = 'Life expectancy') +
  transition_time(year) +
  ease_aes('linear')
animate(p1, renderer = gifski_renderer())


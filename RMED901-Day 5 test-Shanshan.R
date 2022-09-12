# RMED901 - Day 5 Reading, exploring, tidying, exploring data - Shanshan 

library(tidyverse)
library(here)
here()

# using    ??here   to search the unknown package

read_csv(here("/Users/shanshan/RMD901_Group5", "Konsultasjoner.csv"))

myData <- read_csv(here("/Users/shanshan/RMD901_Group5", "Konsultasjoner.csv"))

myData 

head(myData)

# reading data file with read_delim()
# because the data is tab delimited

myData <- read_delim(here("/Users/shanshan/RMD901_Group5",
                          "Konsultasjoner.csv"), delim = "\t")
myData

#exploring original data
head(myData)
head(myData, 7)
tail(myData,15)
# alder column has both entries as ranges and something with or (last rows)
# some cell values as " .", which presumably make your column as type character

# view function should not used for the huge data set
view(myData)

summary(myData)

glimpse(myData)

skimr::skim(myData)

# :: skim function from the skimr package, not using all the function in that package

# package, naniar, is developed for exploring missing data.
naniar::gg_miss_var(myData)

# example of pipe function
head(myData$alder)
myData$alder %>% head()


# Spontaneous example inspired by the pipe function
sqrt(round(unlist(as.numeric(variable))))

variable %>% 
  as.numeric() %>% 
  unlist() %>% 
  round %>% 
  sqrt()



# the above two syntax are the same, but pipe function is more readable

# Reform the data set
# From wide to long

myData %>% 
  pivot_longer(names_to = "year", 
               values_to = "nConsultations", 
               cols = 4:12)

# Alternative

myData %>% 
  pivot_longer(names_to = "year", 
               values_to = "nConsultations", 
               cols = `2012`:`2020`)
               
# Use tab after cols to select the variable   

# if you want to change the orginal data, you have to assign the data in the following way, 
# otherwise the dataset will not be changed
# pipe sign should be at the end of the line not at the beginning of the line 

# For example:
# myData 
# %>% pivot_longer()

# myData <- 
#  myData %>% 
#  pivot_longer(names_to = "year", 
#               values_to = "nConsultations", 
#               cols = `2012`:`2020`) 

               
# Just to see how pivot_wider() works

myData <- 
   myData %>% 
   pivot_longer(names_to = "year", 
               values_to = "nConsultations", 
               cols = `2012`:`2020`) 

myData %>% 
  pivot_wider(names_from = year, 
              values_from = nConsultations)



# Separate function

myData %>% 
  separate(col = alder, 
           into = c("minAge", "maxAge"), 
           sep = "-")
               
# There is warning message, as at the tail of the alder colnum, there is value 
# with 90 or more,
# so there is warning message

# Rename function

myData <- 
  myData %>% 
  rename(age = alder,
         gender = kjonn,
         diagnosis = diagnose)

# Distinct function, remove duplicated ROW in the data set, the same values of the two rows,
# will be removed

myData %>%
  distinct()

# Count function

myData %>% 
  count(age)





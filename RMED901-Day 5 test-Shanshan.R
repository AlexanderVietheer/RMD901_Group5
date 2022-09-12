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

# view function should not used for the huge dataset
view(myData)

summary(myData)



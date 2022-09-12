# RMED901 - Day 5 Reading, exploring, tidying, exploring data - Shanshan 

library(tidyverse)
library(here)
here()

# using    ??here   to search the unknown package

read_csv(here("/Users/shanshan/RMD901_Group5", "Konsultasjoner.csv"))

myData <- read_csv(here("/Users/shanshan/RMD901_Group5", "Konsultasjoner.csv"))

myData 

head(myData)

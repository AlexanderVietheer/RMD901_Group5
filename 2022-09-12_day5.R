library(tidyverse)
library(here)
here()
myData <- read_csv(here("Data", "Konsultasjoner.csv"))
myData  # we see the file is tab separated

# reading datafile with read_delim()
# because the data is tab delimited

myData <- read_delim(here("Data", "Konsultasjoner.csv"), delim = "\t")
myData

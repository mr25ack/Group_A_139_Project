# 7COM1079 - Team Research & Development
# Group A_139  |  BMW Worldwide Sales Project
# Research Question:
# "Is there a correlation between Price_USD (Dependent) and Mileage_KM (Independent)
#  in the BMW used car market worldwide from 2010 to 2024?"

# 1. Load libraries
library(readr)
library(tidyverse)


# 2. Load the BMW dataset
bmw <- read_csv("BMW sales data (2010-2024) (1).csv")





#data cleaning
#check any NA in the data set and display the count 
nrow(is.na(bmw_sales))


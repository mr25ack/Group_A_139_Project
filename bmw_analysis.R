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













#A scatterplot to include the linear trendline
plot(bmw_dataClean$Mileage_KM, bmw_dataClean$Price_USD,
     xlab = "Mileage (KM)",
     ylab = "Price (USD)",
     main = "Mileage vs Price of BMW Used Cars",
)
abline(lm(bmw_dataClean$Mileage_KM ~ bmw_dataClean$Price_USD), col = "red")

#Paired t -test
t.test(bmw_dataClean$Mileage_KM, bmw_dataClean$Price_USD, paired = TRUE)
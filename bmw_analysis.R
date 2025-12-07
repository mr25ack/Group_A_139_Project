# 7COM1079 - Team Research & Development
# Group A_139  |  BMW Worldwide Sales Project
# Research Question:
# "Is there a correlation between Price_USD (Dependent) and Mileage_KM (Independent)
#  in the BMW used car market worldwide from 2010 to 2024?"

# 1. Load libraries
library(readr)
library(tidyverse)

# 2. Load the BMW dataset
BMW_sales <- read_csv("BMW sales data (2010-2024) (1).csv")

#distribution of data
# Price_USD, Sales_Volume, Mileage_KM, Engine_Size_L are continuous variables of our dataset.
hist(BMW_sales_data_2010_2024_1_$Price_USD, main = "Histogram of car prices")
hist(BMW_sales_data_2010_2024_1_$Engine_Size_L, main = "Histogram of engine sizes")
hist(BMW_sales_data_2010_2024_1_$Sales_Volume, main = "Histogram of sales volume")
hist(BMW_sales_data_2010_2024_1_$Mileage_KM, main = "Histogram of mileage in KM")

#data cleaning
#check any NA in the data set and display the count 
nrow(is.na(bmw_sales))
BMW_dataClean<- subset(
  BMW_sales,
  !is.na(Mileage_KM) & !is.na(Price_USD) 
)











#Based on the discussion
#A scatterplot to include the linear trendline
plot(BMW_dataClean$Mileage_KM, BMW_dataClean$Price_USD,
     xlab = "Mileage (KM)",
     ylab = "Price (USD)",
     main = "Mileage vs Price of BMW Used Cars",
)
abline(lm(BMW_dataClean$Mileage_KM ~ BMW_dataClean$Price_USD), col = "red")

#Paired t -test

t.test(BMW_dataClean$Mileage_KM, BMW_dataClean$Price_USD, paired = TRUE)

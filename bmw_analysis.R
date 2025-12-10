# 7COM1079 - Team Research & Development
# Group A_139  |  BMW Worldwide Sales Project
# Research Question(RQ3):
# "Is there a difference in proportions of sales of BMW car models 
#  between Asia and Africa from 2010 to 2024?"

# 1. Load libraries
library(readr)
library(tidyverse)

# 2. Load the BMW dataset
BMW_sales <- read_csv("BMW sales data (2010-2024) (1).csv")



#data cleaning
#check any NA in the data set and display the count 
nrow(is.na(bmw_sales))

#distribution of data
# Price_USD, Sales_Volume, Mileage_KM, Engine_Size_L are continuous variables of our dataset.
hist(BMW_sales_data_2010_2024_1_$Price_USD, main = "Histogram of car prices")
hist(BMW_sales_data_2010_2024_1_$Engine_Size_L, main = "Histogram of engine sizes")
hist(BMW_sales_data_2010_2024_1_$Sales_Volume, main = "Histogram of sales volume")
hist(BMW_sales_data_2010_2024_1_$Mileage_KM, main = "Histogram of mileage in KM")

#chi-squared test
df2<-subset(BMW_sales_data_2010_2024_1_,Region=="Asia" | Region=="Africa")
pt <- table(df2$Region,df2$Model)
chisq.test(pt)

#Contingency table
print(pt)














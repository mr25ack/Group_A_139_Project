# 7COM1079 - Team Research & Development
# Group A_139  |  BMW Worldwide Sales Project
# Research Question(RQ3):
# "Is there a difference in proportions of sales of BMW car models 
#  between Asia and Africa from 2010 to 2024?"

# Load libraries
library(readr)
library(tidyverse)
library(tibble)

#Load the BMW dataset
BMW_sales_data_2010_2024_1_ <- read_csv("BMW sales data (2010-2024) (1).csv")

# understand dataset
View(BMW_sales_data_2010_2024_1_)
print(colnames(BMW_sales_data_2010_2024_1_))
nrow(BMW_sales_data_2010_2024_1_)
print(head(BMW_sales_data_2010_2024_1_))

print(glimpse(BMW_sales_data_2010_2024_1_))
summary(BMW_sales_data_2010_2024_1_$Engine_Size_L)
summary(BMW_sales_data_2010_2024_1_$Mileage_KM)
summary(BMW_sales_data_2010_2024_1_$Price_USD)
summary(BMW_sales_data_2010_2024_1_$Sales_Volume)


#data cleaning
#check any NA in the data set and display the count 
nrow(is.na(BMW_sales_data_2010_2024_1_))

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

# Convert to proportions per model (column-wise)
percentages <- prop.table(pt, margin = 2) * 100

#opens the file for writing png file
png("Stacked_Bar_Chart.png")
# Plot stacked bar chart of proportions
barplot(percentages,
        col = c("pink", "blue"),           # Asia = pink, Africa = blue
        xlab = "Model",
        ylab = "Percentage",
        main = "Stacked Bar Of BMW car models: Asia vs Africa",
        ylim = c(0, 100),
        legend.text = c("Asia", "Africa"),
        args.legend = list(x = "topright"), las = 2, cex.names = 0.8, mgp = c(4, 1, 0)) 

#for best visualisation
tpercentages<-prop.table(t(pt), margin=2) * 100
barplot(tpercentages, col = c("red", "green", "yellow", "pink", "blue","orange","purple","lightblue","darkgreen","gray","black"),
        xlab= "Model", ylab = "Percentage", 
        main = "Stacked Bar Of BMW car models by Asia vs Africa", ylim = c(0, 100), 
        legend.text = rownames(tpercentages), args.legend = list(x = "topright"))

# closes the png file 
dev.off()














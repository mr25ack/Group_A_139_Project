# 7COM1079 - Team Research & Development
# Group A_139  |  BMW Sales Project
# Research Question:
# "Is there a correlation between car price and mileage
#  in the BMW used car market from 2010 to 2024?"

# 1. Load libraries
library(readr)
library(ggplot2)

# 2. Load the BMW dataset
bmw <- read_csv("BMW sales data (2010-2024) (1).csv")

# Quick check of the structure
str(bmw)

# We only need the two variables for our Research Question:
# Mileage_KM (independent variable)
# Price_USD (dependent variable)
# Check their summary statistics
summary(bmw$Mileage_KM)
summary(bmw$Price_USD)

# 3. Prepare data for analysis
# Remove any rows where either mileage or price is missing
bmw_clean <- subset(
  bmw,
  !is.na(Mileage_KM) & !is.na(Price_USD)
)
# How many complete observations do we have?
nrow(bmw_clean)

# 4. Visualisation 1: Histogram of Price with normal curve
# Calculate mean and standard deviation of price
mean_price <- mean(bmw_clean$Price_USD)
sd_price   <- sd(bmw_clean$Price_USD)
# Histogram with overlaid normal curve
ggplot(bmw_clean, aes(x = Price_USD)) +
  # Use density on y-axis so normal curve fits
  geom_histogram(aes(y = ..density..),
                 bins = 30,
                 colour = "black",
                 fill = "lightgrey") +
  stat_function(fun = dnorm,
                args = list(mean = mean_price, sd = sd_price),
                linewidth = 1) +
  labs(
    title = "Distribution of BMW Car Prices (2010–2024)",
    x = "Car price (USD)",
    y = "Density"
  )

# 5. Visualisation 2: Scatterplot of Price vs Mileage
ggplot(bmw_clean, aes(x = Mileage_KM, y = Price_USD)) +
  geom_point(alpha = 0.4) +
  geom_smooth(method = "lm", se = FALSE, linewidth = 1) +
  labs(
    title = "BMW Car Price vs Mileage (2010–2024)",
    x = "Mileage (km)",
    y = "Car price (USD)"
  )

# 6. Statistical test: Pearson correlation
# Our RQ is about correlation between two interval/ratio variables.
# According to the module notes we use cor.test().
cor_result <- cor.test(
  x = bmw_clean$Mileage_KM,
  y = bmw_clean$Price_USD,
  method = "pearson"   # parametric correlation
)

# Show full test output in the console
cor_result

# Extract key values for the report
correlation_coefficient <- cor_result$estimate
p_value                 <- cor_result$p.value

cat("\n\n--- Correlation test summary ---\n")
cat("Correlation (r) between mileage and price:", correlation_coefficient, "\n")
cat("p-value:", p_value, "\n")

# 7. Interpretation linked to H0 / H1
# H0: There is no correlation between car price and mileage
#     in the BMW used car market from 2010 to 2024.
# H1: There is a correlation between car price and mileage
#     in the BMW used car market from 2010 to 2024.

alpha <- 0.05  # significance level used in the module

if (p_value < alpha) {
  cat("\nDecision: p-value <", alpha, "so we REJECT the null hypothesis (H0).\n")
  cat("There is evidence of a linear correlation between mileage and price.\n")
} else {
  cat("\nDecision: p-value >=", alpha, "so we FAIL TO REJECT the null hypothesis (H0).\n")
  cat("We do not have enough evidence to claim a linear correlation between mileage and price.\n")
}
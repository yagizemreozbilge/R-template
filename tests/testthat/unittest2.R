# Load required libraries
library(template)
library(testthat)
library(dplyr)

# Sample data for testing
test_df <- data.frame(
  location = c("Turkey", "Germany", "Turkey", "India"),
  date = as.Date(c("2021-01-01", "2021-01-01", "2021-01-02", "2021-01-03")),
  total_cases = c(1000, 2000, 1500, 0),
  total_deaths = c(10, 20, 15, 0),
  new_cases = c(100, 200, 150, 0)
)

# Optional: source function if it's defined elsewhere
# source("R/ExampleFunctions.R")

# ------------------------------
# 2. add_cfr_column()
# ------------------------------
test_that("add_cfr_column() adds and calculates CFR correctly", {
  df <- add_cfr_column(test_df)
  
  # Check if 'cfr' column exists
  expect_true("cfr" %in% colnames(df))
  
  # Check if calculation is correct for first row
  expect_equal(df$cfr[1], calculate_cfr(10, 1000))
  
  # Check if all CFR values are numeric (even if NA)
  expect_true(all(is.numeric(df$cfr)))
})


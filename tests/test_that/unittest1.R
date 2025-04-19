# Load required libraries
library(testthat)
library(dplyr)
library(ggplot2)

# Sample data for testing
test_df <- data.frame(
  location = c("Turkey", "Germany", "Turkey", "India"),
  date = as.Date(c("2021-01-01", "2021-01-01", "2021-01-02", "2021-01-03")),
  total_cases = c(1000, 2000, 1500, 0),
  total_deaths = c(10, 20, 15, 0),
  new_cases = c(100, 200, 150, 0)
)

# 1. Test for calculate_cfr()
test_that("calculate_cfr() handles edge cases and basic math", {
  expect_equal(calculate_cfr(10, 1000), 1.00)
  expect_equal(calculate_cfr(0, 1000), 0.00)
  expect_equal(calculate_cfr(NA, 1000), NA_real_)
  expect_equal(calculate_cfr(10, 0), NA_real_)
  expect_equal(calculate_cfr(0, 0), NA_real_)
})


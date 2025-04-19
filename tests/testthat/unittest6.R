library(template)
library(testthat)
library(dplyr)

test_that("summarize_totals() returns grouped maximum values", {
  summary <- summarize_totals(test_df)
  expect_true(all(c("location", "total_cases", "total_deaths") %in% names(summary)))
  expect_equal(summary$total_cases[summary$location == "Turkey"], max(test_df$total_cases[test_df$location == "Turkey"]))
})

test_that("summarize_totals() handles NA safely", {
  temp_df <- test_df
  temp_df$total_cases[1] <- NA
  result <- summarize_totals(temp_df)
  expect_false(any(is.na(result$total_cases)))
})



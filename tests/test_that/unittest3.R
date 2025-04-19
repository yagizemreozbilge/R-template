library(testthat)

test_that("filter_data() filters correctly by country and date", {
  filtered <- filter_data(test_df, countries = c("Turkey", "India"), start_date = "2021-01-02", end_date = "2021-01-03")
  expect_true(all(filtered$location %in% c("Turkey", "India")))
  expect_true(all(filtered$date >= as.Date("2021-01-02") & filtered$date <= as.Date("2021-01-03")))
})

test_that("filter_data() returns empty for non-matching filters", {
  filtered <- filter_data(test_df, countries = c("Japan"))
  expect_equal(nrow(filtered), 0)
})


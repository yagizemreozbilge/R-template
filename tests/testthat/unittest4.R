library(template)
library(testthat)
library(ggplot2)

test_that("plot_daily_cases() returns a valid ggplot object", {
  plot <- plot_daily_cases(test_df)
  expect_s3_class(plot, "ggplot")
  expect_true("GeomLine" %in% class(plot$layers[[1]]$geom))
})


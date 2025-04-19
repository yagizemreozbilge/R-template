library(testthat)
library(ggplot2)
library(template)


test_that("plot_total_cases_log() returns log-scale plot", {
  plot <- plot_total_cases_log(test_df)
  expect_s3_class(plot, "ggplot")
  expect_true("GeomLine" %in% class(plot$layers[[1]]$geom))
})

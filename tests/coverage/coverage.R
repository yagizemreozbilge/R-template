library(covr)

# Scan all R source files and test files
coverage <- file_coverage(
  source_files = list.files("R", full.names = TRUE),
  test_files   = list.files("tests/testthat", full.names = TRUE)
)

# Calculate and display test coverage percentage
cat("📊 Test Coverage:", round(percent_coverage(coverage), 2), "%\n")

# Generate and open interactive HTML report in the browser
report(coverage)



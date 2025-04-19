# ------------------------------
# 1. Calculate Case Fatality Rate (CFR)
# ------------------------------
calculate_cfr <- function(total_deaths, total_cases) {
  if (is.na(total_deaths) || is.na(total_cases) || total_cases == 0) {
    return(NA)
  } else {
    return(round((total_deaths / total_cases) * 100, 2))
  }
}

# ------------------------------
# 2. Add CFR column to a data frame
# ------------------------------
add_cfr_column <- function(df) {
  df$cfr <- mapply(calculate_cfr, df$total_deaths, df$total_cases)
  return(df)
}

# ------------------------------
# 3. Filter data by country and date range
# ------------------------------
filter_data <- function(df, countries, start_date = "2020-01-01", end_date = "2023-12-31") {
  df <- df[df$location %in% countries, ]
  df <- df[df$date >= as.Date(start_date) & df$date <= as.Date(end_date), ]
  return(df)
}

# ------------------------------
# 4. Plot daily new cases by country
# ------------------------------
plot_daily_cases <- function(df) {
  library(ggplot2)
  ggplot(df, aes(x = date, y = new_cases, color = location)) +
    geom_line(linewidth = 0.8) +
    labs(
      title = "Daily New COVID-19 Cases",
      x = "Date",
      y = "New Cases",
      color = "Country"
    ) +
    theme_minimal()
}

# ------------------------------
# 5. Plot total cases (log scale)
# ------------------------------
plot_total_cases_log <- function(df) {
  library(ggplot2)
  ggplot(df, aes(x = date, y = total_cases, color = location)) +
    geom_line(linewidth = 0.8) +
    scale_y_log10() +
    labs(
      title = "Total COVID-19 Cases (Log Scale)",
      x = "Date",
      y = "Total Cases (log10)",
      color = "Country"
    ) +
    theme_minimal()
}

# ------------------------------
# 6. Summarize total cases and deaths per country
# ------------------------------
summarize_totals <- function(df) {
  df %>%
    group_by(location) %>%
    summarise(
      total_cases = max(total_cases, na.rm = TRUE),
      total_deaths = max(total_deaths, na.rm = TRUE),
      .groups = "drop"
    )
}
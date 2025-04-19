library(template)
covid_dataset <- data.frame(
  date = as.Date(c("2021-01-01", "2021-01-02", "2021-01-03")),
  location = c("Turkey", "Turkey", "Germany"),
  total_cases = c(1000, 1200, 1500),
  total_deaths = c(10, 12, 20),
  new_cases = c(100, 200, 300)
)

usethis::use_data(covid_dataset, overwrite = TRUE)



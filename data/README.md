The Data_clean folder contains the cleaned version of the COVID19 data.
# 📦 Load required libraries
library(dplyr)
library(readr)
library(lubridate)

# 📁 Read the raw dataset
# Adjust the path as necessary
raw_data <- read_csv("../../data_raw/owid-covid-data.csv")

# 🧹 Remove unnecessary columns (e.g. incomplete or irrelevant for analysis)
clean_data <- raw_data %>%
  select(-c(iso_code, new_tests_smoothed_per_thousand, handwashing_facilities,
            hosp_patients_per_million, excess_mortality_cumulative_absolute,
            excess_mortality_cumulative, excess_mortality, 
            excess_mortality_cumulative_per_million))

# 🧼 Filter out rows with missing key values
clean_data <- clean_data %>%
  filter(!is.na(date), !is.na(location), !is.na(total_cases))

# 🗓️ Ensure the date column is properly formatted
clean_data <- clean_data %>%
  mutate(date = as.Date(date))

# 🌍 Filter for selected countries
clean_data <- clean_data %>%
  filter(location %in% c("Turkey", "Germany", "United States", "India", "United Kingdom"))

# 🕰️ Limit the data to the 2020–2023 range
clean_data <- clean_data %>%
  filter(date >= as.Date("2020-01-01") & date <= as.Date("2023-12-31"))

# 🔍 Inspect the structure of the cleaned dataset
glimpse(clean_data)

# 💾 Save the cleaned dataset
write_csv(clean_data, "../../data_clean/owid-covid-data-clean.csv")


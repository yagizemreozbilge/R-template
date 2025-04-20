
# Create a subset with only the selected countries
selected_countries <- c("Turkey", "Germany", "India", "United Kingdom", "United States")
subset_data <- subset(data, location %in% selected_countries)

# Strip Chart for new_cases by country
stripchart(new_cases ~ location,
           data = subset_data,
           method = "jitter",       # spread points for visibility
           pch = 16,                # solid circle
           col = c("orange", "blue", "green", "purple", "red"),
           main = "New Cases Strip Chart (Selected Countries)",
           xlab = "Country", ylab = "New Cases")




# Make sure date column is in Date format
data$date <- as.Date(data$date)

# Filter countries
turkey  <- subset(data, location == "Turkey")
germany <- subset(data, location == "Germany")
india   <- subset(data, location == "India")
uk      <- subset(data, location == "United Kingdom")
usa     <- subset(data, location == "United States")

# Set up blank plot with proper range
plot(turkey$date, turkey$total_cases, type="n",
     main="Total COVID-19 Cases Over Time (5 Countries)",
     xlab="Date", ylab="Total Cases",
     ylim=c(0, max(usa$total_cases, na.rm=TRUE)))

# Add lines for each country
lines(turkey$date, turkey$total_cases, col="purple",      lwd=2)
lines(germany$date, germany$total_cases, col="steelblue", lwd=2)
lines(india$date, india$total_cases, col="orange",        lwd=2)
lines(uk$date, uk$total_cases, col="darkgreen",           lwd=2)
lines(usa$date, usa$total_cases, col="red",               lwd=2)

# Add legend
legend("topleft", legend=c("Turkey", "Germany", "India", "UK", "USA"),
       col=c("purple", "steelblue", "orange", "darkgreen", "red"),
       lty=1, lwd=2)





# Make sure 'date' is in Date format
data$date <- as.Date(data$date)

# Filter by country
turkey  <- subset(data, location == "Turkey")
germany <- subset(data, location == "Germany")
india   <- subset(data, location == "India")
uk      <- subset(data, location == "United Kingdom")
usa     <- subset(data, location == "United States")

# Save Turkey plot
png("turkey_total_cases_plot.png", width=800, height=600)
plot(turkey$date, turkey$total_cases, type="l", col="blue",
     main="Turkey - Total Cases", xlab="Date", ylab="Total Cases")
dev.off()

# Save Germany plot
png("germany_total_cases_plot.png", width=800, height=600)
plot(germany$date, germany$total_cases, type="l", col="steelblue",
     main="Germany - Total Cases", xlab="Date", ylab="Total Cases")
dev.off()

# Save India plot
png("india_total_cases_plot.png", width=800, height=600)
plot(india$date, india$total_cases, type="l", col="orange",
     main="India - Total Cases", xlab="Date", ylab="Total Cases")
dev.off()

# Save UK plot
png("uk_total_cases_plot.png", width=800, height=600)
plot(uk$date, uk$total_cases, type="l", col="darkgreen",
     main="UK - Total Cases", xlab="Date", ylab="Total Cases")
dev.off()

# Save USA plot
png("usa_total_cases_plot.png", width=800, height=600)
plot(usa$date, usa$total_cases, type="l", col="red",
     main="USA - Total Cases", xlab="Date", ylab="Total Cases")
dev.off()


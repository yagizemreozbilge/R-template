data <- read.csv("owid-covid-data-clean.csv")
turkey <- subset(data, location == "Turkey")

barplot(turkey$total_cases[1:10], names.arg=turkey$date[1:10],
        col="steelblue", main="Turkey - Total Cases (First 10 Days)",
        xlab="Date", ylab="Total Cases", las=2)





# Set plotting area margins: bottom, left, top, right
par(mar = c(3, 3, 3, 3))  

# Draw an enlarged pie chart
pie(top5$new_cases, labels=top5$location,
    main="Top 5 Countries by New Cases",
    col=rainbow(5),
    cex = 1.5)  # Increase overall size and text



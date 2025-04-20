stripchart(new_cases ~ location, data=subset(data, location %in% c("Turkey", "Italy", "Germany")),
           method="jitter", pch=16, col=c("orange", "blue", "green"),
           main="New Cases Strip Chart", xlab="Country", ylab="New Cases")



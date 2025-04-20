boxplot(new_cases ~ location, data=subset(data, location %in% c("Turkey", "Italy", "Germany")),
        col=c("tomato", "skyblue", "lightgreen"),
        main="New Cases Comparison",
        ylab="New Cases", xlab="Country")

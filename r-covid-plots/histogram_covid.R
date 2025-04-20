par(mfrow = c(3, 2))

hist(turkey$new_cases, breaks=50, col="darkgreen", 
     main="Turkey - New Cases", xlab="New Cases", ylab="Frequency", xlim=c(0, 50000))

hist(germany$new_cases, breaks=50, col="steelblue", 
     main="Germany - New Cases", xlab="New Cases", ylab="Frequency", xlim=c(0, 50000))

hist(india$new_cases, breaks=50, col="orange", 
     main="India - New Cases", xlab="New Cases", ylab="Frequency", xlim=c(0, 50000))

hist(uk$new_cases, breaks=50, col="purple", 
     main="UK - New Cases", xlab="New Cases", ylab="Frequency", xlim=c(0, 50000))

hist(usa$new_cases, breaks=50, col="red", 
     main="USA - New Cases", xlab="New Cases", ylab="Frequency", xlim=c(0, 50000))

plot.new()







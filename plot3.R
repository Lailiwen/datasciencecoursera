### Generating Plot 3
lineColour <- c("black", "red", "blue")
lineLabels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(data$dateTime, data$Sub_metering_1, type="l", col=lineColour[1], xlab="", ylab="Energy sub metering")
lines(data$dateTime, data$Sub_metering_2, col=lineColour[2])
lines(data$dateTime, data$Sub_metering_3, col=lineColour[3])
legend("topright", legend=lineLabels, col=lineColour, lty="solid")
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()
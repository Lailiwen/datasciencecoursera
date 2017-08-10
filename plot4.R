### Generating Plot 4
par(mfrow = c(2,2))
plot(data$dateTime, data$Global_active_power, 
     type = "l", col = "black",
     xlab = "", ylab = "Global Active Power (kilowatts)")
plot(data$dateTime, data$Voltage, 
     type="l", col="black", 
     xlab="datetime", ylab="Voltage")
lineColour <- c("black", "red", "blue")
lineLabels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(data$dateTime, data$Sub_metering_1, type="l", col=lineColour[1], xlab="", ylab="Energy sub metering")
lines(data$dateTime, data$Sub_metering_2, col=lineColour[2])
lines(data$dateTime, data$Sub_metering_3, col=lineColour[3])
legend("topright", legend=lineLabels, col=lineColour, lty="solid")
plot(data$dateTime, data$Global_reactive_power, 
     type="l", col="black", 
     xlab="datetime", ylab="Global_reactive_power")
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()
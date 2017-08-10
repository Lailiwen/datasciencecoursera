### Generating Plot 2
plot(data$dateTime, data$Global_active_power, 
     type = "l", col = "black",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
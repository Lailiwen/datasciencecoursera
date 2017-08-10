### Unzip the file and save it in the designated working directory
zipFile <- "./exdata%2Fdata%2Fhousehold_power_consumption.zip"
hsehold <- "./household_power_consumption.txt"
if (!file.exists(hsehold)) {
        unzip(zipFile, overwrite = T)
}

### Read in entire dataset
masterDB <- read.table(hsehold, header = T, sep = ";", na.strings = "?")

### Create a subset from the master database where the dates = 1/2/2007 or 2/2/2007
data <- masterDB[masterDB$Date %in% c("1/2/2007","2/2/2007"),]

### Convert the Date and Time variables to Date/Time classes
dateTime <-strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
data <- cbind(dateTime, data)


### Generating Plot 1
hist(data$Global_active_power, col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
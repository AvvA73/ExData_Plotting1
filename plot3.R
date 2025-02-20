# read data and set the table
pdata <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";" )
FTDate <- strptime(paste(pdata$Date, pdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
pdata <- cbind(pdata, FTDate)
# set data
pdata$Date <- as.Date(pdata$Date, format="%d/%m/%Y")
pdata$Time <- format(pdata$Time, format="%H:%M:%S")
pdata$Global_active_power <- as.numeric(pdata$Global_active_power)
pdata$Global_reactive_power <- as.numeric(pdata$Global_reactive_power)
pdata$Voltage <- as.numeric(pdata$Voltage)
pdata$Global_intensity <- as.numeric(pdata$Global_intensity)
pdata$Sub_metering_1 <- as.numeric(pdata$Sub_metering_1)
pdata$Sub_metering_2 <- as.numeric(pdata$Sub_metering_2)
pdata$Sub_metering_3 <- as.numeric(pdata$Sub_metering_3)
## subset data from 2007-02-01 and 2007-02-02
subsetdata <- subset(pdata, Date == "2007-02-01" | Date =="2007-02-02")
# plot
png("plot3.png", width=480, height=480)
with(subsetdata, plot(FTDate, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering"))
lines(subsetdata$FTDate, subsetdata$Sub_metering_2,type="l", col= "red")
lines(subsetdata$FTDate, subsetdata$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
dev.off()
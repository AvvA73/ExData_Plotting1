# read data
pdata <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
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
# subset data from 2007-02-01 and 2007-02-02
subsetdata <- subset(pdata, Date == "2007-02-01" | Date =="2007-02-02")      
# plot histogram of global active power
png("plot1.png", width=480, height=480)
hist(subsetdata$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()


cons <- read.csv(unz('../exdata-data-household_power_consumption.zip', 'household_power_consumption.txt'),
                 sep=';', na.strings='?')

# keep the data between 01/02/2007 and 02/02/2007
relevant.rows <- cons$Date == '1/2/2007' | cons$Date == '2/2/2007'
data <- cons[relevant.rows,]

dates <- paste(data$Date, data$Time, sep='|')
dates <- strptime(dates, format='%d/%m/%Y|%H:%M:%S', tz='GMT')

png(filename='plot4.png', width=480, height=480)

par(mfrow=c(2,2))

plot(x=dates, y=data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(x=dates, y=data$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(x=dates, y=data$Sub_metering_1, col="black", type="l", xlab="", ylab="Energy sub metereing")
lines(dates, data$Sub_metering_2, col="red")
lines(dates, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red","blue"))

plot(x=dates, y=data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
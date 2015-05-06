cons <- read.csv(unz('../exdata-data-household_power_consumption.zip', 'household_power_consumption.txt'),
                 sep=';', na.strings='?')

# keep the data between 01/02/2007 and 02/02/2007
relevant.rows <- cons$Date == '1/2/2007' | cons$Date == '2/2/2007'
data <- cons[relevant.rows,]

dates <- paste(data$Date, data$Time, sep='|')
dates <- strptime(dates, format='%d/%m/%Y|%H:%M:%S', tz='GMT')

png(filename='plot2.png', width=480, height=480)
plot(x=dates, y=data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowats)")
dev.off()
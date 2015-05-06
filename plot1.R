cons <- read.csv(unz('../exdata-data-household_power_consumption.zip',
                     'household_power_consumption.txt'),
                 sep=';', na.strings='?')

# keep the data between 01/02/2007 and 02/02/2007
relevant.rows <- cons$Date == '1/2/2007' | cons$Date == '2/2/2007'
data <- cons[relevant.rows,]

rm(cons)
rm(relevant.rows)

png(filename='plot1.png', width=480, height=480)

hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowats)", ylab="Frequency", col="red")

dev.off()

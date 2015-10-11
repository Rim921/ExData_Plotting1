
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
#data <- read.table(unzip(temp))
data <- read.table(unzip(temp),header=T, sep=';', na.strings="?", stringsAsFactors=F)
unlink(temp)

#dataFile <- "C:/Users/Rimon Dubnov/Desktop/R Coursera/household_power_consumption.txt"
#data <- read.table(dataFile, header=T, sep=';', na.strings="?", stringsAsFactors=F)
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
globalActivePower <- as.numeric(subSetData$Global_active_power)

weekday <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

data1 <- as.numeric(subSetData$Sub_metering_1)
data2 <- as.numeric(subSetData$Sub_metering_2)
data3 <- as.numeric(subSetData$Sub_metering_3)

png("plot4.png", height = 480, width = 480)

par(mar = c(4,4,4,4))
par(mfrow = c(2,2))

plot(weekday, subSetData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

plot(weekday, subSetData$Voltage, type = "l", xlab = "datetime", ylab = 'Voltage')

plot(weekday, data1, type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(weekday, data2, type = "l", col = "red")
lines(weekday, data3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(weekday, subSetData$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_Efective_Power")
dev.off
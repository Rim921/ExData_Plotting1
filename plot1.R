
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

png("plot1.png", width=480, height=480)

hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()

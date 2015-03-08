## Load the full dataset
data_full <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Choose a subset of the data
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 3
plot(data$Sub_metering_1~data$Datetime, type="l", col="black", ylab="Global Active Power (kilowatts)", xlab="")
lines(data$Sub_metering_2~data$Datetime, col='Red')
lines(data$Sub_metering_3~data$Datetime, col='Blue')
legend("topright", col=c("black", "red", "blue"),  lty = 1, 
       lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.5)

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
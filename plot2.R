## Load the full dataset
data_full <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Choose a subset of the data
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot the subset data
plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Saving to png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
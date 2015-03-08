## Load the full dataset
data_full <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Choose a subset of the data
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Plot the subset data
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (Kilowatts)", ylab="Frequency", col="Red")

## Saving to png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

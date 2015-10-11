
# EXPLORATORY DATA ANALYSIS - COURSE PROJECT 1 - PLOT4.R

# Download and unzip source data
FileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filename <- "exdata-data-household_power_consumption.zip"
if (!file.exists(filename)) {
  download.file(FileURL, filename, method="curl")
}
if (!file.exists("household_power_consumption.txt")) {unzip(filename)}

# Read data and subset between 1/Feb/2007 and 2/Feb/2007 (both included)
data <- read.table(file="household_power_consumption.txt", header=TRUE,
                   sep=";", stringsAsFactors=FALSE, dec=".")
selectedData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


# Get the variables to plot
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(selectedData$Sub_metering_1)
subMetering2 <- as.numeric(selectedData$Sub_metering_2)
subMetering3 <- as.numeric(selectedData$Sub_metering_3)
globalReactivePower <- as.numeric(selectedData$Global_reactive_power)
voltage <- as.numeric(selectedData$Voltage)

joinDataTime <- paste(selectedData$Date, selectedData$Time, sep=" ")
Sys.setlocale("LC_TIME", locale="C") #Change language to English, then plot weekdays in English
DateTime <- strptime(joinDataTime, "%d/%m/%Y %H:%M:%S") 

# Create the plot image (plot4.png)
png("plot4.png")
par(mfrow = c(2, 2)) 

plot(DateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(DateTime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(DateTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(DateTime, subMetering2, type="l", col="red")
lines(DateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

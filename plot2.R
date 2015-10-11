
# EXPLORATORY DATA ANALYSIS - COURSE PROJECT 1 - PLOT 2

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


# Get the variable to plot
globalActivePower <- as.numeric(selectedData$Global_active_power)



# Create the plot image (plot2.png)
joinDataTime <- paste(selectedData$Date, selectedData$Time, sep=" ")
Sys.setlocale("LC_TIME", locale="C") #Change language to English, then plot weekdays in English
DateTime <- strptime(joinDataTime, "%d/%m/%Y %H:%M:%S") 
png("plot2.png")
plot(DateTime, globalActivePower, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

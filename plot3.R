## Load Data
electric <- read.table(
      "/Users/mcassi17/Desktop/Coursera/household_power_consumption.txt", 
      header = TRUE, sep =";", na.strings = "?")

## Convert data to Dates and times
electric$Date <- as.Date(electric$Date, format="%d/%m/%Y")
electric$Time <- strptime(electric$Time, format = "%H:%M:%S")
electric$Time <- format(electric$Time, "%H:%M:%S")

# subset the data and combine date and time
twodays <- subset(electric, 
                  electric$Date =="2007-02-01" | electric$Date == "2007-02-02")
twodays$Time <- paste(twodays$Date, twodays$Time)
twodays$Time <- strptime(twodays$Time, format="%Y-%m-%d %H:%M:%S")

#create scatterplot
png('plot3.png', height = 480, width = 480)
plot(twodays$Time, twodays$Sub_metering_1, type = "n", xlab = "", 
     ylab = "Energy sub metering")
lines(twodays$Time, twodays$Sub_metering_1, col = "black")
lines(twodays$Time, twodays$Sub_metering_2, col = "red")
lines(twodays$Time, twodays$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), col = c("black", "red", "blue"), cex = 1)
dev.off()
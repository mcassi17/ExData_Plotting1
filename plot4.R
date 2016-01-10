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

#create all the plots
png('plot4.png', height = 480, width = 480)

par(mfrow = c(2,2))
plot(twodays$Time, twodays$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power", cex.lab = 1)
plot(twodays$Time, twodays$Voltage, type = "l", cex.lab = 1, 
     xlab = "datetime", ylab = "Voltage")
plot(twodays$Time, twodays$Sub_metering_1, type = "n", 
     cex.lab = 1, xlab = "", ylab = "Energy sub metering")
lines(twodays$Time, twodays$Sub_metering_1, col = "black")
lines(twodays$Time, twodays$Sub_metering_2, col = "red")
lines(twodays$Time, twodays$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), col = c("black", "red", "blue"), cex = 1, bty = "n")
plot(twodays$Time, twodays$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power", cex.lab = 1)
dev.off()
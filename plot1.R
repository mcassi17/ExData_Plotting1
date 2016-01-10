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

# create the histogram for global active power
png('plot1.png', height = 480, width = 480)
hist(twodays$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
     main = "Global Active Power")
dev.off()
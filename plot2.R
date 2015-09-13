
colNames <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data <- read.table("household_power_consumption.txt", header = FALSE, skip = 66637, nrows = 2880, na.strings = c("?"), sep = ";", col.names = colNames)


data$Date <- as.Date(data$Date , "%d/%m/%Y")

# new DateTime column
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%Y-%m-%d %H:%M:%S")

plot(data$DateTime, data$Global_active_power, xlab = "", ylab = "Global Active Power (killowatts)", type="l")

### COURSE PROJECT ONE IN EXPLORATORY DATA ANALYSIS ###
## PLOT 4 ##

data <- read.table("household_power_consumption.txt", 
                   sep = ";", header = TRUE, na.strings = "?")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strftime(strptime(data$Time, "%H:%M:%S"), "%H:%M:%S")

png("plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))

plot(data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "", xaxt = "n")
axis(side = 1, at = c(1, 60*24, 60*24*2), labels = c("Thu", "Fri", "Sat"))

plot(data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", xaxt = "n")
lines(data$Sub_metering_2, col = "red")
lines(data$Sub_metering_3, col = "blue")
axis(side = 1, at = c(1, 60*24, 60*24*2), labels = c("Thu", "Fri", "Sat"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, bty = "n")

plot(data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", xaxt = "n")
axis(side = 1, at = c(1, 60*24, 60*24*2), labels = c("Thu", "Fri", "Sat"))

plot(data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", xaxt = "n")
axis(side = 1, at = c(1, 60*24, 60*24*2), labels = c("Thu", "Fri", "Sat"))
dev.off()
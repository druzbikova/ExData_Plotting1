### COURSE PROJECT ONE IN EXPLORATORY DATA ANALYSIS ###
## PLOT 3 ##

data <- read.table("household_power_consumption.txt", 
                   sep = ";", header = TRUE, na.strings = "?")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strftime(strptime(data$Time, "%H:%M:%S"), "%H:%M:%S")

png("plot3.png", width = 480, height = 480)
plot(data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", xaxt = "n")
lines(data$Sub_metering_2, col = "red")
lines(data$Sub_metering_3, col = "blue")
axis(side = 1, at = c(1, 60*24, 60*24*2), labels = c("Thu", "Fri", "Sat"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)
dev.off()
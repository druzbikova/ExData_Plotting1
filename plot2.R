### COURSE PROJECT ONE IN EXPLORATORY DATA ANALYSIS ###
## PLOT 2 ##

data <- read.table("household_power_consumption.txt", 
                   sep = ";", header = TRUE, na.strings = "?")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strftime(strptime(data$Time, "%H:%M:%S"), "%H:%M:%S")

png("plot2.png", width = 480, height = 480)
plot(data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", xaxt = "n")
axis(side = 1, at = c(1, 60*24, 60*24*2), labels = c("Thu", "Fri", "Sat"))
dev.off()
# Read Data
data <- read.table(file = "household_power_consumption.txt", header=TRUE, 
        sep = ";", na.strings = "?")

library(lubridate)

data$date_time = dmy_hms(paste(data$Date, data$Time))
data$Month <- month(data$date_time)
data$Day <- mday(data$date_time)
data$Year <- year(data$date_time)                 

February <- data[(data$Year == 2007) & (data$Month == 2), ]
twodays <- February[February$Day == 1 | February$Day ==2, ]

# Open device
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE)

#Plot 4
par(mfrow= c(2, 2))

#Plot 1,1
plot(twodays$date_time, twodays$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power")
par(cex.axis=1.0)

#Plot 1,2
plot(twodays$date_time, twodays$Voltage, type = "l", xlab = "datetime", 
     ylab = "Voltage")
par(cex.axis=1.0)

#Plot 2,1
plot(twodays$date_time, twodays$Sub_metering_1, type = "l", col="black", 
     xlab = "", ylab = "Energy sub metering")
par(cex.axis=1.0)
lines(twodays$date_time, twodays$Sub_metering_2, type = "l", col="red")
lines(twodays$date_time, twodays$Sub_metering_3, type = "l", col="blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       bty = "n", cex=0.95)

#Plot 2,2
plot(twodays$date_time, twodays$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")
par(cex.axis=0.6)

dev.off()
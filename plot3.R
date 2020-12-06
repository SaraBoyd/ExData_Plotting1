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
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE)

#Plot 3
plot(twodays$date_time, twodays$Sub_metering_1, type = "l", col="black", 
     xlab = "", ylab = "Energy sub metering")
lines(twodays$date_time, twodays$Sub_metering_2, type = "l", col="red")
lines(twodays$date_time, twodays$Sub_metering_3, type = "l", col="blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

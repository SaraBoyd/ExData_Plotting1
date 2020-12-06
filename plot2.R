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
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE)

#Plot 2
plot(twodays$date_time, twodays$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

dev.off()


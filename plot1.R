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
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE)

#Plot 1
hist(twodays$Global_active_power, breaks = 12, main="Global Active Power", 
     xlab="Global Active Power (kilowatts) ", col = "red")

dev.off()


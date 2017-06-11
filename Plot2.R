url = "household_power_consumption.txt"
a1 <- read.csv(url, sep = ";", dec = ".", na.strings = c("?",""))
var1 <- a1[(a1$Date == "1/2/2007" | a1$Date == "2/2/2007"),]
var1$DateTime <- with(var1, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

with(var1, plot(DateTime, Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)"))

dev.copy(png, file = "plot2.png")
dev.off()

url = "household_power_consumption.txt"
a1 <- read.csv(url, sep = ";", dec = ".", na.strings = c("?",""))
var1 <- a1[(a1$Date == "1/2/2007" | a1$Date == "2/2/2007"),]

hist(var1$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     col = "red", main = "Global Active Power")

dev.copy(png, file = "plot1.png")
dev.off()

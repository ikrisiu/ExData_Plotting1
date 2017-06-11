url = "household_power_consumption.txt"
a1 <- read.csv(url, sep = ";", dec = ".", na.strings = c("?",""))
var1 <- a1[(a1$Date == "1/2/2007" | a1$Date == "2/2/2007"),]
var1$DateTime <- with(var1, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

par(mfcol = c(2, 2), mar = c(4, 4, 2, 1))
with(var1, {
  plot(DateTime, Global_active_power, type = "l", xlab = "")
  plot(DateTime, Sub_metering_1, 
     type = "l", xlab = "", ylab = "Energy sub metering")
   lines(DateTime, Sub_metering_2, col = "red")
   lines(DateTime, Sub_metering_3, col = "blue")
   legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = c(1,1,1), col=c("black","red", "blue"), bty = "n", y.intersp = 0.6)
  plot(DateTime, Voltage, type = "l", xlab = "datetime")
  plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime")
})
dev.copy(png, file = "plot4.png")
dev.off()

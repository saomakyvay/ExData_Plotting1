plot3 <- function () {
  powerdata <- read.table("household_power_consumption.txt",header = FALSE, sep = ";", col.names = c("Date", "Time", "Global_Active_Power", "Global_Reactive_Power", "Voltage", "Global_Intensity", "Energy_Sub-metering_1", "Energy_Sub-metering_2", "Energy_Sub-metering_3"), na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric"), skip = 66637, nrows = 2880)
  dt <- paste(powerdata$Date,powerdata$Time)
  st <- strptime(dt, format = "%d/%m/%Y %H:%M:%S")
  powerdata <- cbind(powerdata, st)
  png(file = "plot3.png", width = 480, height = 480)
  with(powerdata, plot(st, Energy_Sub.metering_1, xlab = "", ylab = "Energy sub metering", type = "n"))
  with(powerdata, lines(st, Energy_Sub.metering_1))
  with(powerdata, lines(st, Energy_Sub.metering_2, col = "red"))
  with(powerdata, lines(st, Energy_Sub.metering_3, col = "blue"))
  legend("topright", lty = "longdash", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  dev.off()
}
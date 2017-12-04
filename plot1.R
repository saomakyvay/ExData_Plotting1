plot1 <- function () {
powerdata <- read.table("household_power_consumption.txt",header = FALSE, sep = ";", col.names = c("Date", "Time", "Global_Active_Power", "Global_Reactive_Power", "Voltage", "Global_Intensity", "Energy_Sub-metering_1", "Energy_Sub-metering_2", "Energy_Sub-metering_3"), na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric"), skip = 66637, nrows = 2880)
png(file = "plot1.png", width = 480, height = 480)
with(powerdata, hist(Global_Active_Power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.off()
}
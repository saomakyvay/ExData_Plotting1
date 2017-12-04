plot2 <- function () {
powerdata <- read.table("household_power_consumption.txt",header = FALSE, sep = ";", col.names = c("Date", "Time", "Global_Active_Power", "Global_Reactive_Power", "Voltage", "Global_Intensity", "Energy_Sub-metering_1", "Energy_Sub-metering_2", "Energy_Sub-metering_3"), na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric"), skip = 66637, nrows = 2880)
dt <- paste(powerdata$Date,powerdata$Time)
st <- strptime(dt, format = "%d/%m/%Y %H:%M:%S")
powerdata <- cbind(powerdata, st)
png(file = "plot2.png", width = 480, height = 480)
with(powerdata, plot(st, Global_Active_Power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "n"))
with(powerdata, lines(st, Global_Active_Power))
dev.off()
}
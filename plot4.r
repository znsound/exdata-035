hdata <- read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors=F)
# str(hdata)

hdata$Date2 <- as.Date(hdata$Date, format="%d/%m/%Y")
subset_hdata <- subset(hdata, subset=(Date2 >= "2007-02-01" & Date2 <= "2007-02-02"))
# str(subset_hdata)

subset_hdata$DateTime <- strptime(paste(subset_hdata$Date, subset_hdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subset_hdata$Global_active_power <- as.numeric(subset_hdata$Global_active_power)
subset_hdata$Global_reactive_power <- as.numeric(subset_hdata$Global_reactive_power)
subset_hdata$Voltage <- as.numeric(subset_hdata$Voltage)
subset_hdata$Sub_metering_1 <- as.numeric(subset_hdata$Sub_metering_1)
subset_hdata$Sub_metering_2 <- as.numeric(subset_hdata$Sub_metering_2)
subset_hdata$Sub_metering_3 <- as.numeric(subset_hdata$Sub_metering_3)
# str(subset_hdata)

par(mfrow = c(2, 2)) 
plot(subset_hdata$DateTime, subset_hdata$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex.lab=0.8)
plot(subset_hdata$DateTime, subset_hdata$Voltage, type="l", xlab="datetime", ylab="Vlodate", cex.lab=0.8)

plot(subset_hdata$DateTime, subset_hdata$Sub_metering_1,
	type="l", xlab="", ylab="Energy Submetering", cex.lab=0.8)
lines(subset_hdata$DateTime, subset_hdata$Sub_metering_2, type="l", col="red")
lines(subset_hdata$DateTime, subset_hdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
	lty=1, lwd=1, pch=1, cex=0.8, inset=.05, bty="n", col=c("black", "red", "blue"))

plot(subset_hdata$DateTime, subset_hdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", cex.lab=0.8)

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

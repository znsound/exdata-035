hdata <- read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors=F)
# str(hdata)

hdata$Date2 <- as.Date(hdata$Date, format="%d/%m/%Y")
subset_hdata <- subset(hdata, subset=(Date2 >= "2007-02-01" & Date2 <= "2007-02-02"))
# str(subset_hdata)

subset_hdata$DateTime <- strptime(paste(subset_hdata$Date, subset_hdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subset_hdata$Global_active_power <- as.numeric(subset_hdata$Global_active_power)
# str(subset_hdata)

plot(subset_hdata$DateTime, subset_hdata$Global_active_power,
	type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
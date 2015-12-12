hdata <- read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors=F)
# str(hdata)

hdata$Date <- as.Date(hdata$Date, format="%d/%m/%Y")
subset_hdata <- subset(hdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
# str(subset_hdata)

subset_hdata$Global_active_power <- as.numeric(subset_hdata$Global_active_power)

hist(subset_hdata$Global_active_power, col="red", 
	main="Global Active Power", 
	xlab="Global Active Power (kilowatts)",
	ylab="Frequency")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

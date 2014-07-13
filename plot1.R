
# reading, subsetting and transforming data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
data2 <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
data3 <- transform(data2,
                   Global_active_power = as.numeric(Global_active_power),
                   Global_reactive_power = as.numeric(Global_reactive_power),
                   Voltage = as.numeric(Voltage),
                   Sub_metering_1 = as.numeric(Sub_metering_1),
                   Sub_metering_2 = as.numeric(Sub_metering_2),
                   Sub_metering_3 = as.numeric(Sub_metering_3))

data3$datetime <- paste(data3$Date,data3$Time)
data3$datetime <- strptime(data3$datetime, format="%d/%m/%Y %H:%M:%S")
# Drawing the plot
png(filename="plot1.png",width=480,height=480,units="px")
hist(data3$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
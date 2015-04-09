#read in subset of the raw data:

power<-read.table("./data/household_power_consumption.txt",sep=";",header=FALSE,skip=66637, nrows=2880,
                  na.strings="?")
names(power)<-c("Date","Time","Global_active_power","Global_reactive_power",
                "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                "Sub_metering_3")
#create new column
power$Date_Time = paste(power$Date, power$Time)

#convert to POSIXlt
power$DateTimeReal = strptime(power$Date_Time, "%d/%m/%Y %H:%M:%S")

#create plot
par(mar=c(4,6,6,2))
plot(power$DateTimeReal,power$Sub_metering_1, ylab="Energy sub metering", xlab="", type = "l")
lines(power$DateTimeReal,power$Sub_metering_2, col="red")
lines(power$DateTimeReal,power$Sub_metering_3, col="blue")

#create legend
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1),
       col = c("black", "red", "blue"),cex= .65)

# Copy plot to a PNG file:
dev.copy(png, file = "plot3.png", width=480, height=480)
# Close the PNG device:
dev.off()
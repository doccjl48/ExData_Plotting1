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
#set parameters for layout:
par(mfrow=c(2,2),cex.lab=.65, mar=c(5.1,6,4.1,2.1))
#first plot:
plot(power$DateTimeReal,power$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)" )
#second plot:
par(cex.lab=.75, mar=C(5.1,4.1,4.1,2.1))
plot(power$DateTimeReal,power$Voltage, type="l", xlab="datetime",
     ylab="Voltage")
# third plot:
par(cex.lab=.75,mar=c(5.1,6,4.1,2.1))
plot(power$DateTimeReal,power$Sub_metering_1, ylab="Energy sub metering", xlab="", type = "l")
lines(power$DateTimeReal,power$Sub_metering_2, col="red")
lines(power$DateTimeReal,power$Sub_metering_3, col="blue")

#create legend
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1),
       col = c("black", "red", "blue"),cex= .5, bty="n")
#fourth plot:
par(cex.lab=.75, mar=C(5.1,4.1,4.1,2.1))
plot(power$DateTimeReal,power$Global_reactive_power,ylab="Global_reactive_power", xlab="datetime", type="l")

# Copy plot to a PNG file:
dev.copy(png, file = "plot4.png", width=480, height=480)
# Close the PNG device:
dev.off()
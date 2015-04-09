#read in subset of the raw data:

power<-read.table("./data/household_power_consumption.txt",sep=";",header=FALSE,skip=66637, nrows=2880,
                  na.strings="?")
names(power)<-c("Date","Time","Global_active_power","Global_reactive_power",
                "Voltage","Global_intensity","Sub_meeting_1","Sub_meeting_2",
                "Sub_meeting_3")
#create new column
power$Date_Time = paste(power$Date, power$Time)

#convert to POSIXlt
power$DateTimeReal = strptime(power$Date_Time, "%d/%m/%Y %H:%M:%S")

#Create plot
par(mar=4,6,4,2)
plot(power$DateTimeReal,power$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")

# Copy plot to a PNG file:
dev.copy(png, file = "plot2.png")
# Close the PNG device:
dev.off()

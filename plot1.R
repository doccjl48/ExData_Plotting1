#read in subset of the raw data:

power<-read.table("./data/household_power_consumption.txt",sep=";",header=FALSE,skip=66637, nrows=2880,
              na.strings="?")
names(power)<-c("Date","Time","Global_active_power","Global_reactive_power",
            "Voltage","Global_intensity","Sub_meeting_1","Sub_meeting_2",
            "Sub_meeting_3")

#create and annotate histogram:

par(mar=c(5,6,4,2))
hist(power$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)",
     ylab="Frequency", col="red")

# Copy plot to a PNG file:
dev.copy(png, file = "plot1.png")
# Close the PNG device:
dev.off()

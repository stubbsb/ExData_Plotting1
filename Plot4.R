###Open dataset
hpcdata <- read.csv("C:/Users/Ben/Desktop/DataScienceSeries/ExploratoryDataAnalysis/hpcdata.txt", sep=";")

###Convert Date (currently a factor variable) to a date variable called Date2
hpcdata$Date2<-strptime(hpcdata$Date, "%d/%m/%Y")

###Save data for 7/1/2007 and 7/2/2007 to a dataframe called data
data <- hpcdata[hpcdata$Date2 > as.POSIXlt("2007-01-31") & hpcdata$Date2 < as.POSIXlt("2007-02-03"), ]
###Create variable called dateTime that combines the Date and Time variables into one
data$dateTime<-strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

###Convert Global_active_power variable (currently a factor) to numeric variable called gap
data$gap<-as.numeric(levels(data$Global_active_power))[data$Global_active_power]

###Plot 4 - Panel of 4 plots
png (file="C:/Users/Ben/Desktop/DataScienceSeries/ExploratoryDataAnalysis/plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
#Panel 1
plot(data$dateTime, data$gap, type="l", xlab="", ylab="Global active power (kilowatts)")
#Panel 2
plot(data$dateTime, as.numeric(levels(data$Voltage))[data$Voltage], type="l", xlab="", ylab="Voltage")
#Panel 3
plot(data$dateTime, as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1], type="l", xlab="", ylab="Energy sub-metering")
lines(data$dateTime, as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2], col="red")
lines(data$dateTime, data$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Panel 4
plot(data$dateTime, as.numeric(levels(data$Global_reactive_power))[data$Global_reactive_power], type="l", xlab="", ylab="Global_reactive_power")
dev.off()

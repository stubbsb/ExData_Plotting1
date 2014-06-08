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

###Plot 1 - histogram of gap variable the two days included in the data dataframe, saved as a png file
png (file="C:/Users/Ben/Desktop/DataScienceSeries/ExploratoryDataAnalysis/plot1.png", width = 480, height = 480)
hist(data$gap, main="Global Active Power", xlab="Global active power (kilowatts)", col="red")
dev.off()


library(lubridate)

#read data
data<-read.csv(".\\household_power_consumption.txt", header=TRUE, sep=";",
               na.string="?", colClasses=c(rep("character", 2), rep("numeric", 7)))
data_subset<-subset(data, Date=="1/2/2007"|Date=="2/2/2007")

#convert to date format
data_subset$Datetime<-paste(data_subset$Date,data_subset$Time)

data_subset$Date<-dmy(data_subset$Date)
data_subset$Time<-hms(data_subset$Time)
data_subset$Datetime<-dmy_hms(data_subset$Datetime)
#class(data_sebset$Date)
#class(data_sebset$Time)

#plot
png("plot3.png", width=480, height=480)

plot(data_subset$Sub_metering_1~data_subset$Datetime,
     type="l",
     xlab="",
     ylab="Energy sub metering")
lines(data_subset$Sub_metering_2~data_subset$Datetime,
     col="red")
lines(data_subset$Sub_metering_3~data_subset$Datetime,
     col="blue")

legend("topright",
       col=c("black", "red", "blue"),
       lty=1,
       lwd=1,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       )

dev.off()
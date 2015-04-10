
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
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(data_subset$Global_active_power~data_subset$Datetime,
     type="l",
     xlab="",
     ylab="Gloabl Active Power")
plot(data_subset$Voltage~data_subset$Datetime,
     type="l",
     xlab="datetime",
     ylab="Voltage")
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
       bty="n",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       cex=0.9
       )
plot(data_subset$Global_reactive_power~data_subset$Datetime,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()
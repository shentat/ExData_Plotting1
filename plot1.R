
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
png("plot1.png", width=480, height=480)
hist(data_subset$Global_active_power, col="red", 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency"
)
dev.off()
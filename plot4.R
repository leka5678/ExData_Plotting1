data <- read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactors=F, na.strings="?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
subdata<-subset(data,data$Date=="2007-02-01"|data$Date=="2007-02-02")
subdata$Global_active_power<-as.numeric(subdata$Global_active_power)
datetime<-paste(subdata$Date,subdata$Time)
datetime<-as.POSIXct(datetime)
png(file="plot4.png")
par(mfrow=c(2,2))
plot(datetime,subdata$Global_active_power,type = "l",lty=1,xlab=" ",ylab="Global Active Power")
plot(datetime,subdata$Voltage,type = "l",lty=1,ylab="Voltage")
plot(datetime,subdata$Sub_metering_1,type = "l",lty=1,xlab=" ",ylab="Energy sub metering")
lines(datetime,subdata$Sub_metering_2, col = "red")
lines(datetime,subdata$Sub_metering_3, col = "blue")
legend("topright",lty = 1,col = c("black","red","blue"),bty = "n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(datetime,subdata$Global_reactive_power,type = "l",lty=1,ylab="Global_reactive_power")
dev.off()
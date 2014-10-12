plot4 <- function() 
{
  data<-read.csv(file="household_power_consumption.txt", sep=";", colClasses="character")
  data<-data[which(data[,1] %in% c("1/2/2007","2/2/2007")),]
  data$Global_active_power <-as.numeric(data$Global_active_power)
  data$TD <- strptime(paste(data$Date, data$Time, sep=","), format="%d/%m/%Y,%H:%M:%S")
  png(filename="plot4.png", width = 480, height = 480)
  par(mfrow=c(2,2))
  with(data, plot(TD, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
  with(data, plot(TD, Voltage, type="l", xlab="datetime", ylab="Voltage"))
  
  with(data, plot(TD, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
  with(data, lines(TD,Sub_metering_1))
  with(data, lines(TD,Sub_metering_2, col="red"))
  with(data, lines(TD,Sub_metering_3, col="blue"))
  legend("topright", lwd=c(2.5,2.5), col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  with(data, plot(TD, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
  dev.off()
}
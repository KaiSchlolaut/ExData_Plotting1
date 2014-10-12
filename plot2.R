plot2 <- function() 
{
  data<-read.csv(file="household_power_consumption.txt", sep=";", colClasses="character")
  data<-data[which(data[,1] %in% c("1/2/2007","2/2/2007")),]
  data$Global_active_power <-as.numeric(data$Global_active_power)
  data$TD <- strptime(paste(data$Date, data$Time, sep=","), format="%d/%m/%Y,%H:%M:%S")
  png(filename="plot2.png", width = 480, height = 480)
  with(data, plot(TD, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
  dev.off()
}
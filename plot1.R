plot1 <- function() 
{
  data<-read.csv(file="household_power_consumption.txt", sep=";", colClasses="character")
  data<-data[which(data[,1] %in% c("1/2/2007","2/2/2007")),]
  data$Global_active_power <-as.numeric(data$Global_active_power)
  png(filename="plot1.png", width = 480, height = 480)
  hist(data$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", 
       col="red", ylim=c(0,1200))
  dev.off()
}
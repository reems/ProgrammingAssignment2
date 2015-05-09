plot4 <- function() {
    
  hpc <- read.table("./data/household_power_consumption.txt", sep=";",header=TRUE)
  hpc$Date <- as.Date(hpc$Date,format="%d/%m/%Y")
  D1 <- as.Date("2007-02-01")
  D2 <- as.Date("2007-02-02")
  hpc <- subset(hpc, Date %in% c(D1,D2))
  
  hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
  hpc$Global_reactive_power <- as.numeric(as.character(hpc$Global_reactive_power))
  hpc$Sub_metering_1 <- as.numeric(as.character(hpc$Sub_metering_1))
  hpc$Sub_metering_2 <- as.numeric(as.character(hpc$Sub_metering_2))
  hpc$Sub_metering_3 <- as.numeric(as.character(hpc$Sub_metering_3))
  
  hpc$DateTime <- strptime(as.character(paste(hpc$Date,hpc$Time)), format="%Y-%m-%d %H:%M:%S")
  
  par(mfrow=c(2,2))
  
  plot(hpc$DateTime, hpc$Global_active_power, type="l", ylab="Global Active Power(kilowatts)",xlab="")
  plot(hpc$DateTime, hpc$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  plot(hpc$DateTime, hpc$Sub_metering_1, 
       type="l", 
       xlab="", 
       ylab="Energy sub metering")
  
  points(hpc$DateTime, hpc$Sub_metering_2, type="l", col="red")
  points(hpc$DateTime, hpc$Sub_metering_3, type="l", col="blue")
  
  legend("topright", pch="__", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  plot(hpc$DateTime, hpc$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  dev.copy(png,"plot4.png")
  dev.off()
  
}
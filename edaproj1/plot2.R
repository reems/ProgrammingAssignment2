plot2 <- function(){
  
  hpc <- read.table("./data/household_power_consumption.txt", sep=";",header=TRUE)
  hpc$Date <- as.Date(hpc$Date,format="%d/%m/%Y")
  D1 <- as.Date("2007-02-01")
  D2 <- as.Date("2007-02-02")
  hpc <- subset(hpc, Date %in% c(D1,D2))
  
  hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
  
  hpc$DateTime <- strptime(as.character(paste(hpc$Date,hpc$Time)), format="%Y-%m-%d %H:%M:%S")
  
  par(mfrow=c(1,1))
  
  plot(hpc$DateTime, hpc$Global_active_power, type="l", ylab="Global Active Power(kilowatts)",xlab="")
  
  dev.copy(png,"plot2.png")
  dev.off()

}
plot1 <- function() {
  
  hpc <- read.table("./data/household_power_consumption.txt", sep=";",header=TRUE)
  hpc$Date <- as.Date(hpc$Date,format="%d/%m/%Y")
  D1 <- as.Date("2007-02-01")
  D2 <- as.Date("2007-02-02")
  hpc <- subset(hpc, Date %in% c(D1,D2))
  
  hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
  
  par(mfrow=c(1,1))
  
  hist(hpc$Global_active_power, 
       col="red",
       main="Global Active Power", 
       xlab="Global Active Power (kilowatts)",
       )
  
  dev.copy(png,"plot1.png")
  dev.off()

}
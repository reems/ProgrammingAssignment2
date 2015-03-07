hpc <- read.table("./data/household_power_consumption.txt", sep=";",header=TRUE)
hpc <- hpc[grepl("1/2/2007",hpc$Date)|grepl("2/2/2007",hpc$Date),]
hist(table(hpc$Global_active_power), col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")

#load the power dataset
setwd("C:/Users/washbuan.ENGINEERING/Documents/R")
power <- read.csv2("household_power_consumption.txt")

#wrangle the date
febPower <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
febPower$Date <- as.character(febPower$Date)
febPower$Time <- as.character(febPower$Time)
febPower$Event <- as.POSIXct(paste(febPower$Date, febPower$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")
febPower$Global_active_power <- as.numeric(as.character(febPower$Global_active_power))
febPower$Global_reactive_power <- as.numeric(as.character(febPower$Global_reactive_power))
febPower$Voltage <- as.numeric(as.character(febPower$Voltage))
febPower$Global_intensity <- as.numeric(as.character(febPower$Global_intensity))
febPower$Sub_metering_1 <- as.numeric(as.character(febPower$Sub_metering_1))
febPower$Sub_metering_2 <- as.numeric(as.character(febPower$Sub_metering_2))
febPower$Sub_metering_3 <- as.numeric(as.character(febPower$Sub_metering_3))

str(febPower)  #check data is in correct formats

#Trend plot of Global Active Power
activePowerTrend <- function(){
  plot(Global_active_power~Event, data = febPower, type = 'l', ylab = 'Global Active Power (kilowatts)')
}

png('plot2.png')
activePowerTrend()
dev.off()
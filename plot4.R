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

#str(febPower)  #check data is in correct formats

#histogram of Global Active Power
activePowerHist<-function(){ 
  hist(febPower$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency', main = 'Global Active Power')
}

#activePowerHist()

#Trend plot of Global Active Power
activePowerTrend <- function(){
  plot(Global_active_power~Event, data = febPower, type = 'l', ylab = 'Global Active Power (kilowatts)')
}
reacivePowerTrend <- function(){
  plot(Global_reactive_power~Event, data = febPower, type = 'l', xlab = 'datetime', ylab = 'Global_reactive_power')
}

#activePowerTrend()

#Trend Plot of Sub Meters
subMeterTrend <- function(){
  plot(Sub_metering_1~Event, data = febPower, type = 'l', ylab = 'Global Active Power (kilowatts)')
  points(Sub_metering_2~Event, data = febPower, type = 'l', col = 'red')
  points(Sub_metering_3~Event, data = febPower, type = 'l', col = 'blue')
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
}

#subMeterTrend()

#Voltage Trend Plot
voltageTrend <- function(){
  plot(Voltage~Event, data = febPower, type = 'l', xlab = 'datetime', ylab = 'Voltage')
}
#voltageTrend()

#Create 4 plots together
png('plot4')
  par(mfrow = c(2,2), mar = c(4,4,1,1))
  activePowerTrend()
  voltageTrend()
  subMeterTrend()
  reacivePowerTrend()
dev.off()
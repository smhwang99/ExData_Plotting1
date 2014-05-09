# Project assignment 1 for explore data analysis course

data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", skip = 0, nrows = 70000)
data$Date <- strptime(as.character(data$Date), "%d/%m/%Y")
data2 <- data[data$Date >= as.POSIXlt("2007-02-01") & data$Date <= as.POSIXlt("2007-02-02"),]
data2$Global_active_power = as.numeric(as.character(data2$Global_active_power))

data2$day <- weekdays(data2$Date,abbreviate=TRUE)
# Start plotting 
plot(1:nrow(data2),data2$Global_active_power, type = 'l', xaxt='n', yaxt='n',xlab = '',
     ylab = "Global Active Power (kilowatts)")
axis(2,at =seq(0,6,2), labels=seq(0,6,2))
axis(1,at =seq(1,2880,1400),labels=c(data2$day[1],data2$day[1441],
                                     weekdays(as.POSIXlt("2007-02-03"),TRUE)))

dev.copy(png,file ="./plot2.png",width = 480, height = 480) # copy plot to png file
dev.off() # close png file

# Project assignment 1 for explore data analysis course

data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", skip = 0, nrows = 70000)
tail(data$Date)
data$Date <- strptime(as.character(data$Date), "%d/%m/%Y")
tail(data$Date)
data2 <- data[data$Date >= as.POSIXlt("2007-02-01") & data$Date <= as.POSIXlt("2007-02-02"),]
data2$Global_active_power = as.numeric(as.character(data2$Global_active_power))

hist(data2$Global_active_power, xaxt='n', yaxt='n', main = "Global Active Power",col="red", #breaks = seq(0,6,0.5),
     xlab = "Global Active Power (kilowatts)",xlim = c(0,6),ylim=c(0,1200))
axis(1,at =seq(0,6,2), labels=seq(0,6,2))
axis(2,at =seq(0,1200,200),labels=seq(0,1200,200))
dev.copy(png,file ="./plot1.png",width = 480, height = 480) # copy plot to png file
dev.off() # close png file


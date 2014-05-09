#
# Project assignment 1 for exploratory data analysis course
# plot2.R - the R code to plot plot2.png
#
# Read the data from unzipped file
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", skip = 0, nrows = 70000)

# convert Date variable from factor to Date
data$Date <- strptime(as.character(data$Date), "%d/%m/%Y")
data2 <- data[data$Date >= as.POSIXlt("2007-02-01") & data$Date <= as.POSIXlt("2007-02-02"),]

# Transform data from factor to numeric
data2$Global_active_power = as.numeric(as.character(data2$Global_active_power))
data2$Voltage = as.numeric(as.character(data2$Voltage))
data2$Global_reactive_power = as.numeric(as.character(data2$Global_reactive_power))
data2$Sub_metering_1 = as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2 = as.numeric(as.character(data2$Sub_metering_2))
data2$Sub_metering_3 = as.numeric(as.character(data2$Sub_metering_3))

# Add weekdays abbreviation as a separated "day" column
data2$day <- weekdays(data2$Date,abbreviate=TRUE)

# Start plotting 
par(mfrow = c(1,1))
plot(1:nrow(data2),data2$Global_active_power, type = 'l', xaxt='n', yaxt='n',xlab = '',
     ylab = "" )# "Global Active Power (kilowatts)")
mtext("Global Active Power (kilowatts)", side=2, line=2.5,cex=0.9)
axis(2,at =seq(0,6,2), labels=seq(0,6,2))
axis(1,at =seq(1,2880,1400),labels=c(data2$day[1],data2$day[1441],
                                     weekdays(as.POSIXlt("2007-02-03"),TRUE)))

dev.copy(png,file ="./plot2.png",width = 480, height = 480) # copy plot to png file
dev.off() # close png file

#
# Project assignment 1 for exploratory data analysis course
# plot1.R - the R code to plot plot1.png
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
hist(data2$Global_active_power, xaxt='n', yaxt='n', main = "Global Active Power",col="red", #breaks = seq(0,6,0.5),
     xlab = "Global Active Power (kilowatts)",xlim = c(0,6),ylim=c(0,1200))
axis(1,at =seq(0,6,2), labels=seq(0,6,2))
axis(2,at =seq(0,1200,200),labels=seq(0,1200,200))

dev.copy(png,file ="./plot1.png",width = 480, height = 480) # copy plot to png file
dev.off() # close png file


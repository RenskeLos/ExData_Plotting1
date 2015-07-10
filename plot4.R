# This script creates four graphs from the same data set on one page. 
# The graphs in the first column are identical to plots 2 and 3. 
# The graphs in the second column are new.

# Import data from text file in working directory 
HPC <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

# Make a date/time column by combining HPC$Date with HPC$Time
HPC$DateTime <- strptime(paste(HPC$Date,HPC$Time), format="%d/%m/%Y %H:%M:%S")

# Select only data from 2007-02-01 or 2007-02-02
HPCfeb1and2 = subset(HPC, as.Date(HPC$DateTime) == "2007-02-01" 
                     | as.Date(HPC$DateTime) == "2007-02-02")

# Start the png graphics device to write to file
png(filename="plot4.png", height=480, width=480, bg="transparent")

# Set the number of graphs per page (column oriented)
par(mfcol=c(2, 2))

# Plot the top left graph (=plot2)
plot(HPCfeb1and2$DateTime, HPCfeb1and2$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")

# Plot the graph with labels on both axes
plot(HPCfeb1and2$DateTime, HPCfeb1and2$Sub_metering_1, type= 'l', xlab="", ylab="Energy sub metering")
lines(HPCfeb1and2$DateTime, HPCfeb1and2$Sub_metering_2, type= 'l', col = "red")
lines(HPCfeb1and2$DateTime, HPCfeb1and2$Sub_metering_3, type= 'l', col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black","red","blue"), lty=1, bty='n')

# Plot the top right graph (new: plots voltage against datetime)
plot(HPCfeb1and2$DateTime, HPCfeb1and2$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

# Plot the graph with labels on both axes
plot(HPCfeb1and2$DateTime, HPCfeb1and2$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

# Close the graphics device
dev.off()
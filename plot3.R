# This script plots a graph showing the energy submetering on the Y-axis, split into
# three different submeters, each with a different line color,
# and the date/time of usage on the X-axis. 

# Import data from text file in working directory 
HPC <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

# Make a date/time column by combining HPC$Date with HPC$Time
HPC$DateTime <- strptime(paste(HPC$Date,HPC$Time), format="%d/%m/%Y %H:%M:%S")

# Select only data from 2007-02-01 or 2007-02-02
HPCfeb1and2 = subset(HPC, as.Date(HPC$DateTime) == "2007-02-01" 
                     | as.Date(HPC$DateTime) == "2007-02-02")

# Start the png graphics device to write to file
png(filename="plot3.png", height=480, width=480, bg="transparent")

# Make the graph and plot the first submeter in the graph with labels on both axes
plot(HPCfeb1and2$DateTime, HPCfeb1and2$Sub_metering_1, type= 'l', xlab="", ylab="Energy sub metering")
# Plot the second submeter in the graph
lines(HPCfeb1and2$DateTime, HPCfeb1and2$Sub_metering_2, type= 'l', col = "red")
# Plot the third submeter in the graph
lines(HPCfeb1and2$DateTime, HPCfeb1and2$Sub_metering_3, type= 'l', col = "blue")
# Add a legend in the top right corner
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black","red","blue"), lty=1)

# Close the graphics device
dev.off()
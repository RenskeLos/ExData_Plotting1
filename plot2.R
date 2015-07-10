# This script plots a graph showing household global minute-averaged active power 
# (in kilowatt) on the Y-axis, and the date/time of usage on the X-axis. 

# Import data from text file in working directory 
HPC <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

# Make a date/time column by combining HPC$Date with HPC$Time
HPC$DateTime <- strptime(paste(HPC$Date,HPC$Time), format="%d/%m/%Y %H:%M:%S")

# Select only data from 2007-02-01 or 2007-02-02
HPCfeb1and2 = subset(HPC, as.Date(HPC$DateTime) == "2007-02-01" 
                     | as.Date(HPC$DateTime) == "2007-02-02")

# Start the png graphics device to write to file
png(filename="plot2.png", height=480, width=480, bg="transparent")

# Plot the graph with labels on both axes
plot(HPCfeb1and2$DateTime, HPCfeb1and2$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")

# Close the graphics device
dev.off()
# This script plots a histogram showing the number of households (frequency) 
# on the Y-axis, and the household global minute-averaged active power (in kilowatt)
# on the X-axis. 

# Import data from text file in working directory 
HPC <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

# Make a date/time column by combining HPC$Date with HPC$Time
HPC$DateTime <- strptime(paste(HPC$Date,HPC$Time), format="%d/%m/%Y %H:%M:%S")
 
# Select only data from 2007-02-01 or 2007-02-02
HPCfeb1and2 = subset(HPC, as.Date(HPC$DateTime) == "2007-02-01" 
                        | as.Date(HPC$DateTime) == "2007-02-02")

# Make a variable of desired column to simplify hist()
GAP<-as.numeric(HPCfeb1and2$Global_active_power)

# Start the png graphics device to write to file
png(filename="plot1.png", height=480, width=480, bg="transparent")

# Plot the histogram in red, with title and label on X axis
hist(GAP, col='red', main= "Global Active Power", xlab="Global Active Power (kilowatts)")

# Close the graphics device
dev.off()
# Read the data
data <- read.csv("household_power_consumption.txt",sep=";",header=T)

# Convert the date type and subset to the only needed rows
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date>="2007-02-01" & Date<="2007-02-02")

# Create the histogram
data$Global_active_power <- as.numeric(levels(data$Global_active_power))[data$Global_active_power]
hist(data$Global_active_power, col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

#Create png file with the plot
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

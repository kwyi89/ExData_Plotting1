# Read the data
data <- read.csv("household_power_consumption.txt",sep=";",header=T)

# Convert the date type and subset to the only needed rows
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date>="2007-02-01" & Date<="2007-02-02")

# Convert the Global_active_power col and date
data$Global_active_power <- as.numeric(levels(data$Global_active_power))[data$Global_active_power]
data <- transform(data, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

# Convert Sub_metering_# columns' type to numeric
data$Sub_metering_1 <- as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1]
data$Sub_metering_2 <- as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2]
data$Sub_metering_3 <- as.numeric(levels(data$Sub_metering_3))[data$Sub_metering_3]

# Create png file
png(file="plot3.png", height=480, width=480)

# Plot the data with line type with different colors
with(data, plot(data$timestamp, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(data$timestamp, data$Sub_metering_2, col="red")
lines(data$timestamp, data$Sub_metering_3, col="blue")

# Add the legend
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))

# Turn off png
dev.off()

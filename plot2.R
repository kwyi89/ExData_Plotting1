# Read the data
data <- read.csv("household_power_consumption.txt",sep=";",header=T)

# Convert the date type and subset to the only needed rows
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date>="2007-02-01" & Date<="2007-02-02")

# Convert the Global_active_power col and date
data$Global_active_power <- as.numeric(levels(data$Global_active_power))[data$Global_active_power]
data <- transform(data, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

# Plot using line type
plot(data$timestamp,data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Create the png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

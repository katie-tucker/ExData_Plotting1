###Reads Data###
hpc_full <- read.table("./Coursera/household_power_consumption.txt", header = T, 
                       sep = ";", na.strings = "?")
###Converts Date to date format###
hpc_full$Date <- as.Date(as.character(hpc_full$Date), "%d/%m/%Y")

###Subsets using only the dates of 2007-02-01###
hpc <- subset(hpc_full, hpc_full$Date >= "2007-02-01" & 
                  hpc_full$Date <= "2007-02-02",na.rm=TRUE)

###Creates new variable combining date and time###
hpc$DateTime <- strptime(paste(as.character(hpc$Date),as.character(hpc$Time)),
                         "%Y-%m-%d %H:%M:%S")

###Creates png plot###
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

###First Plot (plot2)###
plot(hpc$DateTime, hpc$Global_active_power,type="l", xlab="",
     ylab = "Global Active Power")

###Second Plot###
plot(hpc$DateTime, hpc$Voltage,type="l", xlab="datetime",
     ylab = "Voltage")

###Third Plot (plot3)###
plot(hpc$DateTime, hpc$Sub_metering_1,type="l",xlab = "",
     ylab = "Energy sub metering", 
     col="black")
lines(hpc$DateTime, hpc$Sub_metering_2,type="l", col="red")
lines(hpc$DateTime, hpc$Sub_metering_3,type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty= "n", lty = 1, col = c("black", "red","blue"))

###Fourth Plot###
plot(hpc$DateTime, hpc$Global_reactive_power,type="l", xlab="datetime",
     ylab = "Global_reactive_power")
dev.off()
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
png("plot2", width = 480, height = 480)
plot(hpc$DateTime, hpc$Global_active_power,type="l", ylab = "Global Active Power (kilowatts)")
dev.off()
###Reads Data###
hpc_full <- read.table("./Coursera/household_power_consumption.txt", header = T, 
                       sep = ";", na.strings = "?")
###Converts Date to date format###
hpc_full$Date <- as.Date(as.character(hpc_full$Date), "%d/%m/%Y")

###Subsets using only the dates of 2007-02-01###
hpc <- subset(hpc_full, hpc_full$Date >= "2007-02-01" & 
                  hpc_full$Date <= "2007-02-02",na.rm=TRUE)
###Creates png plot###
png("plot1", width = 480, height = 480)
hist(as.numeric(hpc$Global_active_power), col = "red", 
     xlab = "Global Active Power (kilowatts)",ylab = "Frequency", 
     main = "Global Active Power")
dev.off()

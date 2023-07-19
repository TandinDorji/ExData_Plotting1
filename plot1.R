epc <- read.table("./Dataset/household_power_consumption.txt", 
                  sep = ";", na.strings = "?",
                  skip = 66637, nrows = 2880)

head(epc)
tail(epc)

names(epc) <- names(read.table("./Dataset/household_power_consumption.txt", 
                               header = TRUE, sep = ";", nrows = 1))
    
names(epc)

# convert date and time
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")
epc$Time <- strptime((paste(epc$Date, epc$Time)), format = "%Y-%m-%d %H:%M:%S")
# epc$Time <- strptime(epc$Time, format = "%T")
str(epc)

png("plot1.png", width = 480, height = 480, units = "px")
par(mar=c(5.1, 5.1, 4.1, 2.1))
with(epc, hist(x=Global_active_power, col = "red", 
               main="Global Active Power",
               xlab = "Global Active Power (kilowatts)",
               ylab = "Frequency"))
dev.off()


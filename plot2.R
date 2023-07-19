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
str(epc)

png("plot2.png", width = 480, height = 480, units = "px")
par(mar=c(5.1, 5.1, 4.1, 2.1))
with(epc, plot(x=Time, y=Global_active_power, type="l",
               xaxt = "n",
               ylab = "Global Active Power (kilowatts)",
               xlab = ""))
axis(1, at = pretty(epc$Time, n = 2), labels = c("Thu", "Fri", "Sat"))
dev.off()


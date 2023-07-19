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

png("plot3.png", width = 480, height = 480, units = "px")
par(mar=c(5.1, 5.1, 4.1, 2.1))
with(epc, plot(Time, Global_active_power, type="n",
               xaxt = "n",
               ylab = "Energy sub metering",
               ylim = c(1,40),
               xlab = ""))
with(epc, lines(Time, Sub_metering_1, type="l", col = "black"))
with(epc, lines(Time, Sub_metering_2, type="l", col = "red"))
with(epc, lines(Time, Sub_metering_3, type="l", col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
axis(1, at = pretty(epc$Time, n = 2), labels = c("Thu", "Fri", "Sat"))
dev.off()


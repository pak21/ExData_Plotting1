library(data.table)
library(dplyr)

data <- fread("household_power_consumption.txt", na.strings = c("?")) %>%
  filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
  mutate(when = as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")))

png(filename="plot4.png")
par(mfrow = c(2, 2))

plot(data$when, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(data$when, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(data$when, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$when, data$Sub_metering_2, type = "l", col = "red")
lines(data$when, data$Sub_metering_3, type = "l", col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1, 1, 1),
       col = c("black", "red", "blue"),
       bty = "n")

plot(data$when, data$Global_reactive_power,
     type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

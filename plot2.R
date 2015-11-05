library(data.table)
library(dplyr)

data <- fread("household_power_consumption.txt", na.strings = c("?")) %>%
  filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
  mutate(when = as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")))

png(filename="plot2.png")
plot(data$when, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

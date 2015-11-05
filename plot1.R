library(data.table)
library(dplyr)

data <- fread("household_power_consumption.txt", na.strings = c("?")) %>%
  filter(Date == "1/2/2007" | Date == "2/2/2007")

png(filename="plot1.png")
hist(data$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "red")
dev.off()

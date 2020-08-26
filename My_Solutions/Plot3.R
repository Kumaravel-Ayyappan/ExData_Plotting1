## Creating Plot3

library(dplyr)

# Getting data
raw <- read.table("power.txt", header = TRUE, sep = ";", na.strings ="?")

# Changing type for date column
raw$Date <- as.Date(raw$Date, format = "%d/%m/%Y")

# Subset required data
reqdata <- subset(raw, Date == "2007-02-01" | Date == "2007-02-02")

# Merging Date and Time
reqdata <- mutate(reqdata, DT = as.POSIXct(paste(reqdata$Date, reqdata$Time),
                                           format = "%Y-%m-%d %H:%M:%S"))
# Plotting
X11(width = 6.7, height = 6.7)
with(reqdata, plot(DT, Sub_metering_1, type = "l", xlab ="", ylab = "Energy Sub Metering"))
with(reqdata, lines(DT, Sub_metering_2, col = "red"))
with(reqdata, lines(DT, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1, 1, 1), col = c("black", "red", "blue"))
dev.copy(png, "plot3.png")
dev.off()
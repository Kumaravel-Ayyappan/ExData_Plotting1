## Creating Plot2

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
X11(width = 6.7, height = 6.7) # Converted 480 pixels to inches (6.7)
with(reqdata, plot(DT, Global_active_power, type = "l", xlab = "",
                   ylab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot2.png")
dev.off()


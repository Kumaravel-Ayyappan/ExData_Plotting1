## Creating Plot1

# Getting data
raw <- read.table("power.txt", header = TRUE, sep = ";", na.strings ="?")

# Changing type for date column
raw$Date <- as.Date(raw$Date, format = "%d/%m/%Y")

# subsetting required data
reqdata <- subset(raw, Date == "2007-02-01" | Date == "2007-02-02")

## Plot 1
X11(width = 6.7, height = 6.7) # Converted 480 pixels to inches (6.7)
hist(reqdata$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)", ylab = "frequency",
     main =  "Global Active Power",
     bg = "white")
dev.copy(png, "plot1.png")
dev.off()

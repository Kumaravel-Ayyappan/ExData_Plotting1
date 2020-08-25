## This program is the solution for the week 1 assignment

# Getting data
raw <- read.table("power.txt", header = TRUE, sep = ";", na.strings ="?")

# Changing type for date column
raw$Date <- as.Date(raw$Date, format = "%d/%m/%Y")

# subsetting required data
reqdata <- subset(raw, Date == "2007-02-01" | Date == "2007-02-02")

## Plot 1
hist(reqdata$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)", ylab = "frequency",
     main =  "Global Active Power")

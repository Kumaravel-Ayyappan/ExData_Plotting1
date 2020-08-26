## Creating Plot3

library(dplyr)

# Getting data
raw <- read.table("power.txt", header = TRUE, sep = ";", na.strings ="?")

# Changing type for date column
raw$Date <- as.Date(raw$Date, format = "%d/%m/%Y")

# Subset required data
reqdata <- subset(raw, Date == "2007-02-01" | Date == "2007-02-02")
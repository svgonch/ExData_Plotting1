download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "Assignment1.zip", mode = "wb")
unzip("Assignment1.zip")
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE, comment.char = "")
## Converting dates and time
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
## Subsetting
sub <- subset(dat, Date >= "2007-02-01" & Date <= "2007-02-02")
## Merging dates and time in separate column
date_time <- paste(sub$Date, sub$Time)
sub <- data.frame(sub, date_time)
sub$date_time <- strptime(sub$date_time, format = "%F %T")
sub$date_time <- as.POSIXct(sub$date_time)
rm(date_time)
## Plot 1
hist(sub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()
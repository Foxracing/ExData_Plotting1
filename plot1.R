fname <- "household_power_consumption.txt"
data <- read.csv(fname, sep = ";", header = TRUE, 
                 na.strings = "?", nrows = 2 * 24 * 60, 
                 skip = 47 * 60 * 24 -17 * 60 - 24)
data2 <- read.csv(fname, sep = ";", header = TRUE, nrows = 1)
names(data) <- names(data2)
cols <- c('Date', 'Time')
#dateTimes <- apply(data[,cols], 1, paste, collapse = "/" )
#dataTimes2 <- strptime(dateTimes, format="%d/%m/%Y/%H:%M:%S", tz = "")
#dataTimes3 <- as.Date(dataTimes2)
with(data, hist(Global_active_power, col = "red", 
                main = "Global Active Power", 
                xlab = "Global Active Power (kilowatts)"))

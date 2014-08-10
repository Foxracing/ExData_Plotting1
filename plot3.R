fname <- "household_power_consumption.txt"
data <- read.csv(fname, sep = ";", header = TRUE, 
                 na.strings = "?", nrows = 2 * 24 * 60, 
                 skip = 47 * 60 * 24 -17 * 60 - 24)
data2 <- read.csv(fname, sep = ";", header = TRUE, nrows = 1)
names(data) <- names(data2)
cols <- c('Date', 'Time')
dateTimes <- apply(data[,cols], 1, paste, collapse = "/" )
dataTimes2 <- strptime(dateTimes, format="%d/%m/%Y/%H:%M:%S", tz = "")
data$dateAndTime <- dataTimes2
plot(data$dateAndTime, data$Sub_metering_1, type = "l",
     ylab = "Energy sub metering", xlab = "", col = "black")
lines(data$dateAndTime, data$Sub_metering_2, col = "red")
lines(data$dateAndTime, data$Sub_metering_3, col = "blue")
legend('topright', legend = names(data)[7:9],
       lty = 1, col = c("black", "red", "blue"))
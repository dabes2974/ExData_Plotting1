

# set wd
 setwd("I:/Tmp/R/ExData_Plotting1")
getwd()

# cal  library

require(dplyr); require(lubridate); library(ggplot2)

# load data (no problem with R 3.1.2 *64 and 16 G of RAM)
X <- as.tbl(read.table("./data/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, header  = TRUE, na.strings = "?"))

####### filter data from 2007-02-01 and 2007-02-02 with lubridate

X <- X %>% 	mutate(Date = dmy(Date)) %>%
			filter(Date%in%ymd("2007-02-01","2007-02-02")) %>%
			mutate(Time = ymd_hms(paste(Date, Time, sep="-")))
			
			
# explore data
dim(X)
glimpse(X)

####### save in R format to recall it quickly
# saveRDS(X,file = "data/household_power_consumption.rds")
# X <-  readRDS("data/household_power_consumption.rds")



png("png/plot4.png", width = 480, height = 480, units = "px", bg = "transparent")

par(mfrow = c(2, 2))
ylimit <- range(c(X$Sub_metering_1, X$Sub_metering_2, X$Sub_metering_3))

with(X, {


# plot 1
plot(Time, Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")

# plot 2
plot(Time, Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

# plot 3
plot(Time, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", ylim = ylimit, col = "black")
par(new = TRUE)
plot(Time, Sub_metering_2, xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimit, col = "red")
par(new = TRUE)
plot(Time, Sub_metering_3, xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimit, col = "blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bg = "transparent", bty = "n", lty = c(1,1,1), col = c("black", "red", "blue"))

# plot 4
plot(Time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


})


dev.off()








# set wd
 setwd("I:/Tmp/R/ExData_Plotting1")
getwd()

# cal  library

require(dplyr); require(lubridate); library(ggplot2)

X <- as.tbl(read.table("./data/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, header  = TRUE, na.strings = "?"))
####### filter data from 2007-02-01 and 2007-02-02 with lubridate

X <- X %>% filter(dmy(Date)%in%ymd("2007-02-01","2007-02-02"))

# explore data
dim(X)
glimpse(X)

####### save in R format to recall it quickly
# saveRDS(X,file = "data/household_power_consumption.rds")
# X <-  readRDS("data/household_power_consumption.rds")


# create plot 1 hist()
png( file = "png/plot1.png", width =800, height = 800, units = "px")




require(ggplot2)




png( file = "png/plot1.png", width =480, height = 480, units = "px")
with(X,hist(Global_active_power, col ="red", main = "Global Active Power", xlab ="Global Active Power (kilowatts)"))


dev.copy(png, file = "png/plot1.png")


dev.off()


dev.set(dev.prev())



# save plot 1

dev.copy(png, file = "png/plot1.png")



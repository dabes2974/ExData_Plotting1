
# set wd
 setwd("I:/Tmp/R/ExData_Plotting1")
getwd()

# call  library

require(dplyr); require(lubridate); library(ggplot2)

# load data (no problem with R 3.1.2 *64 and 16 G of RAM)
X <- as.tbl(read.table("./data/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, header  = TRUE, na.strings = "?"))
####### filter data from 2007-02-01 and 2007-02-02 with lubridate

X <- X %>% 	mutate(Date = dmy(Date)) %>%
			filter(Date%in%ymd("2007-02-01","2007-02-02")) %>%
			mutate(Time = ymd_hms(paste(Date, Time, sep="-")))
			

####### save in R format to recall it quickly
# saveRDS(X,file = "data/household_power_consumption.rds")
# X <-  readRDS("data/household_power_consumption.rds")



# define scale in pixels
png( file = "plot1.png", width =480, height = 480, units = "px", bg = "transparent")

# plot
with(X,hist(Global_active_power, col ="red", main = "Global Active Power", xlab ="Global Active Power (kilowatts)"))

# save file

# close device
dev.off()









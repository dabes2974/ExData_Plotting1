

# set wd
# setwd("I:/Tmp/R/ExData_Plotting1")
getwd()

# cal  library

require(dplyr); require(lubridate)

X <- as.tbl(read.table("./data/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, header  = TRUE, na.strings = "?"))

# explore data
dim(X)
glimpse(X)

####### save in R format 
# saveRDS(X,file = "data/household_power_consumption.rds")
# X <-  readRDS("data/household_power_consumption.rds")

####### filter data from 2007-02-01 and 2007-02-02

X <- X %>% filter(dmy(Date)%in%ymd("2007-02-01","2007-02-02"))

 glimpse(X)
 
 
with(X, hist(Global_active_power, col ="red", main = "Global Active Power", xlab ="Global Active Power (kilowatts)"))

dev.copy(png, file = "plot1.png"
)
## Copy my plot to a PNG file
dev.off() 
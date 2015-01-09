plot1 <- function() {
    ## Read in the data from 2/1/2007 to 2/2/2007
    ## Create a histogram in red of the Global active power for the given period
    
    ## Determine how many rows to read in from the input file
    totMins <- difftime(as.POSIXct("2007-02-03"), as.POSIXct("2007-02-01"), units="mins")
    numOfRows <- as.numeric(totMins)
    
    ## skip the input data prior to the 2/1/2007.  in the input, unknown data is set to "?".  convert it to NA.
    data <- read.csv("data/household_power_consumption.txt", skip = 66636, na.strings = c("?", ""), sep = ";", nrows = numOfRows)
    
    ## add in the variable names
    names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    
    
    ## Create a histogram of the Global active power and store it into plot1.png
    ## The default for png is the height and width of 480 pixels
    png(file = "plot1.png", bg = "transparent")
    
    with(data, hist(Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (killowatts)"))

    dev.off()

}
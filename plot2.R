plot2 <- function() {
    ## Read in the data from 2/1/2007 to 2/2/2007
    ## Create a history gram in red of the Global active power for the given period
    
    ## Determine how many rows to read in from the input file
    totMins <- difftime(as.POSIXct("2007-02-03"), as.POSIXct("2007-02-01"), units="mins")
    numOfRows <- as.numeric(totMins)
    
    ## skip the input data prior to the 2/1/2007.  in the input, unknown data is set to "?".  convert it to NA.
    data <- read.csv("data/household_power_consumption.txt", skip = 66636, na.strings = c("?", ""), sep = ";", nrows = numOfRows)
    
    ## add in the variable names
    names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    
    
    ## Combine the Date and Time column and create a new column
    data$dateTime <- as.POSIXct(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")
    
    ## Create a line plot of the Global active power and store it into plot2.png
    ## The default for png is the height and width of 480 pixels
    png(file = "plot2.png", bg = "transparent")
    
   
    with(data, plot(dateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
    dev.off()
    
}
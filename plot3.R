plot3 <- function() {
    
    ## Read in the data from 2/1/2007 to 2/2/2007
    ## Create a line plot for three sub meters measured for the given period
    
    ## Determine how many rows to read in from the input file
    totMins <- difftime(as.POSIXct("2007-02-03"), as.POSIXct("2007-02-01"), units="mins")
    numOfRows <- as.numeric(totMins)
    
    ## skip the input data prior to the 2/1/2007.  in the input, unknown data is set to "?".  convert it to NA.
    data <- read.csv("data/household_power_consumption.txt", skip = 66636, na.strings = c("?", ""), sep = ";", nrows = numOfRows)
    
    ## add in the variable names
    names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    
    
    ## Combine the Date and Time column and create a new column
    data$dateTime <- as.POSIXct(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")
    
    ## Create a plot of the three sub metering and store it in plot3.png
    ## The default for png is the height and width of 480 pixels
    png(file = "plot3.png", bg = "transparent")
    
    with(data, plot(dateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
    with(data, lines(dateTime, Sub_metering_2, col = "red"))
    with(data, lines(dateTime, Sub_metering_3, col = "blue"))
  

    ## add the legend in the top right hand corner
    legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    dev.off()
}
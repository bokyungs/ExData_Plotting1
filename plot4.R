plot4 <- function() {
    
    ## Read in the data from 2/1/2007 to 2/2/2007
    ## Create 4 plots (2 rows and 2 columns)
    
    ## Determine how many rows to read in from the input file
    totMins <- difftime(as.POSIXct("2007-02-03"), as.POSIXct("2007-02-01"), units="mins")
    numOfRows <- as.numeric(totMins)
    
    ## skip the input data prior to the 2/1/2007.  in the input, unknown data is set to "?".  convert it to NA.
    data <- read.csv("data/household_power_consumption.txt", skip = 66636, na.strings = c("?", ""), sep = ";", nrows = numOfRows)
    
    ## add in the variable names
    names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    
    
    ## Combine the Date and Time column and create a new column
    data$dateTime <- as.POSIXct(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")
    
    
    ## Create 4 plots
    ## The default for png is the height and width of 480 pixels
    
    png(file = "plot4.png", bg = "transparent")
    par(mfrow=c(2,2))  # create 2 X 2 plots (2 per row and 2 columns, draw each row first)
   
    
    
    # plot #1 of global active power
    with(data, plot(dateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))
    
    # plot #2 of the Voltage
    with(data, plot(dateTime, Voltage, type = "l", xlab = "datetime", ylab="Voltage"))
    
    ## Plot #3 - line plots of 3 Global sub meters with a legend
    with(data, plot(dateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
    with(data, lines(dateTime, Sub_metering_2, col = "red"))
    with(data, lines(dateTime, Sub_metering_3, col = "blue"))
  
    ## add the legend in the top right hand corner of plot #3
    ## bty set to "n" removes the box around the legend
    ## cex set to 0.9 reduces the size of the legend
    legend("topright", lty=1, col = c("black", "red", "blue"), bty = "n", cex = 0.9, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

    # plot #4 of the global reactive power
    with(data, plot(dateTime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))
    
    dev.off()
}
## Input file

This assignment uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. In particular, we will be using the "Individual household
electric power consumption Data Set".  It was available from


* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]



## Loading the data


* The dataset has 2,075,259 rows and 9 columns. I read in the data from 2/1/2007 and 2/2/2007.

* I opened the input file in NotePad and determined the line number where the 2/1/2007 data started.

* I skipped all the data prior to 2/1/2007.

* Since the measurement was taken every 1 min., I computed the number of lines to read in by computing how many   
minutes were in the two days.

## Making Plots

I forked the instructor's GitHub repository (https://github.com/rdpeng/ExData_Plotting1](https://github.com/rdpeng/ExData_Plotting1) 
and cloned it on my Desktop.

In additon to this READE.md file, there are 8 files in my repository:  
4 R scripts: plot1.R, plot2.R, plot3.R, and plot4.R    
4 png files: plot1.png, plot2.png, plot3.png, plot4.png 

The png files are the output generagted by each corresponding R script.   

I used the png function which has the default height and width of 480 pixels.  



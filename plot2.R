#Title - Plot2.R
#Input- Data file titled "household_power_consumption.txt" that has details on consumption for one household 
#Output is a plot written to PNG file 
# References
# https://guides.github.com/activities/forking/
#   fork and clone in R studio
# http://www.sthda.com/english/wiki/reading-data-from-txt-csv-files-r-base-functions
# https://stackoverflow.com/questions/24006475/subsetting-data-based-on-a-date-range-in-r

#Libraries
library( dplyr)
library(data.table)
library(tibble)
library(stringr)
library(ggplot2)
library(lattice)

rm(list=ls())
#Read a specific data set into a data table in R 
setwd( "C:\\Users\\RamamurthyV\\Documents\\R\\4.Exploratory Data Analysis\\Week 1\\project1\\ExData_Plotting1")

e_data_tbl <- fread("household_power_consumption.txt", na.strings = "?")


e_data_tbl[,DateTime := as.Date(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

#Just take the data for feb 1 to feb 2
my_data <- filter(e_data_tbl, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime <= as.Date("2007-02-02 23:59:00"))

my_data$Date <- as.Date(my_data$Date, format = "%d/%m/%Y")
my_data$DateTime <- as.POSIXct(paste(my_data$Date, my_data$Time))

# Added below to check how my table is when building the program
# nrow(my_data) #2880 rows
# ncol(my_data) #10 columns 
# view(my_data)
# class(my_data$DateTime)
# class(my_data$Time)
# str(my_data)

#Plot 2 
# plot(my_data$DateTime, my_data$Global_active_power,type="line", xlab="",ylab="Global Active Power (kilowatts)")

 
 plot(my_data$DateTime, my_data$Global_active_power, 
      type="line", 
      xlab="", 
      ylab="Global Active Power (kilowatts)"
      )
 
 #Write this to png file
## Copy my plot to a PNG file
dev.copy(png, file = "Plot2.png")

## Don't forget to close the PNG device!
dev.off()

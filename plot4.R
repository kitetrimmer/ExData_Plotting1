## plot3.R

## Dependencies: reshape2
## Arguments: workdir = directory where the data to be plotted lives


## Generate the first plot for the assignment in week 1 of Exploratory Data Analysis
## Coursera course.

## For each plot you should: 

## Construct the plot and save it to a PNG file with a width of 480 pixels and a
## height of 480 pixels.
## Name each of the plot files as plot1.png, plot2.png, etc.
## Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the 
## corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. 
## Your code file should include code for reading the data so that the plot can 
## be fully reproduced. You must also include the code that creates the PNG file.

## We will only be using data from the dates 2007-02-01 and 2007-02-02.

plot4<-function(workdir){
        
        library (reshape2)
        
        ## Read in the data
        outputfile = "plot4.png"
        oldwd=getwd()
        setwd(workdir)
        print("Reading in data...")
        mydata<-read.delim("household_power_consumption.txt",sep=";",na.strings = "?")
        
        print("Done.")
        
        ## Convert the dates to date class
        mydata$Date<-as.Date(mydata$Date,"%d/%m/%Y")
        
        ## Subset the data
        print("Subsetting...")
        ssdata<- subset(mydata,(Date >= as.Date("2007-02-01") & Date<=as.Date("2007-02-02")))
        
        ## Create a DateTime column
        print("Creating DateTime column")
        ssdata$DateTime<-paste(ssdata$Date,ssdata$Time)
        ssdata$DateTime2<-as.POSIXct(ssdata$DateTime)
        
        ## Set up the plot area
        
        print(paste0("Generating plot at ",mydir,"/",outputfile))
        png(filename=outputfile,width = 480, height = 480)
        par(mfrow=c(2,2))
        
        ## Upper left plot
        with(ssdata,plot(DateTime2,Global_active_power,
                           type = "l",
                           xlab = "", 
                           ylab = "Global Active Power (kilowatts"))
        
        ## Upper right plot
        with(ssdata,plot(DateTime2,Voltage,
                         type = "l",
                         col = "black",
                         xlab = "datetime",
                         ylab = "Voltage"))
        
        ## Lower left plot
        with(ssdata,plot(DateTime2,Sub_metering_1,
                           type = "n",
                           xlab = "", 
                           ylab = "Energy sub Metering"))
        with(ssdata,lines(DateTime2,Sub_metering_1,
                            type = "l",
                            col="black"))
        with(ssdata,lines(DateTime2,Sub_metering_2,
                            type = "l",
                            col="red"))
        with(ssdata,lines(DateTime2,Sub_metering_3,
                            type = "l",
                            col="blue"))
        legend("topright",
               legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
               col=c("black","red","blue"),
               lty = 1,
               bty = "n",
               cex = .75)
        
        ## Lower right plot
        with(ssdata,plot(DateTime2,Global_reactive_power,
                         type = "l",
                         col = "black",
                         xlab = "datetime",
                         ylab = "Global_reactive_power"))
        dev.off()
        setwd(oldwd) 
        print ("Done.")
        
}
## plot1.R
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

plot1<-function(workdir){
        
        ## Read in the data
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
        
        
        ## Generate the plot
        print(paste0("Generating plot at ",mydir,"/plot1.png"))
        png(filename="plot1.png",width = 480, height = 480)
        
        with(ssdata,hist(Global_active_power,
                         col="red",
                         main = "Global Active Power",
                         xlab="Global Active Power (kilowatts)"))
        
        dev.off()
        setwd(oldwd) 
        print ("Done.")
}
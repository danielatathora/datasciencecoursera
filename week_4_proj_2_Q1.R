## Coursera Week 4; Project 2; Question 1:

# Question 1
#   Have the total emissions from PM2.5 decreased in the United States from 1999 to 2008?

savePlot = TRUE
dataFileName <- "summarySCC_PM25.rds"
plotFileName <- "Plot1.png"

if ( !file.exists(dataFileName) ) {
   print(paste(dataFileName, "not found - check you are in the correct directory."))
   print(paste("current folder is =", getwd()))
} else {
   print(paste(dataFileName, "is available - Loading Data ..."))

   NEI <- readRDS("summarySCC_PM25.rds")
   print("Done - Generate bar plot")
   
   barplot( c(sum(subset(NEI, year == 1999)$Emissions/1000)
            , sum(subset(NEI, year == 2002)$Emissions/1000)
            , sum(subset(NEI, year == 2005)$Emissions/1000)
            , sum(subset(NEI, year == 2008)$Emissions/1000))
            , col= "maroon"
            , main = "PM2.5 Emissions by Year"
            , xlab = "Year"
            , ylab="PM2.5 emissions in (kilotons)"
            , ylim= c(0, 8000)
            , names.arg = c("1999", "2002", "2005", "2008"))
   print("Done")
   
   # Answer:
   #  Yes, the total emissions from PM2.5 decreased in the United States from 1999 to 2008.

   # Save Plot
   if( savePlot) {
      dev.copy(png, file=plotFileName) ## Copy the plot to a PNG file
      dev.off() ## Close PNG device
      print(paste(plotFileName, " saved"))
   }
}

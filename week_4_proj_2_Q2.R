## Coursera Week 4; Project 2; Question 2:

# Question 2
#   Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?

savePlot = TRUE
dataFileName <- "summarySCC_PM25.rds"
plotFileName <- "Plot2.png"

if ( !file.exists(dataFileName) ) {
   print(paste(dataFileName, "not found - check you are in the correct directory."))
   print(paste("current folder is =", getwd()))
} else {
   print(paste(dataFileName, "is available - Loading Data ..."))
   
   NEI <- readRDS("summarySCC_PM25.rds")
   print("Done - Generate bar plot")

   NEI_Balt = subset(NEI, fips == "24510")
   rm(NEI) # we no longed need the full data

   # reset display
   par(mfrow = c(1,1))

bp <- barplot( c(sum(subset(NEI_Balt, year == 1999)$Emissions)
            , sum(subset(NEI_Balt, year == 2002)$Emissions)
            , sum(subset(NEI_Balt, year == 2005)$Emissions)
            , sum(subset(NEI_Balt, year == 2008)$Emissions))
         , col= "royalblue2"
         , main = "PM2.5 Emissions in Baltimore by Year"
         , xlab = "Year"
         , ylab="PM2.5 emissions (in tons)"
         , ylim = c(0,3500)
         , names.arg = c("1999", "2002", "2005", "2008"))
   
   print("Done")
   
   # Answer:
   #   Yes, the total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008.
   #   however, although 2008 has less emissions than previous years, 2005 had a higher level than 2002

   if( savePlot) {
      dev.copy(png, file=plotFileName) ## Copy the plot to a PNG file
      dev.off() ## Close PNG device
      print(paste(plotFileName, "saved"))
   }
}

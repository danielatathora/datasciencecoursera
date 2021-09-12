## Coursera Week 4; Project 2; Question 5:

# Question 5
#  How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

savePlot = TRUE
dateFileSummarySCC <- "summarySCC_PM25.rds"
dateFileSCCInfo <- "Source_Classification_Code.rds"
plotFileName <- "Plot5.png"

# check directory
# getwd()

if ( !(file.exists(dateFileSummarySCC ) & file.exists(dateFileSCCInfo)) ) {
  print(paste(dateFileSummarySCC , "not found - check what directory your in."))
  print(paste("Current folder:", getwd()))
} else {
  print(paste(dateFileSummarySCC, "and", dateFileSCCInfo, "are available - Loading from Data Files ..."))

  NEI <- readRDS(dateFileSummarySCC)
  SCC <- readRDS(dateFileSCCInfo)

  # Get classification codes for on-road  
  motorSCCs = subset(SCC, tolower(Data.Category) == "onroad")$SCC

  NEI_Motor_Balt = subset( NEI, fips == "24510" & SCC %in% motorSCCs )

  library(stringr)

  rm(NEI) # no longer need NEI

  # Question 5: (see above)

  print("Plot chart")
  
  par(mfrow= c( 1, 1))
  barplot( c(sum(subset(NEI_Motor_Balt, year == 1999)$Emissions)
            , sum(subset(NEI_Motor_Balt, year == 2002)$Emissions)
            , sum(subset(NEI_Motor_Balt, year == 2005)$Emissions)
            , sum(subset(NEI_Motor_Balt, year == 2008)$Emissions))
            , col= "#CC79A7"
            , main = "PM2.5 Motor based Emissions in Baltimore City by Year"
            , xlab = "Year"
            , ylab="PM2.5 emissions in (tons)"
            , ylim= c(0, 400)
            , names.arg = c("1999", "2002", "2005", "2008"))
  print("Done")

 # Answer:
 # Emissions from motor vehicle sources decreased from 1999–2008 in Baltimore City
 #         A very significant decrease between 1999 and 2002,
 #         A small decrease between 2002 and 2005
 #         and a significant decrease between 2005 and 2008
 #         overall decrease from 347 tons in 1999 to 88 tons in 2008

  # Plot Image
   if( savePlot) {
     dev.copy(png, file=plotFileName) ## Copy the plot to a PNG file
     dev.off() ## Close PNG device
     print(paste(plotFileName, "saved"))
   }
}

 

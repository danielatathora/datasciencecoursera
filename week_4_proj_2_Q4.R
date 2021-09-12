## Coursera Week 4; Project 2; Question 4:

# Question 4
# Across the United States, how have emissions from coal combustion-related sources changed from 1999 and 2008?

savePlot = TRUE
dateFileSummarySCC <- "summarySCC_PM25.rds"
dateFileSCCInfo <- "Source_Classification_Code.rds"
plotFileName <- "Plot4.png"

# check directory
# getwd()

if ( !(file.exists(dateFileSummarySCC ) & file.exists(dateFileSCCInfo) ) ) {
  print(paste(dateFileSummarySCC, "and/or", dateFileSummarySCC, "not found - check what directory your in."))
  print(paste("Current folder:", getwd()))
} else {
  print(paste(dateFileSummarySCC, "and", dateFileSCCInfo, "are available - Loading from Data Files ..."))

  NEI <- readRDS(dateFileSummarySCC)
  SCC <- readRDS(dateFileSCCInfo)

  library(stringr)

  # probably not the most efficient , look in columns Short.Name, EI.Sector, SCC.Level.One/Two.Threee/Four for string 'coal', 'lignite' (brown coal) or 'anthracite'  
  coalSCCs <- subset(SCC, 
                          str_detect(Short.Name, coll("coal", TRUE))      | str_detect(Short.Name, coll("lignite", TRUE))      | str_detect(Short.Name, coll("anthracite", TRUE))      | 
                          str_detect(EI.Sector, coll("coal", TRUE))       | str_detect(EI.Sector, coll("lignite", TRUE))       | str_detect(EI.Sector, coll("anthracite", TRUE))       |
                          str_detect(SCC.Level.One, coll("coal", TRUE))   | str_detect(SCC.Level.One, coll("lignite", TRUE))   | str_detect(SCC.Level.One, coll("anthracite", TRUE))   |
                          str_detect(SCC.Level.Two, coll("coal", TRUE))   | str_detect(SCC.Level.Two, coll("lignite", TRUE))   | str_detect(SCC.Level.Two, coll("anthracite", TRUE))   |
                          str_detect(SCC.Level.Three, coll("coal", TRUE)) | str_detect(SCC.Level.Three, coll("lignite", TRUE)) | str_detect(SCC.Level.Three, coll("anthracite", TRUE)) |
                          str_detect(SCC.Level.Four, coll("coal", TRUE))  | str_detect(SCC.Level.Four, coll("lignite", TRUE))  | str_detect(SCC.Level.Four, coll("anthracite", TRUE)))$SCC

# length(coalSCCs)
# 253
  
NEI_COAL <- subset(NEI, SCC %in% coalSCCs)
rm(NEI) # no longer need NEI

par(mfrow= c( 1, 1))
barplot( c(sum(subset(NEI_COAL, year == 1999)$Emissions/1000)
            , sum(subset(NEI_COAL, year == 2002)$Emissions/1000)
            , sum(subset(NEI_COAL, year == 2005)$Emissions/1000)
            , sum(subset(NEI_COAL, year == 2008)$Emissions/1000))
            , col= "#D55E00"
            , main = "PM2.5 Coal based Emissions by Year"
            , xlab = "Year"
            , ylab="PM2.5 emissions in (kilotons)"
            , ylim= c(0, 800)
            , names.arg = c("1999", "2002", "2005", "2008"))

   print("Done")

 # Question 4:
 #  Across the United States, emissions from coal combustion-related sources have descreased from 1999 to 2008

  # Plot Image
   if( savePlot) {
     dev.copy(png, file=plotFileName) ## Copy the plot to a PNG file
     dev.off() ## Close PNG device
     print(paste(plotFileName, "saved"))
   }
}

 

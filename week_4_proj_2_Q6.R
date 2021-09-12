## Coursera Week 4; Project 2; Question 6:

# Question 6
#  Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037").
#  Which city has seen greater changes over time in motor vehicle emissions?

savePlot = TRUE
dateFileSummarySCC <- "summarySCC_PM25.rds"
dateFileSCCInfo <- "Source_Classification_Code.rds"
plotFileName <- "Plot6.png"

# check directory
# getwd()

if ( !(file.exists(dateFileSummarySCC ) & file.exists(dateFileSCCInfo)) ) {
  print(paste(dateFileSummarySCC, "and/or", dateFileSCCInfo,"not found - check what directory your in."))
  print(paste("Current folder:", getwd()))
} else {
  print(paste(dateFileSummarySCC, "and", dateFileSCCInfo, "are available - Loading from Data Files ..."))

  NEI <- readRDS(dateFileSummarySCC)
  SCC <- readRDS(dateFileSCCInfo)

  motorSCCs = subset(SCC, tolower(Data.Category) == "onroad")$SCC
  rm(SCC) # we no longer need SCC

  NEI_Moter_Balt = subset( NEI, fips == "24510" & SCC %in% motorSCCs )
  NEI_Moter_LosA = subset( NEI, fips == "06037" & SCC %in% motorSCCs )
  rm(NEI) # we no longer need NEI
  
  library(stringr)

  # Create a dataframe 
  df1BaltLosA <- data.frame(location=rep(c("Baltimore", "Los Angeles"), each=4),
                     year=rep(c("1999", "2002", "2005", "2008"), 2),
                     emissions=c(
                        sum(NEI_Moter_Balt[NEI_Moter_Balt$year == 1999,]$Emissions) 
                       ,sum(NEI_Moter_Balt[NEI_Moter_Balt$year == 2002,]$Emissions) 
                       ,sum(NEI_Moter_Balt[NEI_Moter_Balt$year == 2005,]$Emissions) 
                       ,sum(NEI_Moter_Balt[NEI_Moter_Balt$year == 2008,]$Emissions) 

                       ,sum(NEI_Moter_LosA[NEI_Moter_LosA$year == 1999,]$Emissions) 
                       ,sum(NEI_Moter_LosA[NEI_Moter_LosA$year == 2002,]$Emissions) 
                       ,sum(NEI_Moter_LosA[NEI_Moter_LosA$year == 2005,]$Emissions) 
                       ,sum(NEI_Moter_LosA[NEI_Moter_LosA$year == 2008,]$Emissions) 
                     ))

   library(ggplot2) # make sure ggplot2 is available
   print("Generate the plot") 

   # Use custom colour palette
   mycbp <- c("#CC79A7", "#0072B2")

   par(mfrow= c( 1, 1))
   # create a side by side bar chart with custom colors
   pq6 <- ggplot(data = df1BaltLosA, mapping = aes(x=year, y=emissions, fill=location)) +
     geom_bar(stat="identity", position = "dodge") +
     scale_fill_manual(values=mycbp)

  # add the emission value to the tops of the bars
   pq6 <- pq6 + geom_text(
     label=format(round(as.numeric(df1BaltLosA[,'emissions']), digits = 0), nsmall=0, big.mark=","), 
     nudge_x = c(rep(-0.25, 4), rep(0.25,4)), nudge_y = 54, size = 2.7, 
     check_overlap = T
   )
   
   # Add labels, Title and sub-title
   pq6 <- pq6 + xlab("Year") +
     ylab("Emissions (tons)") +
     labs(title = "Motor Emissions in Baltimore City and Los Angeles",
          subtitle = "(By Location and Year)")
   # draw the plot
   print(pq6)

# Answer:
   # Comparing emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California
   # while Los Angeles emissions decreased by 500 tons between 2005 and 2008, overall Los Angeles has seen an increase in emissions between 1999 and 2008.
   # on the other hand, Baltimore has decreased for each period and overall periods, seen a substantial decrease,
   
  # Plot Image
   if( savePlot) {
     dev.copy(png, file=plotFileName) ## Copy the plot to a PNG file
     dev.off() ## Close PNG device
     print(paste(plotFileName, "saved"))
   }
}

 

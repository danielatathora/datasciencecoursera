## Coursera Week 4; Project 2; Question 3:

# Question 3:
#  Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
#    Which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?
#    Which have seen increases in emissions from 1999–2008? 

savePlot = TRUE
dataFileName <- "summarySCC_PM25.rds"
plotFileName <- "Plot3.png"

if ( !file.exists(dataFileName) ) {
  print(paste(dataFileName, "not found - check what directory your in."))
} else {
  print(paste(dataFileName, "is available - Loading Data ..."))

  NEI <- readRDS(dataFileName)
  print("Done")
  
  NEI_Balt = subset(NEI, fips == "24510")
  rm(NEI) # we no long need the full dataset 

  # Create a dataframe 
  dfCatBalt <- data.frame(category=rep(c("POINT", "NONPOINT", "ON-ROAD", "NON-ROAD"), each=4),
                   year=rep(c("1999", "2002", "2005", "2008"), 4),
                   emissions=c(
                      sum(NEI_Balt[NEI_Balt$type == "POINT" & NEI_Balt$year == 1999,]$Emissions, na.rm=TRUE) 
                     ,sum(NEI_Balt[NEI_Balt$type == "POINT" & NEI_Balt$year == 2002,]$Emissions, na.rm=TRUE) 
                     ,sum(NEI_Balt[NEI_Balt$type == "POINT" & NEI_Balt$year == 2005,]$Emissions, na.rm=TRUE) 
                     ,sum(NEI_Balt[NEI_Balt$type == "POINT" & NEI_Balt$year == 2008,]$Emissions, na.rm=TRUE) 

                     ,sum(NEI_Balt[NEI_Balt$type == "NONPOINT" & NEI_Balt$year == 1999,]$Emissions, na.rm=TRUE) 
                     ,sum(NEI_Balt[NEI_Balt$type == "NONPOINT" & NEI_Balt$year == 2002,]$Emissions, na.rm=TRUE) 
                     ,sum(NEI_Balt[NEI_Balt$type == "NONPOINT" & NEI_Balt$year == 2005,]$Emissions, na.rm=TRUE) 
                     ,sum(NEI_Balt[NEI_Balt$type == "NONPOINT" & NEI_Balt$year == 2008,]$Emissions, na.rm=TRUE) 

                     ,sum(NEI_Balt[NEI_Balt$type == "ON-ROAD" & NEI_Balt$year == 1999,]$Emissions, na.rm=TRUE) 
                     ,sum(NEI_Balt[NEI_Balt$type == "ON-ROAD" & NEI_Balt$year == 2002,]$Emissions, na.rm=TRUE) 
                     ,sum(NEI_Balt[NEI_Balt$type == "ON-ROAD" & NEI_Balt$year == 2005,]$Emissions, na.rm=TRUE) 
                     ,sum(NEI_Balt[NEI_Balt$type == "ON-ROAD" & NEI_Balt$year == 2008,]$Emissions, na.rm=TRUE) 

                     ,sum(NEI_Balt[NEI_Balt$type == "NON-ROAD" & NEI_Balt$year == 1999,]$Emissions, na.rm=TRUE)                      
                     ,sum(NEI_Balt[NEI_Balt$type == "NON-ROAD" & NEI_Balt$year == 2002,]$Emissions, na.rm=TRUE)                      
                     ,sum(NEI_Balt[NEI_Balt$type == "NON-ROAD" & NEI_Balt$year == 2005,]$Emissions, na.rm=TRUE)                      
                     ,sum(NEI_Balt[NEI_Balt$type == "NON-ROAD" & NEI_Balt$year == 2008,]$Emissions, na.rm=TRUE)                      
                   ))

  library(ggplot2) # make sure ggplot2 is available
  
  print("Generate the plot") 

  # setup a custom colour palette:
  mycbp <- c("#009E73", "#CC79A7", "#D55E00", "#0072B2")

  par(mfrow = c(1,1))
  # Q3 (see above)
  # use ggplot : first create plot object with points and then join them by lines
  #            : Use Custom Colours
  pq3 <- ggplot(data=dfCatBalt, aes(x=year, y=emissions, fill=category)) +
    geom_point(aes(colour = category), size=4, alpha=.4) +
    geom_line(aes(group = category, color = category), lwd=2, alpha=.8) +
    scale_color_manual(values=mycbp)

  #            : add the values (as text) to the points for clarity
  pq3 <- pq3 + geom_text(
      label=format(round(as.numeric(dfCatBalt[,'emissions']), digits = 0), nsmall=0, big.mark=","), 
      nudge_x = 0.18, nudge_y = 20, size = 2.7,
      check_overlap = T
    )
  
  #            : add  X an Y labels,title and sub-title
  pq3 <- pq3 + xlab("Year") +
        ylab("Emissions (tons)") +
        labs(title = "Emissions (PM2.5) in Baltimore City",
        subtitle = "(By Category and Year)")
  # draw the plot
  print(pq3)
  
  # Answer:
  # Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
  #  'nonpoint', 'onroad' and 'nonroad' have seen decreases in emissions from 1999–2008 for Baltimore City
  # while 'point' shows an increase in emissions from 1999–2008 for Baltimore City.
 
  # Plot Image
   if( savePlot) {
     dev.copy(png, file=plotFileName) ## Copy the plot to a PNG file
     dev.off() ## Close PNG device
     print(paste(plotFileName, "saved"))
   }
}


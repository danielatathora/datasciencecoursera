## Coursera Week 4 playground (2 of 2)

# fips: A five-digit number (represented as a string) indicating the U.S. county
# SCC: The name of the source as indicated by a digit string (see source code classification table)
# Pollutant: A string indicating the pollutant
# Emissions: Amount of PM2.5 emitted, in tons
# type: The type of source (point, non-point, on-road, or non-road)
# year: The year of emissions recorded

#The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008. You may use any R package you want to support your analysis.

#Questions
#You must address the following questions and tasks in your exploratory analysis. For each question/task you will need to make a single plot. Unless specified, you can use any plotting system in R to make your plot.

#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
#  How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
#  Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
#  
# library("ggplot2")
# library(ggplot2)
#library(ggplot2movies)
#g <- ggplot(movies, aes(votes, rating))
#print(g)


# histogram using qplot()
#qplot(hwy, data = mpg, fill = drv)


## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)
str(NEI)
summary(NEI)
dim(NEI)
names(NEI)

head(SCC)
str(SCC)
summary(SCC)
dim(SCC)
names(SCC)

unique(SCC$SCC)
unique(SCC$Data.Category)
SCC[1:4,]$EI.Sector





NEI$Pollutant[30:130]

range(NEI$year)
# [1] 1999 2008

unique(NEI$year)
# [1] 1999 2002 2005 2008

hist(NEI$Emissions ~ HEI$year)


NEI_Balt = subset(NEI, fips == "24510")

 # http://www.sthda.com/english/wiki/ggplot2-barplots-quick-start-guide-r-software-and-data-visualization
 # Create some data
 df2 <- data.frame(type=rep(c("POINT", "NONPOINT", "ON-ROAD", "NON-ROAD"), each=4),
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

  df2a <- data.frame(type=rep("NON-ROAD", each=4),
                   year=c("1999", "2002", "2005", "2008"),
                   emissions=c(
                       sum(NEI_Balt[NEI_Balt$type == "NON-ROAD" & NEI_Balt$year == 1999,]$Emissions, na.rm=TRUE) 
                      ,sum(NEI_Balt[NEI_Balt$type == "NON-ROAD" & NEI_Balt$year == 2002,]$Emissions, na.rm=TRUE) 
                      ,sum(NEI_Balt[NEI_Balt$type == "NON-ROAD" & NEI_Balt$year == 2005,]$Emissions, na.rm=TRUE) 
                      ,sum(NEI_Balt[NEI_Balt$type == "NON-ROAD" & NEI_Balt$year == 2008,]$Emissions, na.rm=TRUE) 
                   ))
 df2a
 
 # str(df2)

 df2 <- data.frame(type=rep(c("POINT", "NONPOINT", "ON-ROAD", "NON-ROAD"), each=4),
                   year=rep(c("1999", "2002", "2005", "2008"), 4),
                   emissions=c(
                      sum(NEI_Balt[NEI_Balt$type == "NONPOINT" & NEI_Balt$year == 2008,]$Emissions, na.rm=TRUE) 
                     ,sum(NEI_Balt[NEI_Balt$type == "ON-ROAD" & NEI_Balt$year == 2008,]$Emissions, na.rm=TRUE) 
                     ,sum(NEI_Balt[NEI_Balt$type == "NON-ROAD" & NEI_Balt$year == 2008,]$Emissions, na.rm=TRUE)
                     ,sum(NEI_Balt[NEI_Balt$type == "POINT" & NEI_Balt$year == 2008,]$Emissions, na.rm=TRUE) 
                  
                      ,sum(NEI_Balt[NEI_Balt$type == "POINT" & NEI_Balt$year == 2005,]$Emissions, na.rm=TRUE) 
                      ,sum(NEI_Balt[NEI_Balt$type == "NONPOINT" & NEI_Balt$year == 2005,]$Emissions, na.rm=TRUE) 
                      ,sum(NEI_Balt[NEI_Balt$type == "ON-ROAD" & NEI_Balt$year == 2005,]$Emissions, na.rm=TRUE) 
                      ,sum(NEI_Balt[NEI_Balt$type == "NON-ROAD" & NEI_Balt$year == 2005,]$Emissions, na.rm=TRUE)                      
                     
                      ,sum(NEI_Balt[NEI_Balt$type == "POINT" & NEI_Balt$year == 2002,]$Emissions, na.rm=TRUE) 
                      ,sum(NEI_Balt[NEI_Balt$type == "NONPOINT" & NEI_Balt$year == 2002,]$Emissions, na.rm=TRUE) 
                      ,sum(NEI_Balt[NEI_Balt$type == "ON-ROAD" & NEI_Balt$year == 2002,]$Emissions, na.rm=TRUE) 
                      ,sum(NEI_Balt[NEI_Balt$type == "NON-ROAD" & NEI_Balt$year == 2002,]$Emissions, na.rm=TRUE)                      

                      ,sum(NEI_Balt[NEI_Balt$type == "POINT" & NEI_Balt$year == 1999,]$Emissions, na.rm=TRUE) 
                      ,sum(NEI_Balt[NEI_Balt$type == "NONPOINT" & NEI_Balt$year == 1999,]$Emissions, na.rm=TRUE) 
                      ,sum(NEI_Balt[NEI_Balt$type == "ON-ROAD" & NEI_Balt$year == 1999,]$Emissions, na.rm=TRUE) 
                      ,sum(NEI_Balt[NEI_Balt$type == "NON-ROAD" & NEI_Balt$year == 1999,]$Emissions, na.rm=TRUE)                      
                   ))
 
 head(df2)

 sum(NEI_Balt[NEI_Balt$type == "POINT" & NEI_Balt$year == 1999,]$Emissions, na.rm=TRUE) 
 sum(NEI_Balt[NEI_Balt$type == "POINT" & NEI_Balt$year == 2002,]$Emissions, na.rm=TRUE) 
 sum(NEI_Balt[NEI_Balt$type == "POINT" & NEI_Balt$year == 2005,]$Emissions, na.rm=TRUE) 
 sum(NEI_Balt[NEI_Balt$type == "POINT" & NEI_Balt$year == 2008,]$Emissions, na.rm=TRUE) 
 
 sum(NEI_Balt[NEI_Balt$type == "NONPOINT" & NEI_Balt$year == 1999,]$Emissions, na.rm=TRUE) 
 sum(NEI_Balt[NEI_Balt$type == "NONPOINT" & NEI_Balt$year == 2002,]$Emissions, na.rm=TRUE) 
 sum(NEI_Balt[NEI_Balt$type == "NONPOINT" & NEI_Balt$year == 2005,]$Emissions, na.rm=TRUE) 
 sum(NEI_Balt[NEI_Balt$type == "NONPOINT" & NEI_Balt$year == 2008,]$Emissions, na.rm=TRUE) 
 
 sum(NEI_Balt[NEI_Balt$type == "ON-ROAD" & NEI_Balt$year == 1999,]$Emissions, na.rm=TRUE) 
 sum(NEI_Balt[NEI_Balt$type == "ON-ROAD" & NEI_Balt$year == 2002,]$Emissions, na.rm=TRUE) 
 sum(NEI_Balt[NEI_Balt$type == "ON-ROAD" & NEI_Balt$year == 2005,]$Emissions, na.rm=TRUE) 
 sum(NEI_Balt[NEI_Balt$type == "ON-ROAD" & NEI_Balt$year == 2008,]$Emissions, na.rm=TRUE) 

 sum(NEI_Balt[NEI_Balt$type == "NON-ROAD" & NEI_Balt$year == 1999,]$Emissions, na.rm=TRUE) 
 sum(NEI_Balt[NEI_Balt$type == "NON-ROAD" & NEI_Balt$year == 2002,]$Emissions, na.rm=TRUE) 
 sum(NEI_Balt[NEI_Balt$type == "NON-ROAD" & NEI_Balt$year == 2005,]$Emissions, na.rm=TRUE) 
 sum(NEI_Balt[NEI_Balt$type == "NON-ROAD" & NEI_Balt$year == 2008,]$Emissions, na.rm=TRUE) 
 
 
 # library(ggplot2)

  # The palette with grey:
 #cbp1 <- c("#999999", "#E69F00", "#56B4E9", "#009E73",
 #          "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
 
 # The palette with black:
 #cbp2 <- c("#000000", "#E69F00", "#56B4E9", "#009E73",
 #          "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
 
 # The palette with black:
 mycbp <- c("#009E73", "#CC79A7", "#D55E00", "#0072B2")
 
 
  # To use for fills, add
 #bp + scale_fill_manual(values = cbp1)
 
 # To use for line and point colors, add
 #sp + scale_colour_manual(values=cbp2)
 
 # Q3 
 # Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
 
p3 <- ggplot(data=df2, aes(x=year, y=emissions, fill=type)) +
    geom_point(aes(colour = type), size=4, alpha=.4) +
    geom_line(aes(group = type, color = type), lwd=2, alpha=.8) +

p3 <- p3 + geom_text(
      label=round(df2[,3], digits = 0), 
      nudge_x = 0.18, size = 2.7, 
      check_overlap = T
     ) +
    xlab("Year") +
    ylab("Emissions (tons)") +
    labs(title = "Emissions in Baltimore City",
         subtitle = "Grouped by Type and Year")

     # caption is also another option for labs

 
# Answer:
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, nonpoint, onroad and nonroad have seen decreases in emissions from 1999–2008 for Baltimore City while
# point shows an increase in emissions from 1999–2008 for Baltimore City.

# Plot Image 
dev.copy(png, file="plot3_proj_2.png") ## Copy the plot to a PNG file
dev.off() ## Close PNG device
print("plot3_proj_2.png saved")
 

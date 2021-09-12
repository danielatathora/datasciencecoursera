## Coursera Week 4 playground

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

NEI$Pollutant[30:130]

range(NEI$year)
# [1] 1999 2008

unique(NEI$year)
# [1] 1999 2002 2005 2008

hist(NEI$Emissions ~ HEI$year)


# Note: copy a plot is not an exact operation so the result may look a little different.


length(subset(NEI, year == 1999))
length(subset(NEI, year == 1999)$Emissions)
length(subset(NEI, year == 2002)$Emissions)
length(subset(NEI, year == 2005)$Emissions)
length(subset(NEI, year == 2008)$Emissions)

plot(subset(NEI, year == 1999)$Emissions)

str(NEI)

with(NEI$Emissions, plot(Emissions, year)) ## Create a plot on the screen device

barplot(table(NEI$year), col= "cyan", main = "Test Bar Chart")

sum(NEI$Emissions)
sum(subset(NEI, year == 1999)$Emissions)/1000
sum(subset(NEI, year == 2002)$Emissions)/1000
sum(subset(NEI, year == 2005)$Emissions)/1000
sum(subset(NEI, year == 2008)$Emissions)/1000


#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

barplot( c(sum(subset(NEI, year == 1999)$Emissions/100000)
         , sum(subset(NEI, year == 2002)$Emissions/100000)
         , sum(subset(NEI, year == 2005)$Emissions/100000)
         , sum(subset(NEI, year == 2008)$Emissions)/100000)
         , col= "maroon"
         , main = "PM2.5 Emmisions by Year"
         , xlab = "Year"
         , ylab="PM2.5 emisions in millions of tons"
         , names.arg = c("1999", "2002", "2005", "2008"))

# Yes, the total emissions from PM2.5 decreased in the United States from 1999 to 2008.


#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

NEI_Balt = subset(NEI, fips == "24510")
sum(NEI_Balt$Emissions)/1000
sum(subset(NEI_Balt, year == 1999)$Emissions)
sum(subset(NEI_Balt, year == 2002)$Emissions)
sum(subset(NEI_Balt, year == 2005)$Emissions)
sum(subset(NEI_Balt, year == 2008)$Emissions)

unique(NEI_Balt$type)
sum(subset(NEI_Balt, year == 1999)$Emissions)
  sum(subset(NEI_Balt, year == 1999 & type == "POINT")$Emissions)
  sum(subset(NEI_Balt, year == 1999 & type == "NONPOINT")$Emissions)
  sum(subset(NEI_Balt, year == 1999 & type == "ON-ROAD")$Emissions)
  sum(subset(NEI_Balt, year == 1999 & type == "NON-ROAD")$Emissions)
sum(subset(NEI_Balt, year == 2002)$Emissions)
  sum(subset(NEI_Balt, year == 2002 & type == "POINT")$Emissions)
  sum(subset(NEI_Balt, year == 2002 & type == "NONPOINT")$Emissions)
  sum(subset(NEI_Balt, year == 2002 & type == "ON-ROAD")$Emissions)
  sum(subset(NEI_Balt, year == 2002 & type == "NON-ROAD")$Emissions)

sum(subset(NEI_Balt, year == 2005)$Emissions)
sum(subset(NEI_Balt, year == 2008)$Emissions)

# reset dislay
par(mfrow = c(1,1))
barplot( c(sum(subset(NEI_Balt, year == 1999)$Emissions)
           , sum(subset(NEI_Balt, year == 2002)$Emissions)
           , sum(subset(NEI_Balt, year == 2005)$Emissions)
           , sum(subset(NEI_Balt, year == 2008)$Emissions))
         , col= "royalblue1"
         , main = "PM2.5 Emmisions in Balimore (fips==24510) by Year"
         , xlab = "Year"
         , ylab="PM2.5 emisions in tons"
         , names.arg = c("1999", "2002", "2005", "2008"))

barplot( c(sum(subset(NEI_Balt, year == 1999)$Emissions)
           , sum(subset(NEI_Balt, year == 2002)$Emissions)
           , sum(subset(NEI_Balt, year == 2005)$Emissions)
           , sum(subset(NEI_Balt, year == 2008)$Emissions))
         , col= "royalblue2"
         , main = "PM2.5 Emmisions in Balimore (fips==24510) by Year"
         , xlab = "Year"
         , ylab="PM2.5 emisions in tons"
         , names.arg = c("1999", "2002", "2005", "2008"))

# Yes, the total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008.
# however, although 2008 has less emissions than previous years, 2005 had a higher level than 2002
head(NEI_Balt)

# library(ggplot2)

qplot(Emissions, data = NEI_Balt, fill = type)

qplot(max(Emissions), data = NEI_Balt, fill = type)

qplot(Emissions, year, data = NEI_Balt, facets = type ~ .)
qplot(log10(Emissions), year, data = NEI_Balt, facets = type ~ .)

g <- ggplot(NEI_Balt, aes(Emissions, type)) 

g + geom_point() + facet_grid( . ~ year) + geom_smooth(method = "lm")

g <- ggplot(NEI_Balt, aes(Emissions, type)) 
g + geom_point() + facet_grid( . ~ year) # + geom_smooth(method = "lm")

g + geom_point(aes(color = year), size = 2, alpha = 1/2) +
  geom_smooth(size = 4, linetype = 3, method = "lm", se = FALSE)

# histogram using qplot()
qplot(Emissions, year, data = subset(NEI_Balt, type == "POINT"))
qplot(Emissions, year, data = subset(NEI_Balt, type == "NONPOINT"))
qplot(Emissions, year, data = subset(NEI_Balt, type == "ON-ROAD"))
qplot(Emissions, year, data = subset(NEI_Balt, type == "NON-ROAD"))

unique(NEI_Balt$type)

qplot(year, Emissions, data = NEI_Balt, facets = . ~ type, geom="histogram" )

# from ggplot2 notes
# qplot(log(eno), data = maacs, geom = "density", color = mopos)

qplot(type, Emissions, data = NEI_Balt, geom = "density", color = year)

length(subset(NEI_Balt, type=="POINT"))

       

qplot(Emissions, data = subset(NEI_Balt, type=="POINT"), geom = "histogram", color = year)

qplot(log(Emissions), year, data = NEI_Balt, facets = .~ type) + geom_smooth(method = "lm")
qplot(log(Emissions), log(year), data = NEI_Balt) + geom_smooth(method = "lm")

boxplot(subset(NEI_Balt, type=="NONPOINT" & Emissions < 800)$Emissions)
plot(subset(NEI_Balt, type=="NONPOINT" & Emissions < 750)$Emissions)

g <- ggplot(NEI_Balt, aes(year, Emissions))
g <- ggplot(subset(NEI_Balt,Emissions < 750), aes(year, Emissions))
g + geom_point()

g + geom_point() + facet_grid(. ~ type) + geom_smooth()
                 #+ scale_x_discrete(guide = guide_axis(angle = 90)) 
                 #+ scale_x_discrete(guide = guide_axis(n.dodge = 2))
                + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))
#g2 <- ggplot(NEI_Balt, aes(Emissions, year))
#g2 + geom_point()


g + geom_line()


# try uning basic plots first

par(mfrow=c(4,1))
barplot( c(sum(subset(subset(NEI_Balt, type=="POINT"), year == 1999)$Emissions)
           , sum(subset(subset(NEI_Balt, type=="POINT"), year == 2002)$Emissions)
           , sum(subset(subset(NEI_Balt, type=="POINT"), year == 2005)$Emissions)
           , sum(subset(subset(NEI_Balt, type=="POINT"), year == 2008)$Emissions))
         , col= "royalblue1"
         , main = "PM2.5 Emmisions in Balimoreby Year (POINT)"
         , xlab = "Year"
         , ylab="PM2.5 emisions in tons"
         , names.arg = c("1999", "2002", "2005", "2008"))


barplot( c(sum(subset(subset(NEI_Balt, type=="NONPOINT"), year == 1999)$Emissions)
           , sum(subset(subset(NEI_Balt, type=="NONPOINT"), year == 2002)$Emissions)
           , sum(subset(subset(NEI_Balt, type=="NONPOINT"), year == 2005)$Emissions)
           , sum(subset(subset(NEI_Balt, type=="NONPOINT"), year == 2008)$Emissions))
         , col= "royalblue1"
         , main = "PM2.5 Emmisions in Balimoreby Year (NONPOINT)"
         , xlab = "Year"
         , ylab="PM2.5 emisions in tons"
         , names.arg = c("1999", "2002", "2005", "2008"))

barplot( c(sum(subset(subset(NEI_Balt, type=="ON-ROAD"), year == 1999)$Emissions)
           , sum(subset(subset(NEI_Balt, type=="ON-ROAD"), year == 2002)$Emissions)
           , sum(subset(subset(NEI_Balt, type=="ON-ROAD"), year == 2005)$Emissions)
           , sum(subset(subset(NEI_Balt, type=="ON-ROAD"), year == 2008)$Emissions))
         , col= "royalblue1"
         , main = "PM2.5 Emmisions in Balimoreby Year (ON-ROAD)"
         , xlab = "Year"
         , ylab="PM2.5 emisions in tons"
         , names.arg = c("1999", "2002", "2005", "2008"))

barplot( c(sum(subset(subset(NEI_Balt, type=="NON-ROAD"), year == 1999)$Emissions)
           , sum(subset(subset(NEI_Balt, type=="NON-ROAD"), year == 2002)$Emissions)
           , sum(subset(subset(NEI_Balt, type=="NON-ROAD"), year == 2005)$Emissions)
           , sum(subset(subset(NEI_Balt, type=="NON-ROAD"), year == 2008)$Emissions))
         , col= "royalblue1"
         , main = "PM2.5 Emmisions in Balimoreby Year (NON-ROAD)"
         , xlab = "Year"
         , ylab="PM2.5 emisions in tons"
         , names.arg = c("1999", "2002", "2005", "2008"))

sum(subset(NEI_Balt, year == 1999 & type == "POINT")$Emissions)
sum(subset(NEI_Balt, year == 2002 & type == "POINT")$Emissions)
sum(subset(NEI_Balt, year == 2005 & type == "POINT")$Emissions)
sum(subset(NEI_Balt, year == 2008 & type == "POINT")$Emissions)

sum(subset(NEI_Balt, year == 1999 & type == "NONPOINT")$Emissions)
sum(subset(NEI_Balt, year == 2002 & type == "NONPOINT")$Emissions)
sum(subset(NEI_Balt, year == 2005 & type == "NONPOINT")$Emissions)
sum(subset(NEI_Balt, year == 2008 & type == "NONPOINT")$Emissions)


# for testing i get a sample
#testdat = sample (NEI_Balt, size=5000, replace =T)
#dim(testdat)
# rm(testdat)

sum(subset(testdat, year == 1999 & type == "NONPOINT")$Emissions)

g <- ggplot(testdat, aes(type, Emissions))
g + geom_line(type=="POINT")


max(NEI_Balt$Emissions)
NEI_Balt[NEI_Balt$Emissions == 1044]

#NEI_Balt[NEI_Balt$Emissions > 646900]
summary(NEI$Emissions)

  g <- ggplot(NEI_Balt, aes(year, Emissions), pch=19)
  g + geom_line()
    + coord_cartesian(ylim = c(0, 400))
   labs(x = "Yeard", y = "Particulate matter emissions (tons)", 
       title = "Motor vehicle emissions in Baltimore")

 str(testdat)
 #df$year <- as.numeric(as.character(df$year))

#dim(NEI)
#dim(NEI_Balt)
#str(NEI_Balt)

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
 sum(NEI_Balt[NEI_Balt$type == "NONPOINT" & NEI_Balt$year == 1999,]$Emissions, na.rm=TRUE) 
 sum(NEI_Balt[NEI_Balt$type == "ON-ROAD" & NEI_Balt$year == 1999,]$Emissions, na.rm=TRUE) 
 sum(NEI_Balt[NEI_Balt$type == "NON-ROAD" & NEI_Balt$year == 1999,]$Emissions, na.rm=TRUE)
 
 sum(NEI_Balt[NEI_Balt$type == "NONPOINT" & NEI_Balt$year == 1999,]$Emissions, na.rm=TRUE) 
 sum(NEI_Balt[NEI_Balt$type == "NONPOINT" & NEI_Balt$year == 2002,]$Emissions, na.rm=TRUE) 
 sum(NEI_Balt[NEI_Balt$type == "NONPOINT" & NEI_Balt$year == 2005,]$Emissions, na.rm=TRUE) 
 sum(NEI_Balt[NEI_Balt$type == "NONPOINT" & NEI_Balt$year == 2008,]$Emissions, na.rm=TRUE) 
 
 sum(NEI_Balt[NEI_Balt$type == "NON-ROAD" & NEI_Balt$year == 1999,]$Emissions, na.rm=TRUE) 
 sum(NEI_Balt[NEI_Balt$type == "NON-ROAD" & NEI_Balt$year == 2002,]$Emissions, na.rm=TRUE) 
 sum(NEI_Balt[NEI_Balt$type == "NON-ROAD" & NEI_Balt$year == 2005,]$Emissions, na.rm=TRUE) 
 sum(NEI_Balt[NEI_Balt$type == "NON-ROAD" & NEI_Balt$year == 2008,]$Emissions, na.rm=TRUE) 
 
 # x axis treated as continuous variable

  # df2$year <- as.numeric(as.vector(df2$year))
 ggplot(data=df2, aes(x=year, y=emissions, fill=type)) +
   geom_bar(stat="identity", position=position_dodge())+
   scale_fill_brewer(palette="Paired") +
   theme_minimal()

  # Axis treated as discrete variable
 # df2$year<-as.factor(df2$year)
 # ggplot(data=df2, aes(x=year, y=emissions, fill=type)) +
 #   geom_bar(stat="identity", position=position_dodge())+
 #   scale_fill_brewer(palette="Paired")+
 #   theme_minimal()
 
 #df2$emissions = df2$emissions/1000
 # vjust=1.6, 
 ggplot(data=df2, aes(x=year, y=emissions, fill=type)) +
   geom_bar(stat="identity", position=position_dodge()) +
   geom_text(aes(label=emissions), vjust=1.6, color="white",
              position = position_dodge(0.5), size=2.5) +
   scale_fill_brewer(palette="Paired") +
   theme_minimal()
 
 sum(NEI_Balt[NEI_Balt$type == "POINT"]$Emissions)
 
 names(NEI_Balt)
 

 #ggplot(data=df2, aes(x=dose, y=len, fill=supp)) +
 #  geom_bar(stat="identity", position=position_dodge())+
#   geom_text(aes(label=len), vjust=1.6, color="white",
#             position = position_dodge(0.9), size=3.5)+
#   scale_fill_brewer(palette="Paired")+
 #   theme_minimal()
 
 ggplot(data=df2, aes(x=year, y=emissions, fill=type)) +
   #geom_tile(aes(x = year, y = emissions, fill = type), height = 0.8) +
   # scale_fill_continuous() +
   # scale_x_discrete(position = "top") +
   geom_bar(stat="identity", position=position_dodge()) +
   xlab("Year") +
   ylab("Emissions (tons)") +
   geom_text(aes(label=as.integer(emissions), angle=90), vjust=0.4, hjust=1.0, color="white",
                          position = position_dodge(0.9), size=3.2)+
   theme(axis.text.x = element_text(angle = 90, vjust = 0.0))
 
 ggplot(data=df2, aes(x=type, y=emissions, fill=year)) +
   geom_bar(stat="identity", position=position_dodge()) +
   xlab("Type") +
   ylab("Emissions (tons)") +
   geom_text(aes(label=as.integer(emissions), angle=90), vjust=0.4, hjust=1.0, color="white",
             position = position_dodge(0.9), size=3.2)+
   theme(axis.text.x = element_text(angle = 90, vjust = 0.0))
 
 df2a
 
 # test
 ggplot(data=df2, aes(x=year, y=emissions, fill=type)) +
    geom_point(aes(colour = type), size=6, alpha=.5) +
    geom_line(aes(group = type, color = type), lwd=3, alpha=.4) +
    geom_text(
      label=round(df2[,3], digits = 0), 
      nudge_x = 0.25, nudge_y = 0.25, size = 2.5, 
      check_overlap = T
     )

 

# segments(rep(1, 52), mrg[, 2], rep(2, 52), mrg[, 3])
 
 
 #library(ggplot2)
 theme_set(theme_minimal())
 data(df2)
 ggplot(Emissions, aes(x = year)) +
   geom_line(aes(y = psavert, color = "psavert")) +
   geom_line(aes(y = uempmed, color = "uempmed"), linetype = "twodash") +
   scale_color_manual(values = c("darkred", "steelblue"))
 
 
 #library(ggplot2)
 #library(reshape2)
 #library(dplyr)
 
 #covid1 =(read.csv(file="EUCOVIDdeaths.csv",header=TRUE)[,-c(2)])
 
 #head(covid1)
 
 #covid_perCapita <- covid1[,c(2:17)] / covid$PopulationM
 
 #covid_perCapita$Country <- covid1$Country
 
 #head(covid_perCapita)
 
 #covid_perCapita_deaths <- melt(covid_perCapita,id.vars=c("Country"),
 #                               value.name="value", variable.name="Day")
 
 # library(ggplot2)
 ggplot(data=NEI_Balt,
   aes(x=year, y=c(100, 22,21,2), group = type, colour = type)) + geom_line()
 +labs(y= "Emmitions (tons)", x = "Year")  + theme_bw(base_size = 16)
 + theme(axis.text.x=element_text(angle=60,hjust=1))
 #+ ggtitle("Emission in Baltimore grouped by type")
 
 
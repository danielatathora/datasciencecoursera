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

head(SCC)
str(SCC)
summary(SCC)
dim(SCC)
names(SCC)

unique(SCC$SCC)
unique(SCC$Data.Category)
SCC[1:4,]$EI.Sector


 # The palette with black:
 mycbp <- c("#009E73", "#CC79A7", "#D55E00", "#0072B2")
 
 # names(NEI)
 # [1] "fips"      "SCC"       "Pollutant" "Emissions" "type"      "year" 
 NEI[1:20,]
dim(NEI)
# [1] 6497651       6
dim(SCC)
# [1] 11717    15

dim(subset(SCC, SCC=='10100101'))
# [1]  1 15

dim(subset(SCC, SCC=='10100401'))
# [1]  1 15

str(SCC)

dim(subset(SCC, filter(mtcars, grepl('Coal',SCC.Level.One)) ))


 # names(SCC)
# [1] "SCC"                 "Data.Category"       "Short.Name"         
# [4] "EI.Sector"           "Option.Group"        "Option.Set"         
# [7] "SCC.Level.One"       "SCC.Level.Two"       "SCC.Level.Three"    
# [10] "SCC.Level.Four"      "Map.To"              "Last.Inventory.Year"
# [13] "Created_Date"        "Revised_Date"        "Usage.Notes"
unique(SCC$SCC)
# Transaction number ?

# SCC$Data.Category
# 'Point' for all

# SCC$Short.Name
# example 'Ext Comb /Electric Gen /Bituminous Coal /Pulverized Coal: Dry Bottom'

# SCC$EI.Sector
# example "Fuel Comb - Comm/Institutional - Coal"

# SCC$Option.Group
# Empty a lot, 'RWC_StoveInserts', Paved Roads'

# SCC$Option.Set
# Empty a lot, 'A', 'B', 'B1A', 'B1B', ...

# SCC$SCC.Level.One
# 'External Combustion Boilers', 'Mobile Sources', 'Industrial Processes'

# SCC$SCC.Level.Two
# 'Electric Generation', 'Industrial', 'Commercial/Institutional'

# SCC$SCC.Level.Three
# 'Anthracite Coal', 'Bituminous/Subbituminous Coal', 'Lignite' ...

# SCC$SCC.Level.Four
# 'Pulverized Coal', 'Traveling Grate (Overfeed) Stoker', 'Pulverized Coal: Wet Bottom (Bituminous Coal)' ...

# SCC$Map.To
# Transactiopn Number

# SCC$Last.Inventory.Year
# NA 2005 2002 2008 1999

# SCC$Created_Date
# blank, '6/6/2003 0:00:00', '2/2/2004 0:00:00'

# blank, '2/2/2004 0:00:00', '9/26/2001 0:00:00'

# SCC$Usage.Notes)
# lots or blanks (Optional text)

library(stringr)
dim(subset(SCC, str_detect(tolower(Short.Name), "coal") ))
dim(subset(SCC, str_detect(tolower(EI.Sector), "coal") ))
dim(subset(SCC, str_detect(tolower(SCC.Level.One), "coal") ))
dim(subset(SCC, str_detect(tolower(SCC.Level.Two), "coal") ))
dim(subset(SCC, str_detect(tolower(SCC.Level.Three), "coal") ))
dim(subset(SCC, str_detect(tolower(SCC.Level.Four), "coal") ))


# probably not the most efficient , look in colums Short.Name, EI.Sector, SCC.Level.One/Two.Threee/Four for string 'coal', 'lignite' (brown coal) or 'anthracite'  
sccLevelForCoal <- subset(SCC, 
                          str_detect(Short.Name, coll("coal", TRUE))      | str_detect(Short.Name, coll("lignite", TRUE))      | str_detect(Short.Name, coll("anthracite", TRUE))      | 
                          str_detect(EI.Sector, coll("coal", TRUE))       | str_detect(EI.Sector, coll("lignite", TRUE))       | str_detect(EI.Sector, coll("anthracite", TRUE))       |
                          str_detect(SCC.Level.One, coll("coal", TRUE))   | str_detect(SCC.Level.One, coll("lignite", TRUE))   | str_detect(SCC.Level.One, coll("anthracite", TRUE))   |
                          str_detect(SCC.Level.Two, coll("coal", TRUE))   | str_detect(SCC.Level.Two, coll("lignite", TRUE))   | str_detect(SCC.Level.Two, coll("anthracite", TRUE))   |
                          str_detect(SCC.Level.Three, coll("coal", TRUE)) | str_detect(SCC.Level.Three, coll("lignite", TRUE)) | str_detect(SCC.Level.Three, coll("anthracite", TRUE)) |
                          str_detect(SCC.Level.Four, coll("coal", TRUE))  | str_detect(SCC.Level.Four, coll("lignite", TRUE))  | str_detect(SCC.Level.Four, coll("anthracite", TRUE)))




dim(sccLevelForCoal)
# [1] 253  15

# create a dataFrame of a sub-set (8) of the columns
dfCoalSources <- data.frame(sccLevelForCoal[,
                           c('SCC',
                             'Data.Category', 
                             'Short.Name',
                             'EI.Sector',
                             'SCC.Level.One',
                             'SCC.Level.Two',
                             'SCC.Level.Three',
                             'SCC.Level.Four'
                             )])
dim(dfCoalSources)
# [1] 253   8
coalSCCs <- dfCoalSources$SCC
str(coalSCCs)

NEI_COAL <- subset(NEI, SCC %in% coalSCCs)
dim(NEI_COAL)

# `%askmegranny%` <- function(a, b) ! a %in% b
#NEI_NONCOAL <- subset(NEI, SCC %askmegranny% coalSCCs)

dim(NEI)
dim(NEI_COAL)
#dim(NEI_NONCOAL)
#rm(NEI_NONCOAL)


#neiSccNotCoalTest <- NEI_NONCOAL[1:2000,]$SCC

#neiSccNotCoalTest[1:10]
#rm(neiSccNotCoalTest)


#nonCoalTest <- subset(SCC, SCC %in% neiSccNotCoalTest)
#dfNonCoalSources <- data.frame(nonCoalTest [,
#                           c('SCC',
#                             'Data.Category', 
#                             'Short.Name',
#                             'EI.Sector',
#                             'SCC.Level.One',
#                             'SCC.Level.Two',
#                             'SCC.Level.Three',
#                             'SCC.Level.Four'
#                             )])

- ok, its Diesel, oil, gasoline, wood and other etc so looks to be  non coal
#write.csv(dfNonCoalSources, file="SCC_Test_noncoal.csv" )
#rm(dfNonCoalSources)
#rm(nonCoalTest)


length(unique(NEI_COAL$SCC))


 

par(mfrow= c( 1, 3))
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

   barplot( c(sum(subset(NEI, year == 1999 & SCC %in% coalSCCs)$Emissions/1000)
            , sum(subset(NEI, year == 2002 & SCC %in% coalSCCs)$Emissions/1000)
            , sum(subset(NEI, year == 2005 & SCC %in% coalSCCs)$Emissions/1000)
            , sum(subset(NEI, year == 2008 & SCC %in% coalSCCs)$Emissions/1000))
            , col= "cyan"
            , main = "PM2.5 Coal based Emissions by Year"
            , xlab = "Year"
            , ylab="PM2.5 emissions in (kilotons)"
            , ylim= c(0, 800)
            , names.arg = c("1999", "2002", "2005", "2008"))



   print("Done")


 


# data for reproducible example
# (and to avoid confusion from trying to subset `stats::df`)
df <- setNames(data.frame(as.list(1:5)), LETTERS[1:5])
# subset
df[c("A","B","E")]


unique(SCC$Data.Category)
unique(SCC$EI.Sector)




 # Question 4:
 #  Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
 

 
# Answer:


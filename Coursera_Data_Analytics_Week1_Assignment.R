# household_power_consumption
household_power_fileName <- "household_power_consumption.txt"

# 2007-02-01 and 2007-02-02

hhpDataAll <- read.table(file = household_power_fileName, header = TRUE, sep=';')
dim(hhpDataAll)
# get two data data
hhpData <- subset(hhpDataAll, Date>="2/1/2007" & Date<="2/2/2007")
dim(hhpData)
rm(hhpDataAll)

summary(hhpData)

# using read.csv.sql

# library(sqldf)
# bigdata <- read.csv.sql(file="<Path to your file>",
#                        sql="select * from file where ...",
#                        colClasses=c("character",
#                                     rep("numeric",10)))
#
  
library(sqldf)
hhpDataSql <- read.csv.sql(file=household_power_fileName,
                        sql="select * from file where Date between '2/1/2007' and '2/2/2007'",
                        sep=";",
                        colClasses=rep("character",9))

# as.Date(df$Date, format =  "%m/%d/%Y %H:%M:%S")
paste(as.Date(hhpDataSql$Date, format =  "%m/%d/%Y"), hhpDataSql$Time)

summary(hhpDataSql)
test.data <- data.frame(paste(as.Date(hhpDataSql$Date, format =  "%m/%d/%Y"), hhpDataSql$Time),
                        Global_active_power, Global_reactive_power , stringsAsFactors=FALSE)

dim(test.data[0:3,])
test.data[0:3,]



summary(hhpDataSql)
dim(hhpDataSql)
test <- hhpDataSql[0:10,]
attach(test)

# using dplyr
library(dplyr)

test %>%
  select(Date, Time)

#This can also be written without the %>% pipe as:
  
select(test, Date, Time)
typeof(Date)

select(test, as.Date(Date, "%d/%m/%Y"), Time)

select(test, paste(Date, Time))

strptime(dts, "%m/%d/%y %H:%M:%S")
        



typeof(bigdata)
head(hhpData)
summary(hhpData)
attach(hhpData)

hhpData2 <- read.csv(household_power_fileName, header = T, sep=';')
head(hhpData2)
summary(hhpData2)
attach(hhpData2)

length(Date)
# 2075259

typeof(hhpData)

hhpData2[Date>="1/2/2007" & Date<="2/2/2007"]

x <- table(hhpData2[Date>="1/2/2007" & Date<="2/2/2007"])



# date appear to be M/D/YYYY
length(Date[Date>="1/2/2007" & Date<="2/2/2007"])
# 750636

##########################
#
# Two day range
#
##########################
length(Date[Date>="2/1/2007" & Date<="2/2/2007"])
# 23040
hhpData2[0:10][[Date>="2/1/2007" & Date<="2/2/2007"]]
typeof (hhpData2)








hhpData2[Date>="2/1/2007" & Date<="2/2/2007"]

format(as.Date('1978-01-01'), by = 'day', len = 7)
format(as.Date('2/2/2007'), by = 'day', len = 7)
dt.test <- hhpData2$Date[0:10]
hhpData2$Time[0:10]

# date time
dts <- paste(hhpData2$Date[0:10],hhpData2$Time[0:10])
dts
xTest <- dts[0:1]
xTest
strptime(dts, "%m/%d/%y %H:%M:%S")

dt.test
as.Date(dt.test, "%d/%m/%Y")
hhpData2$Date[0:10]


# You may find it useful to convert the Date and Time variables to Date/Time classes
# in R using the strptime()  
# and as.Date() functions.


as.Date(hhpData2$Date[0:10], "%d%b%Y")
z<- as.Date(x, "%d%b%Y")






hhpData[0:3,]
hhpData[0:3,]$Date
c(paste(hhpData[0:3,]$Date, hhpData[0:3,]$Time))
as.Date(dt.test, "%d/%m/%Y")
hhpData2[as.Date(Date, "%d/%m/%Y")>='2007-02-01' & as.Date(Date, "%d/%m/%Y")<='2007-02-02']



dim(x)



hhpData[hhpData$Date>="2007-02-01" & hhpData$Date<="2007-02-02"]


?read.table
?read.csv

# install.packages("sqldf")

library(sqldf)


dim(hhpData)
dim(hhpData2)
summary(hhpData)
hhpData$Date[0:2]
?strptime
d1 <- hhpData$Date[0:2]
t1 <- hhpData$Time[0:2]

t1

dt1

strptime(dt1, "%m/%d/%y %H:%M:%S")











# Coursera_Data_Analytics_2 in R - Week 1 - using read.csl.sql

# household_power_consumption
household_power_fileName <- "household_power_consumption.txt"

use_read_csv_sql = TRUE
plot_1 = FALSE
plot_2 = FALSE
plot_3 = FALSE
plot_4 = FALSE
plot_4b = TRUE


# 2007-02-01 and 2007-02-02
if( use_read_csv_sql) {
  print("using csv.sql")        
  library(sqldf)
  hhpDataSql <- read.csv.sql(file=household_power_fileName,
                           sql="select * from file where Date IN('2/1/2007', '2/2/2007')",
                           sep=";",
                           colClasses=rep("character",9))
        
 #  summary(hhpDataSql)
 
   # make a dataframe
  #hhpData <- data.frame(datetime = paste(as.Date(hhpDataSql$Date, format =  "%m/%d/%Y"), hhpDataSql$Time),
                        
#  Date/Time classes
  #as.Date(hhpDataSql$Date, "%m/%d/%y")
 #paste(as.Date(hhpDataSql$Date, "%m/%d/%y"), hhpDataSql$Time)
 
                        hhpData <- data.frame(datetime = paste(as.Date(hhpDataSql$Date, "%m/%d/%Y"), hhpDataSql$Time)
                                ,Sub_metering_1 = as.numeric(hhpDataSql$Sub_metering_1)
                                ,Sub_metering_2 = as.numeric(hhpDataSql$Sub_metering_2)
                                ,Sub_metering_3 = as.numeric(hhpDataSql$Sub_metering_3)
                                ,Global_active_power = as.numeric(hhpDataSql$Global_active_power)
                                ,Global_reactive_power = as.numeric(hhpDataSql$Global_reactive_power)
                                ,Voltage = as.numeric(hhpDataSql$Voltage)
                                ,stringsAsFactors=FALSE)
  dim(hhpData)
  hhpData <- na.omit(hhpData)
  dim(hhpData)
  
  # dim(hhpData[0:30,])
  #hhpData[0:30,]

  
  #with( test.data$G_active_power, plot(test.data$G_active_power))
  #  plot(test.data$G_active_power, type="l", col="black", lwd=1, xlab="", ylab="Global Active Power (kilowatts)")
  #strptime(hhpData$datetime[0:3], "%y/%m/%d %H:%M:%S")
  #
  hhpData$datetime <- strptime(hhpData$datetime, "%Y-%m-%d %H:%M:%S", tz = "EST5EDT")
  
  # what a pain %y give 2020 and %Y 2007 
  
} else {
  print("using read.tabe")        

  hhpDataAll <- read.table(file = household_power_fileName, header = TRUE, sep=';')
  # get two data data
  # hhpData <- subset(hhpDataAll, Date>="2/1/2007" & Date<="2/2/2007")
  # 23040 - not working as not dates, theres strings

  hhpData <- subset(hhpDataAll, Date=="2/1/2007" | Date=="2/2/2007" )
  # 2880 - exact string match - as only 2 days - this works
  
  # we dont need to keep the full set
  rm(hhpDataAll)

  dim(hhpData)
 
   # convert to numberic
  
  #hhpData$DateTime <- strptime(hhpData$Date, "%Y-%m-%d %H:%M:%S", tz = "EST5EDT")
#  hhpData$DateTime <- strptime(hhpData$Date, "%Y-%m-%d", tz = "EST5EDT")
#  as.Date(hhpDataSql$Date, "%y/%d/%m")
#  as.Date(hhpDataSql$Date, "%m/%d/%Y")
  
  hhpData$Global_active_power <- as.numeric(hhpData$Global_active_power)
}

if( plot_1) {
        
# histogram with added parameters
hist(hhpData$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     xlim=c(0,6),
     ylim=c(0,1380),
     col='red'
)

}

if( plot_2) {
        

        # what a pain %y give 2020 and %Y 2007 

          with( hhpData, 
            plot (x <- datetime, y <- Global_active_power
                  ,xlab =' '
                  ,ylab = 'Global Active power (kilowatts)'
                  ,type = "l"))
        
}

if(plot_3) {
        #hhpData$Sub_metering_1 -- seems to be all zeros for this 2 day range
        
        with( hhpData, 
              plot (x <- datetime, y <- Sub_metering_1
                    ,xlab = ' '
                    ,ylab = 'Energy sub metering'
                    ,type = "l"
                    ,ylim=c(0,30)))
 
        with(hhpData,  lines(x <- datetime, y <- Sub_metering_2, col='red'))
        with(hhpData, lines(x <- datetime, y <- Sub_metering_3, col='blue'))
        legend("topright"
               , lty = 1
               , col = c("black","red","blue")
               , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
}

if(plot_4) {  # Voltage
        #hhpData$Sub_metering_1 -- seems to be all zeros for this 2 day range
        
        with( hhpData, 
              plot (x <- datetime, y <- Voltage
                    ,xlab = 'datetime'
                    ,ylab = 'Voltage'
                    ,type = "l"
                    ,ylim=c(230,250)))
}

if(plot_4b) {  # global reactive power
        
        with( hhpData, 
              plot (x <- datetime, y <- Global_reactive_power
                    ,xlab = 'datetime'
                    ,ylab = 'Global_reactive-power' 
                    ,type = "l"
                    ,ylim=c(0.0, 0.5)))
}

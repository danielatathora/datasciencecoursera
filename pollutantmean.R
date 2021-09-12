#  pollutantmean.R - Week 2 Assignent 

pollutantmean <- function(directory, pollutant, id = 1:332) {
    # 'directory' is the location of the csv file
    # print(head(v))
    # 'pollutant' us the name of the pollutant "sulfate" or "nitrate"
    
    v1 <- c()
    for( thisId in id) {
        fileName <- file.path(directory, sprintf("%03d.csv", thisId), fsep = .Platform$file.sep)
        #print(fileName)
        data <- read.csv(fileName)
        v <- data[[pollutant]]
        v <- v[!is.na(v)]
        # print(v)
        v1 <- c(v1, v) # concatenate vectors
        #print(paste(length(v), length(v1)))
    }
    
    # return mean of pollunant across all monitors listed in the 'id' 
    #  vector (ignoring NA values)
    # NOTE: Do not round the result!
    mean(v1)    # reurn the mean
}


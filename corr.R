# corr - coursera R Programming Week 2 assignment 3

corr <- function(directory, threshold = 0) {
    ## 'directory' is the location of the csv file
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all variables)
    ## required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    retVec = c()  # create an empty vector
    class(retVec) <- "numeric"  # make the vector a of type "numeric"
    # class(retVec)
    dataFiles <- dir("specdata")
    for( thisFile in dataFiles) { # testing
        fileName <- file.path(directory, thisFile, fsep = .Platform$file.sep)
        data <- read.csv(fileName)
        # get rows where both nitrate and sulfawe are populed (are no NA)
        d2 <- data[!(is.na(data$nitrate) | is.na(data$sulfate)),]
        numRows <- nrow(d2)
        if(numRows > threshold) {
            retVec <- c(retVec, cor(d2$nitrate, d2$sulfate))
        }
    }
    retVec
}

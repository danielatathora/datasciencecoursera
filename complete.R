# complete.R - coursera R Programming Week 2 assignment 2

complete <- function(directory, id = 1:332) {
    # 'directory' is the location of the csv file
    # print(head(v))
    
    df = data.frame(id = numeric(0), nobs = numeric(0));
    
    for( thisId in id) {
        fileName <- file.path(directory, sprintf("%03d.csv", thisId), fsep = .Platform$file.sep)
        # print(fileName)
        data <- read.csv(fileName)
        # get rows where both nitrate and sulfawe are populed (are no NA)
        numRows <- nrow(data[!(is.na(data$nitrate) | is.na(data$sulfate)),])
        # add a new row rto the dataframe
        df[nrow(df) + 1,] = c(thisId, numRows)
    }
    
    # Return: where 'id' is the monitor ID and 'nobs' is the number of cases
    df
}


corr <- function(directory, threshold = 0) {
    ## directory is a character vector of length 1 indicating location of CSV files
    
    ## threshold is a number vector of length 1 indicating number of completely observed observations
    ## (on all variables) required to compute correlation between nitrate and sulfate; default is 0
    
    ## return a numeric vector of correlations - do not round!
    fileslist <- list.files(path = directory, pattern = ".csv", full.names = TRUE)  
    fset <- c(1:length(fileslist))
    okset <- fset [complete(directory, fset)[,2] > threshold]
    result <- numeric()
    
    for (i in okset) {
        data <-read.csv(fileslist[i])
        bdata <- !is.na(data)
        tdata <- data[bdata[,1]&bdata[,2]&bdata[,3]&bdata[,4],]
        result <- cbind(result, cor(tdata[,2], tdata[,3]))
    }
   
    as.vector(result)
}

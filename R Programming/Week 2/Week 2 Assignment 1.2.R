complete <- function(directory, id = 1:332) {
## return dataframe where nobs(number of complete cases) is given for every id
## complete.cases function return TRUE/FALSE values for complete cases - sum to get number of complete cases
## list.files(path = "", pattern = "", full.names = TRUE) 
    fileslist <- list.files(path = directory, pattern = ".csv", full.names = TRUE)  
    nobs <- numeric()
        for (i in id){
            data <- read.csv(fileslist[i])
            nobs <- c(nobs, sum(complete.cases(data)))
        }
    data.frame(id, nobs)
}

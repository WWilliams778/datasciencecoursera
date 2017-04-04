pollutantmean <- function(directory, pollutant, id=1:332) {
    #list of files
    pollutionfiles <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
    #empty data frame
    pollutiondata <- numeric()
    #create a for loop to go through list of files until id is found for (i in id)
    for(i in id) {
        tempdata <- read.csv(pollutionfiles[i], header = TRUE)
        pollutiondata <- c(pollutiondata,tempdata[[pollutant]])
        #find mean of the pollutant, removing NA values
        }
    mean(pollutiondata, na.rm = TRUE)
    }
# example  pollutantmean("~/Documents/DataScience/specdata/", "sulfate")


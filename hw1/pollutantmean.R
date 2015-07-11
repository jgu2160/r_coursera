pollutantmean <- function(directory, pollutant, id = 1:332) {
    setwd(directory)
    filenames = dir()[id]
    datalist = lapply(filenames, function(x){
                      read.csv(x, colClasses=c("NULL","numeric","numeric","NULL"))
    })
    df = do.call("rbind", datalist)
    polData = df[,pollutant]
    setwd("..")
    mean(polData[!is.na(polData)])
}


corr <- function(directory, threshold = 0) {
    print("Finding complete entries...")
    df = complete(directory)
    print("Found completes.")
    print("Calculating correlations...")
    aboveT = subset(df, df$nobs >= threshold)[[1]]
    setwd(directory)
    filenames = dir()[aboveT]
    completedData = lapply(filenames, function(x){
                           d = read.csv(x, colClasses=c("NULL","numeric","numeric","NULL"))
                           d[complete.cases(d),c("sulfate","nitrate")]
    })
    setwd("..")
    correlations = unlist(lapply(completedData, function(x) {
                          cor(x[1], x[2])
    }))
    print("Done.")
    correlations
}

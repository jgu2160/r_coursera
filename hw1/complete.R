complete <- function(directory, id = 1:332) {
    setwd(directory)
    filenames = dir()[id]
    completes = lapply(filenames, function(x){
                      sum(complete.cases(read.csv(x, colClasses=c("NULL","numeric","numeric","NULL"))))
    })
    setwd("..")
    data.frame(id=id, nobs=unlist(completes))
}

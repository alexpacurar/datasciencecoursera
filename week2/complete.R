complete <- function(directory, id = 1:332) {
  flag <- 0
  for (i in id) {
    if (i < 10 ){
      j <- paste('00',i,sep='')
    } else if (i < 100) {
      j <- paste('0',i,sep='')
    } else {
      j <- i
    }
    rdf <- read.csv(paste(directory, '/', j, '.csv', sep=''))
    rdf <- rdf[!is.na(rdf[2]),]
    rdf <- rdf[!is.na(rdf[3]),]
    if (flag == 0){
      out <- data.frame(id = i, nobs = length(rdf[,2]))
    } else {
      out <- rbind(out, data.frame(id = i, nobs=length(rdf[,2])))
    }
    flag <- 1
  }
  out
}  
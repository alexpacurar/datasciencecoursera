corr <- function(directory, threshold = 0) {
  out <- c(0)
  id = 1:332
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
    if (length(rdf[,2]) > threshold){
      if (flag == 0) {
        out <- rdf
        flag <- 1
      } else {
        out <- rbind(out,rdf)
      }
    }
  }
  if (flag == 0){
    out
  }else{
    cor(out[2],out[3])
  }
}
pollutantmean <- function(directory, pollutant, id = 1:332) {
  flag <- 0
  for (i in id) {
    if (i < 10 ){
      i <- paste('00',i,sep='')
    } else if (i < 100) {
      i <- paste('0',i,sep='')
    }
    rdf <- read.csv(paste(directory, '/', i, '.csv', sep=''))
    if (flag == 0){
      big <- rdf
    }else {
    big <- rbind(big,rdf)
    }
  }
  mean(big[,pollutant], na.rm=T)
}
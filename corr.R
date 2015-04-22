corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  library(stats)
  v_cor = vector()
  specdata_full <- list.files(directory, full.names=TRUE)
  for (i in 1:332){
    data <- read.csv(specdata_full[i])
    complete <- complete.cases(data[,2],data[,3])
    data <- data[complete,]
    if (nrow(data) > threshold){
      v_cor = c(v_cor,cor(data[,2],data[,3]))
    }
  }
  v_cor
}
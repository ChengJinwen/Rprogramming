complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  specdata_full <- list.files(directory, full.names=TRUE)
  v_id  = vector()
  v_nobs= vector()
  for (i in id) {
    data <- read.csv(specdata_full[i])
    complete <- complete.cases(data[,2],data[,3])
    data <- data[complete,]
    v_id  <- c(v_id,i)
    v_nobs <- c(v_nobs,nrow(data))
  }
  data_complete <- data.frame(id = v_id,nobs = v_nobs)
  data_complete
}
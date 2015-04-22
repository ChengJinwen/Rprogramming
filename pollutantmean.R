pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id'vector (ignoring NA values)
  specdata_full <- list.files(directory, full.names=TRUE)
  specdata_data <- data.frame()
  for (i in id) {
    specdata_data <- rbind(specdata_data, read.csv(specdata_full[i]))
  }
  if (pollutant == "sulfate"){
    datamean <- mean(specdata_data[,2],na.rm=TRUE)
  }else{
    datamean <- mean(specdata_data[,3],na.rm=TRUE)
  }
  datamean
}
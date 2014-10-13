loadAllHouseholdData <- function() {
  df <- read.delim('household_power_consumption.txt', sep=";", 
                   colClasses=c("character",
                                "character",
                                "numeric",
                                "numeric",
                                "numeric",
                                "numeric",
                                "numeric",
                                "numeric",
                                "numeric"),
                   na.strings=c('?'))
  
  # Convert date and time fields
  df$DateTime <- paste(df$Date, df$Time)
  df$DateTimeFormatted <- strptime(df$DateTime,format="%d/%m/%Y %H:%M:%S")
  
  return(df)
}

loadSubsetHouseholdData <- function() {
  retDF <- NULL
  df <- tryCatch ({
    print("attempting to load compiled data.frame from household_power_consumption.subset")
    retDF <- read.delim(paste(getwd(),'/','household_power_consumption.subset',sep=''),
                   sep=";",
                   colClasses=c("character",
                                "character",
                                "character",
                                "numeric",
                                "numeric",
                                "numeric",
                                "numeric",
                                "numeric",
                                "numeric",
                                "numeric",
                                "character"))
    retDF$DateTimeFormatted <- strptime(retDF$DateTime,format="%d/%m/%Y %H:%M:%S")
    return(retDF)
  }, warning=function(w) {
    print("household_power_consumption.subset does not exist, creating it now")
  }, error=function(err) {
    ## do nothing
  }, finally = {
    return(saveDataSubset(retDF))
  })
}

saveDataSubset <- function(df=NULL) {
  if (is.null(df)) {
    df <- loadAllHouseholdData()
  }
  
  dfSubset <- df[((df$DateTimeFormatted < '2007-02-03' 
                   & df$DateTimeFormatted >= '2007-02-01')
                  & !is.na(df$DateTimeFormatted)),]
  write.table(dfSubset,file="household_power_consumption.subset",sep=";")
  return(dfSubset)
}

resetPar <- function() {
  dev.new()
  op <- par(no.readonly = TRUE)
  dev.off()
  return(op)
}
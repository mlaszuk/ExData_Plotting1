source("loadFunctions.R")

makePlot2 <- function(df=NULL, includeKW=TRUE, fullSize=TRUE) {
  if (is.null(df)) {
    df <- loadSubsetHouseholdData()
  }
  
  ylabText<-"Global Active Power"
  if (includeKW) {
    ylabText<-"Global Active Power (kilowatts)"
  }
  
  if (fullSize) {
    par(pin=c(5.0,5.0), cex=0.8, mfrow=c(1,1))
  }

  plot(df$DateTimeFormatted, df$Global_active_power, 
       xlab="", ylab=ylabText,
       type="l")
  dev.copy(png,file="plot2.png")  
  dev.off()
}
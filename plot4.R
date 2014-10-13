source("plot2.R")
source("plot3.R")

makePlot4 <- function(df=NULL) {
  if (is.null(df)) {
    df <- loadSubsetHouseholdData()
  }
  
#  op <- par(no.readonly = TRUE)
#  par(op)
  par(mfrow=c(2,2), cex=0.7, pin=c(2.1,2.1))  
  makePlot2(df, includeKW=FALSE, fullSize=FALSE)
  plot(df$DateTimeFormatted, df$Voltage, type="l", xlab="datetime", ylab="Voltage")
  makePlot3(df, legendBox="n", fullSize=FALSE)
  plot(df$DateTimeFormatted, df$Global_reactive_power,type="l", xlab="datetime", ylab="Global_reactive_power")
  dev.copy(png,file="plot4.png")  
  dev.off()
}

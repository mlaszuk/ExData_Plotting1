source("loadFunctions.R")

makePlot3 <- function(df=NULL, legendBox="o", fullSize=TRUE) {
  if (is.null(df)) {
    df <- loadSubsetHouseholdData()
  }
  
  if (fullSize) {
    par(pin=c(5.0,5.0), mfrow=c(1,1))
  }
  
  plot(df$DateTimeFormatted, df$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
  lines(df$DateTimeFormatted, df$Sub_metering_2, col="red")
  lines(df$DateTimeFormatted, df$Sub_metering_3, col="blue")
  legend("topright", col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, bty=legendBox,
         xjust=1)
  dev.copy(png,file="plot3.png")  
  dev.off()
}

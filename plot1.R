source("loadFunctions.R")

makePlot1 <- function(df=NULL) {
  if (is.null(df)) {
    df <- loadSubsetHouseholdData()
  }
  
  par(mfrow=c(1,1),pin=c(5,5), cex=0.8)
  hist(df$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
  dev.copy(png,file="plot1.png")  
  dev.off()
}

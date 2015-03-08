
con <-file("household_power_consumption.txt","r")

startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")

result =read.table(con, header=TRUE, sep=";", na.strings="?",
                   colClasses=c('character','character',rep('numeric',7)) ) 
close(con)

resultSub <- result[as.Date(result$Date,format="%d/%m/%Y")>= startDate & 
                    as.Date(result$Date,format="%d/%m/%Y")<= endDate,]

resultSub[resultSub=="?"] = NA

resultSub2 <- resultSub

resultSub2 <- cbind(resultSub, as.POSIXct(paste(resultSub$Date, resultSub$Time), format="%d/%m/%Y %H:%M:%S"))

names(resultSub2)[10] <- "TimeObs"

png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
     bg = "white",  res = NA)

with(resultSub2, plot(resultSub2$TimeObs, resultSub2$Sub_metering_1, type = "n", xlab = " ", ylab="Energy Sub Metering"))
with(resultSub2, lines(resultSub2$TimeObs, resultSub2$Sub_metering_1, col="black"))
with(resultSub2, lines(resultSub2$TimeObs, resultSub2$Sub_metering_2, col="red"))
with(resultSub2, lines(resultSub2$TimeObs, resultSub2$Sub_metering_3, col="blue"))
legend("topright", pch=1, col = c("black","red","blue"),
             legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
 
dev.off()

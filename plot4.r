
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

png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
     bg = "white",  res = NA)

par(mfrow = c(2,2))
par(mar=c(4,4,2,1)) 
par(oma=c(0,2,2,0))

with(resultSub2, 
     plot(resultSub2$TimeObs, resultSub2$Global_active_power, type='l',
          cex.axis=0.5, cex.lab=0.5,
          ylab="Global Active Power (kilowatts)",xlab="",
          xlim = c(min(resultSub2$TimeObs),max(resultSub2$TimeObs)), 
          ylim = c(min(resultSub2$Global_active_power), max(resultSub2$Global_active_power)) ))
with(resultSub2, 
     plot(resultSub2$TimeObs, resultSub2$Voltage, type='l', 
          xlab="Datetime ", ylab="Voltage",cex.axis=0.5,cex.lab=0.5,
          xlim = c(min(resultSub2$TimeObs),max(resultSub2$TimeObs)), 
          ylim = c(min(resultSub2$Voltage), max(resultSub2$Voltage)) ))


with(resultSub2, plot(resultSub2$TimeObs, resultSub2$Sub_metering_1, type = "n",
                      xlab = " ", ylab="Energy Sub Metering", cex.axis=0.5, cex.lab=0.5))
with(resultSub2, lines(resultSub2$TimeObs, resultSub2$Sub_metering_1, col="black", cex.axis=0.5,cex.lab=0.5))
with(resultSub2, lines(resultSub2$TimeObs, resultSub2$Sub_metering_2, col="red", cex.axis=0.5,cex.lab=0.5))
with(resultSub2, lines(resultSub2$TimeObs, resultSub2$Sub_metering_3, col="blue", cex.axis=0.5,cex.lab=0.5))
legend("topright", pch=1, col = c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.3)

with(resultSub2, 
     plot(resultSub2$TimeObs, resultSub2$Global_reactive_power, type='l', cex.axis=0.5,cex.lab=0.5,
          xlab="Datetime ", ylab="Global_reactive_power",
          xlim = c(min(resultSub2$TimeObs),max(resultSub2$TimeObs)), 
          ylim = c(min(resultSub2$Global_reactive_power), max(resultSub2$Global_reactive_power)) ))

dev.off()
 
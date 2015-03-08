
con <-file("household_power_consumption.txt","r")

startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")

result =read.table(con, header=TRUE, sep=";", na.strings="?",
                   colClasses=c('character','character',rep('numeric',7)) ) 
close(con)

resultSub <- result[as.Date(result$Date,format="%d/%m/%Y")>= startDate & 
                    as.Date(result$Date,format="%d/%m/%Y")<= endDate,]
// Change ? to NAs

resultSub[resultSub=="?"] = NA

// combine date & time

resultSub2 <- resultSub

resultSub2 <- cbind(resultSub, as.POSIXct(paste(resultSub$Date, resultSub$Time), format="%d/%m/%Y %H:%M:%S"))

// rename the newly created column (the 10th column)

names(resultSub2)[10] <- "TimeObs"

//plot time series data

png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
     bg = "white",  res = NA)
 
with(resultSub2, 
      plot(resultSub2$TimeObs, resultSub2$Global_active_power, type='l',
                xlab=" ", ylab="Global Active Power (kilowatts)",
                xlim = c(min(resultSub2$TimeObs),max(resultSub2$TimeObs)), 
                ylim = c(min(resultSub2$Global_active_power), max(resultSub2$Global_active_power)) ))
dev.off() 
 


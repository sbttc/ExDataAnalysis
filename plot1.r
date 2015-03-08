

con <-file("household_power_consumption.txt","r")

startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")

result =read.table(con, header=TRUE, sep=";", na.strings="?",
                   colClasses=c('character','character',rep('numeric',7)) ) 
close(con)

resultSub <- result[as.Date(result$Date,format="%d/%m/%Y")>= startDate & 
                    as.Date(result$Date,format="%d/%m/%Y")<= endDate,]

par(cex=1)
par(cex.lab=0.75)
par(cex.main=1)

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
     bg = "white",  res = NA)

with(resultSub, hist(Global_active_power, col= "red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
ticks = c(200, 400, 600,800,1000,1200)

axis(side=2, at=ticks)

dev.off()

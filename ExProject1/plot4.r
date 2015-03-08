house <-read.table("household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors=FALSE)

## subset table
house1 <-house[,1]=="1/2/2007"
house1_2007 <-house[house1,]
house2 <-house[,1]=="2/2/2007"
house2_2007 <-house[house2,]

house_2007 <-data.frame(rbind(house1_2007,house2_2007))

dates <-house_2007[,1]
times <-house_2007[,2]
dt <-paste(dates,times)

mydt <-strptime(dt, "%d/%m/%Y %H:%M:%S")
mydate <- format(mydt, "%a %d/%m/%Y %H:%M:%S")
dat <- strptime(mydate, "%a %d/%m/%Y %H:%M:%S")

gp <-as.numeric(house_2007[,3])
glo <-as.numeric(house_2007[,4])
vol <-as.numeric(house_2007[,5])
met1 <-as.numeric(house_2007[,7])
met2 <-as.numeric(house_2007[,8])
met3 <-as.numeric(house_2007[,9])

## make plot4

par(mfrow=c(2,2), mar=c(4,4,2,1))
plot(dat, gp, type="l", xlab="", ylab="Global Active Power (kilowatts)",cex=0.8)
plot(dat, vol, type="l",xlab="Datetime", ylab="Voltage")

plot(dat, met1, type="n", xlab="", ylab="Energy sub metering")
with(house_2007,lines(dat,met1))
with(house_2007,lines(dat,met2,col="red"))
with(house_2007,lines(dat,met3, col="blue"))

legend("topright", cex=0.8, bty="n", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


plot(dat,glo, type="l",xlab="Datetime", ylab="Global_reactive_power (kilowatts)")

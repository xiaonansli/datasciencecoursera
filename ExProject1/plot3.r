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

met1 <-as.numeric(house_2007[,7])
met2 <-as.numeric(house_2007[,8])
met3 <-as.numeric(house_2007[,9])

gd <- strptime(mydate, "%a %d/%m/%Y %H:%M:%S")

## make plot3
par(mar=c(4,4,2,1))
plot(gd, met1, type="n", xlab="", ylab="Energy sub metering")
with(house_2007,lines(gd,met1))
with(house_2007,lines(gd,met2,col="red"))
with(house_2007,lines(gd,met3, col="blue"))

legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


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

gp <-as.numeric(house_2007[,3])
gd <- strptime(mydate, "%a %d/%m/%Y %H:%M:%S")

## make plot2

plot(gd, gp, type="l", xlab="", ylab="Global Active Power (kilowatts)")


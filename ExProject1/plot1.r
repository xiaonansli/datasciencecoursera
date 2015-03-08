
house <-read.table("household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors=FALSE)
house1 <-house[,1]=="1/2/2007"
house1_2007 <-house[house1,]
house2 <-house[,1]=="2/2/2007"
house2_2007 <-house[house2,]

house_2007 <-data.frame(rbind(house1_2007,house2_2007))


gp <-as.numeric(house_2007[,3])


## make plot1

hist(gp,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")


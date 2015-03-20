## read data
nei <-readRDS("summarySCC_PM25.rds")
scc <-readRDS("Source_Classification_Code.rds")


##subsetting the data
## use sapply conmand to seprate this dataframe as groups 
## with year
      
#laaply(object, function,arguments)
#split(object,factor)
    fac <-factor(nei$year)  
    year <-levels(fac)

    sp<-split(nei[,4],nei$year)
    pm25<-sapply(sp, sum)
    pm25_ytotal <-c(pm25[[1]],pm25[[2]],pm25[[3]],pm25[[4]])


plot(year, pm25_ytotal, main="US PM2.5 Emissions", xlab="Year", ylab="US Year Total Emission PM2.5 (tons)")

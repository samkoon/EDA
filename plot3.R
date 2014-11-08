library(lubridate)
## Read dataset, convert the Date field to Date data type and subset the required Date
mydata <-read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep=";" ,na.strings="?", header=T)
mydata$Date<-dmy(mydata$Date)
df<-subset(mydata, Date == dmy("01/02/2007") | Date == dmy("02/02/2007"))

df$DateTime <- paste(df$Date,df$Time)
df$DateTime <- ymd_hms(df$DateTime)

## Plot 3
with(df, {
     plot(Sub_metering_1~DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
     lines(Sub_metering_2~DateTime,col='Red')
     lines(Sub_metering_3~DateTime,col='Blue')
})

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()



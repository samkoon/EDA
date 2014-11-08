library(lubridate)
## Read dataset, convert the Date field to Date data type and subset the required Date
mydata <-read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep=";" ,na.strings="?", header=T)
mydata$Date<-dmy(mydata$Date)
df<-subset(mydata, Date == dmy("01/02/2007") | Date == dmy("02/02/2007"))

df$DateTime <- paste(df$Date,df$Time)
df$DateTime <- ymd_hms(df$DateTime)

## Plot 2
plot(df$Global_active_power~df$DateTime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)


library(lubridate)
## Read dataset, convert the Date field to Date data type and subset the required Date
mydata <-read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep=";" ,na.strings="?", header=T)
mydata$Date<-dmy(mydata$Date)
df<-subset(mydata, Date == dmy("01/02/2007") | Date == dmy("02/02/2007"))

## Plot 1
hist(df$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


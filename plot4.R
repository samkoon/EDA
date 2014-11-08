library(lubridate)
## Read dataset, convert the Date field to Date data type and subset the required Date
mydata <-read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep=";" ,na.strings="?", header=T)
mydata$Date<-dmy(mydata$Date)
df<-subset(mydata, Date == dmy("01/02/2007") | Date == dmy("02/02/2007"))

df$DateTime <- paste(df$Date,df$Time)
df$DateTime <- ymd_hms(df$DateTime)

## Plot 4
par(mfrow=c(2,2))
with(df, {
    plot(Global_active_power~DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~DateTime, type="l", ylab="Voltage (volt)", xlab="")
    plot(Sub_metering_1~DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~DateTime,col='Red')
    lines(Sub_metering_3~DateTime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~DateTime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()



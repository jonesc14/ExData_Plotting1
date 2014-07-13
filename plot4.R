data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings=c("?"))
data<-data[data$Date=="2/2/2007" | data$Date=="1/2/2007",]
nrows<-nrow(data)
x<-1:nrows
# open PNG device; create file in current directory
png("plot4.png")
# Plot 4 graphs 2x2
par(mfrow=c(2,2))
# plot [1,1]
plot(1:nrow(data),data$Global_active_power,type="l", ylab="Global Active Power", xlab="", xaxt='n')
axis(side=1,at=c(1, nrows/2+1, nrows+1),labels=c("Thu","Fri","Sat"))
# plot [1,2]
with(data, plot(1:nrow(data),Voltage,type="l", xlab="", xaxt='n'))
axis(side=1,at=c(1, nrows/2+1, nrows+1),labels=c("Thu","Fri","Sat"))
# Add text to margin, size seemed too big so reduce size to 75%
mtext("datetime", side=1, line=3, cex=.75)
# plot [2,1]
plot(x,data$Sub_metering_1,type="n", ylab="Energy sub metering", xlab="", xaxt='n')
axis(side=1,at=c(1, nrows/2+1, nrows+1),labels=c("Thu","Fri","Sat"))
points(x, data$Sub_metering_1,type='l', col="black")
points(x, data$Sub_metering_2,type="l", col="red")
points(x, data$Sub_metering_3,type="l", col="blue")
# Add legend with no border
legend('topright', lwd=1, bty="n", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# plot [2,2]
with(data, plot(x, Global_reactive_power,type="l",xlab="", xaxt='n'))
axis(side=1,at=c(1, nrows/2+1, nrows+1),labels=c("Thu","Fri","Sat"))
# Add text to margin, size seemed too big so reduce size to 75%
mtext("datetime", side=1, line=3, cex=.75)
# Close the PNG device
dev.off()

# Reproduce Plot 3
# read in data (missing values are coded as ?)
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings=c("?"))
# use data from the dates 2007-02-01 and 2007-02-02
data<-data[data$Date=="2/2/2007" | data$Date=="1/2/2007",]
nrows<-nrow(data)
# define x
x<-1:nrows
# open PNG device; create file in current directory
png("plot3.png")
# set up plot using variable with max y value (Sub_metering_1)
plot(x,data$Sub_metering_1,type="n", ylab="Energy sub metering", xlab="", xaxt='n')
# plot Sub_metering_1
points(x, data$Sub_metering_1,type='l', col="black")
# plot Sub_metering_2
points(x, data$Sub_metering_2,type="l", col="red")
# plot Sub_metering_3
points(x, data$Sub_metering_3,type="l", col="blue")
# label datetime with day of the week
axis(side=1,at=c(1, nrows/2+1, nrows+1),labels=c("Thu","Fri","Sat"))
# add legend
legend('topright', lwd=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# Close the PNG device
dev.off()

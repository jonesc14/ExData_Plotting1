# Reproduce Plot 2
# read in data (missing values are coded as ?)
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings=c("?"))
# use data from the dates 2007-02-01 and 2007-02-02
data<-data[data$Date=="2/2/2007" | data$Date=="1/2/2007",]
nrows<-nrow(data)
# define x
x<-1:nrows
# open PNG device; create file in current directory
png("plot2.png")
# plot Global Active Power
plot(x,data$Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab="", xaxt='n')
# label datetime with day of the week
axis(side=1,at=c(1, nrows/2+1, nrows+1),labels=c("Thu","Fri","Sat"))
# Close the PNG device
dev.off()

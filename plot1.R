# Reproduce Plot 1
# read in data (missing values are coded as ?)
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings=c("?"))
# use data from the dates 2007-02-01 and 2007-02-02
data<-data[data$Date=="2/2/2007" | data$Date=="1/2/2007",]
# open PNG device; create file in current directory
png("plot1.png")
# plot frequency of Global active power using histogram specifying title and x label
with(data, hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
# Close the PNG device
dev.off()

#Reading data
data <- read.table("./eda/household_power_consumption.txt",header = TRUE,sep = ";",na.strings= "?")
datatest <- data
data[,1] <- as.character(data[,1])
data[,2] <- as.character(data[,2])
#Cleaning data
targetdate <- c("1/2/2007","2/2/2007")
ndata <- subset(data, data[,1] %in% targetdate)
ndata <- na.omit(ndata)
ndata[,10] <- paste(ndata[,1],ndata[,2])
names(ndata)[10] <- "Paste"
DT <- strptime(ndata[,10], "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME","C")

#plot3
png(filename = "plot3.png",width = 480, height = 480)
plot(DT, ndata[,7], xlab="",ylab= "Energy sub metering",type= "l")
lines(DT, ndata[,8], col = "red")
lines(DT,ndata[,9],col = "blue")
legend("topright", col = c("black", "red", "blue"), lty= "solid", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
dev.off()
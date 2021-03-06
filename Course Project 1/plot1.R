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

#plot1
png(filename = "plot1.png",width = 480, height = 480)
hist(ndata[,3],cex.axis=1,
     main = "Global Active Power",xlab="Global Active Power(kilowatts)",
     ylab="Frequency",lty=1,col="red")
dev.off()

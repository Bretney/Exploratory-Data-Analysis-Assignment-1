#B.Anthony
setwd("~/exdata-data-household_power_consumption")
# Used to set the working directory
dt=read.csv('household_power_consumption.txt',header=T, sep=';')
# Used to read the textfile which is formatted as a csv
dt$Datetime = paste(as.character(dt[,1]) , dt[,2])  
# Used to merge date and time into single column 
dt[,1]=as.Date(dt$Date,'%d/%m/%Y') 
dt = subset(dt, Date == '2007-02-01' | Date == '2007-02-02') 
# Used to convert the Dat column data and select only the two required days
dt[,3] = as.numeric(as.character(dt[,3])) 
# Used to convert the Global Active Power's data 

#Creating plot 1
png('plot1.png',width=480,height=480)
hist(dt[,3],col='red',xlab='Global Active Power (kilowatts)', ylab='Frequency',main='Global Active Power')
dev.off()

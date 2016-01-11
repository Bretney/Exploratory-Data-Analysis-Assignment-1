setwd("~/exdata-data-household_power_consumption") #Setting directory
dt=read.csv('household_power_consumption.txt',header=T, sep=';') 
dt$Datetime = paste(as.character(dt[,1]) , dt[,2])  
# Same as plot1 , in which this code is used to merge the date and the time 
dt[,1]=as.Date(dt$Date,'%d/%m/%Y') 
# Used to convert the date data column's data to only take 2 days
dt = subset(dt, Date == '2007-02-01' | Date == '2007-02-02') 
dt[,3] = as.numeric(as.character(dt[,3])) 
# Used to convert the Global Active Power's data
dt$dt <- strptime(dt$Datetime, '%d/%m/%Y %H:%M') 


#Creating plot 2
png('plot2.png',width=480,height=480)
plot(dt$dt,dt$Global_active_power,ylab='Global Active Power (kilowatts)',xlab='',type='line')
dev.off()
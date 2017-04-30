library(dplyr)

#read in data
df = read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)

#filter for data we need
df = filter(df, df$Date == '1/2/2007' | df$Date == '2/2/2007')

#covert needed data to numeric
df$Global_active_power = as.numeric(df$Global_active_power)
df$Voltage = as.numeric(df$Voltage)
df$Global_reactive_power = as.numeric(df$Global_reactive_power)

#create datetime column
df$myDateTime <- with(df, as.POSIXct(paste(df$Date,df$Time), format = "%d/%m/%Y %H:%M:%S"))

#plot it out to and save to png
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
with(df, {
  plot(x = df$myDateTime, y = df$Global_active_power,type = 'l', xlab = '', ylab = 'Global Active Power')
  plot(x = df$myDateTime, y = df$Voltage,type = 'l', xlab = 'datetime', ylab = 'Voltage')  
  plot(x = df$myDateTime, y = df$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering', col = 'Black')
    points(x = df$myDateTime, y = df$Sub_metering_2, type = 'l', col = 'Red')
    points(x = df$myDateTime, y = df$Sub_metering_3, type = 'l', col = 'Blue')
    legend("topright", pch = '_', col = c('black','red','blue'), legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
  plot(x = df$myDateTime, y = df$Global_reactive_power,type = 'l', xlab = 'datetime', ylab = 'Global_reactive_power')    
})
dev.off()



library(dplyr)

#read in data
df = read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)

#filter for data we need
df = filter(df, df$Date == '1/2/2007' | df$Date == '2/2/2007')

#covert global active power to numeric
df$Global_active_power = as.numeric(df$Global_active_power)

#create datetime column
df$myDateTime <- with(df, as.POSIXct(paste(df$Date,df$Time), format = "%d/%m/%Y %H:%M:%S"))

#plot it out to and save to png
png("plot2.png", width=480, height=480)
plot(x = df$myDateTime, y = df$Global_active_power,type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.off()


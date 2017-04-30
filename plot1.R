library(dplyr)

#read in data
df = read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)

#filter for data we need
df = filter(df, df$Date == '1/2/2007' | df$Date == '2/2/2007')

#covert global active power to numeric
df$Global_active_power = as.numeric(df$Global_active_power)

#plot it out to and save to png
png("plot1.png", width=480, height=480)
hist(df$Global_active_power,xlab = 'Global Active Power (kilowatts)',main = 'Global Active Power', col='Red')
dev.off()
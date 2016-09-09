##Prep by reading in large file, then creating a subset
## remove the large data frame and work with the small one

power <- read.table("hh_power_cons.txt", header=T, sep=";")
str(power)
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

df <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
str(df)
rm(power)

df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

## Plot 1

plot1 <- function() {
  hist(df$Global_active_power, main ="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()



plot()

## Send Message that file is in my repository folder
cat("plot1.png has been saved in", getwd())

}
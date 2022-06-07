# Reading the data
file_name <- "data/household_power_consumption.txt"
datos <- read.table(file_name, header = TRUE, sep = ";", dec = ".", na.strings = "?")

#subset the data from the dates 2007-02-01 and 2007-02-02
new_datos <- datos[datos$Date %in% c("1/2/2007", "2/2/2007"),]


#converting data
Sys.setlocale("LC_TIME", "English")
#Create vector time
date_conver <- as.Date(new_datos[,1], format = "%d/%m/%Y")
time_conver <- strptime(new_datos[,2], format = "%H:%M:%S")
time_vector <- as.POSIXct(paste(date_conver, new_datos[,2]))


#making plot 4
png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

plot(time_vector, new_datos[,3], xlab = "", ylab = "Global Active Power (kw)", type="l")
plot(time_vector, new_datos[,5], xlab = "Datetime", ylab = "Voltage", type = "l")
plot(time_vector, new_datos[,7], xlab = "", ylab = "Energy sub metering", type = "l")
lines(time_vector, new_datos[,8], col = "red")
lines(time_vector, new_datos[,9], col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), cex=0.8, lty = 1, bty = "n")


plot(time_vector, new_datos[,4], xlab = "datetime", ylab = "Global_reactive_power", "l")

dev.off()

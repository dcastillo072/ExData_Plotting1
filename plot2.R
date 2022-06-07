# Reading the data
file_name <- "data/household_power_consumption.txt"
datos <- read.table(file_name, header = TRUE, sep = ";", dec = ".", na.strings = "?")
new_datos <- datos[datos$Date %in% c("1/2/2007", "2/2/2007"),]

#converting data
Sys.setlocale("LC_TIME", "English")

#Create vector time
date_conver <- as.Date(new_datos[,1], format = "%d/%m/%Y")
time_conver <- strptime(new_datos[,2], format = "%H:%M:%S")
time_vector <- as.POSIXct(paste(date_conver, new_datos[,2]))

#making plot 2
png("plot2.png", width = 480, height = 480)
plot(time_vector, new_datos[,3], xlab="", ylab="Global Active Power (Kw)", type="l")
dev.off()
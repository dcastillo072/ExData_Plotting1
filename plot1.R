# Reading the data
file_name <- "data/household_power_consumption.txt"
datos <- read.table(file_name, header = TRUE, sep = ";", dec = ".", na.strings = "?")

#exploring data
head(datos)
tail(datos)
dim(datos)  #test for 2075259 rows

#subset the data from the dates 2007-02-01 and 2007-02-02
new_datos <- datos[datos$Date %in% c("1/2/2007", "2/2/2007"),]
head(new_datos) #checking the subset 
tail(new_datos)


#making plot 1
png("plot1.png", width = 480, height = 480)

hist(new_data[,3], col="red", main = "Global Active Power",
     xlab = "GLobal Active Power (kw)")

dev.off()

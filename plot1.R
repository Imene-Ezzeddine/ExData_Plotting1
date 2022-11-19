#reading and subseting data
file <- "C:/Users/dell/Downloads/exploratory_data_analysis/household_power_consumption.txt"
PCDF<-read.table(file, header = TRUE, sep = ";", na.strings = "?")
strptime(PCDF$Time, format = "%H:%M:%S")
as.Date(PCDF$Date, "%d/%m/%Y")
PCDF_sub <- subset(PCDF, Date %in% c("1/2/2007","2/2/2007"))
#plotting plot 1
png(file="C:/Users/dell/Downloads/exploratory_data_analysis/plot1.png",
    width=480, height=480)
hist(PCDF_sub$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     main = "Global Active Power")
dev.off()
#reading and subseting data
file <- "C:/Users/dell/Downloads/exploratory_data_analysis/household_power_consumption.txt"
PCDF<-read.table(file, header = TRUE, sep = ";", na.strings = "?")
strptime(PCDF$Time, format = "%H:%M:%S")
as.Date(PCDF$Date, "%d/%m/%Y")
PCDF_sub <- subset(PCDF, Date %in% c("1/2/2007","2/2/2007"))
#plotting plot 2
png(file="C:/Users/dell/Downloads/exploratory_data_analysis/plot2.png",
    width=480, height=480)
format <- "%d/%m/%Y %H:%M:%S"
PCDF_sub$date_time<-as.POSIXct(paste(PCDF_sub$Date, PCDF_sub$Time), format=format)
library(lubridate)
PCDF_sub$date_time<-as_datetime(PCDF_sub$date_time)
PCDF_sub$date_time<- ymd_hms(PCDF_sub$date_time)
library(ggplot2)
p <- ggplot(PCDF_sub, aes(x=date_time, y=Global_active_power)) +
  geom_line()+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank())+
  ylab("Global Active Power (kilowatts)")+
  xlab(" ")
p
p+scale_x_datetime(date_breaks= "1 day",date_labels = "%a")
dev.off()
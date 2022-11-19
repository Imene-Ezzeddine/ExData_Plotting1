#reading and subseting data
file <- "C:/Users/dell/Downloads/exploratory_data_analysis/household_power_consumption.txt"
PCDF<-read.table(file, header = TRUE, sep = ";", na.strings = "?")
strptime(PCDF$Time, format = "%H:%M:%S")
as.Date(PCDF$Date, "%d/%m/%Y")
PCDF_sub <- subset(PCDF, Date %in% c("1/2/2007","2/2/2007"))
#plotting plot 3
png(file="C:/Users/dell/Downloads/exploratory_data_analysis/plot3.png",
    width=480, height=480)
format <- "%d/%m/%Y %H:%M:%S"
PCDF_sub$date_time<-as.POSIXct(paste(PCDF_sub$Date, PCDF_sub$Time), format=format)
library(lubridate)
PCDF_sub$date_time<-as_datetime(PCDF_sub$date_time)
PCDF_sub$date_time<- ymd_hms(PCDF_sub$date_time)
library(ggplot2)
library(tidyr)
longer_data <- PCDF_sub %>%
  pivot_longer(Sub_metering_1:Sub_metering_3, names_to = "sub_metering", values_to = "value")
print(longer_data)
p <- ggplot(longer_data, aes(x=date_time, y=value, colour=sub_metering)) +
  geom_line()+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        legend.position = c(1, 1),
        legend.justification = c("right", "top"),
        panel.border = element_rect(colour = "black", fill=NA),
        legend.title = element_blank(),
        aspect.ratio = 0.75, axis.text = element_text(colour = 1, size = 6),
        legend.background = element_blank(),
        legend.box.background = element_rect(colour = "black"))+
  ylab("Energy sub metering")+
  xlab(" ")
p
p+ scale_color_manual(
  values = c(
    Sub_metering_1="black",
    Sub_metering_2= "red",
    Sub_metering_3="blue"
  )) +scale_x_datetime(date_breaks= "1 day",date_labels = "%a")
dev.off()
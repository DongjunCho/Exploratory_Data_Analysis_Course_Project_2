#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
library("ggplot2")
setwd("C:/Users/dongj/Desktop/R_data_Desk/Exploratory_Data_Analysis/Project_2")

NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")
#similar to plot4 but plot4 extract "coal" data
#plot5 extract "vehicle" data

#Extract "vehicle" data
vehicle_filter <- SCC[grep("vehicle",SCC$Short.Name,ignore.case = TRUE),"SCC"]
NEI_vehicle<-  NEI[NEI$SCC %in% vehicle_filter,]
png("plot5.png", width=480, height=480)
g<-ggplot(NEI_vehicle,aes(year,Emissions))
g+geom_bar(stat = "summary")+ labs(y="Emissions from motor vehicle sources in Baltimore City",x="Years (1999 - 2008)")


dev.off()
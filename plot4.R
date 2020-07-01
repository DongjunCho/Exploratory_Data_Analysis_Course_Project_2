#Across the United States, 
#how have emissions from coal combustion-related sources changed from 1999-2008?

library("ggplot2")
setwd("C:/Users/dongj/Desktop/R_data_Desk/Exploratory_Data_Analysis/Project_2")

NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

#coal combustion-related sources
#Extract "coal" and "combustion" data
coal_filter <- SCC[grep("coal",SCC$Short.Name,ignore.case = TRUE),"SCC"]
NEI_coal<-  NEI[NEI$SCC %in% coal_filter,]
png("plot4.png", width=480, height=480)
g<-ggplot(NEI_coal,aes(year,Emissions))
g+geom_bar(stat = "summary")+ labs(y="Emissions from coal combustion-related sources",x="Year (1999 - 2008)")


dev.off()

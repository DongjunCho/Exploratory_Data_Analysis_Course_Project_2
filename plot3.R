#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
#Which have seen increases in emissions from 1999-2008?
#Use the ggplot2 plotting system to make a plot answer this question.
library("ggplot2")
setwd("C:/Users/dongj/Desktop/R_data_Desk/Exploratory_Data_Analysis/Project_2")

NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

baltimore <- with(NEI, subset(NEI, fips=="24510"))
#sum <- aggregate(Emissions~year+type,baltimore, sum)

png("plot3.png", width=480, height=480)

#Use the ggplot2 plotting system
g<-ggplot(baltimore,aes(year,Emissions,color=type))
g+geom_line(stat = "summary",fun.y="sum")+ labs(y="Emissions for Baltimore City ",x="Year (1999 - 2008)")
dev.off()
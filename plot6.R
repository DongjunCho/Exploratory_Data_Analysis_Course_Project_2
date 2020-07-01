#Compare emissions from motor vehicle sources in Baltimore City 
# with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?

library("ggplot2")
setwd("C:/Users/dongj/Desktop/R_data_Desk/Exploratory_Data_Analysis/Project_2")

NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

NEI_baltimore <- subset(NEI,(NEI$fips == "24510") & (type == "ON-ROAD"))
NEI_la <- subset(NEI,(NEI$fips == "06037") & (type == "ON-ROAD"))

#aggregate
Baltimore<- aggregate( NEI_baltimore$Emissions, by = list(year = NEI_baltimore$year), FUN = sum)
names(Baltimore) <- c("year", "Emissions")
Baltimore$City <- "Baltimore"

la <- aggregate( NEI_la$Emissions, by = list(year = NEI_la$year), FUN = sum)
names(la) <- c("year", "Emissions")
la$City <- "LosAngeles"
total <- rbind(Baltimore, la)

#create the plot
library("ggplot2")
png('plot6.png', width=480,height=480)

ggp <- ggplot(total, aes(x=factor(year), y=Emissions, fill=City))
ggp + geom_bar(stat = "identity", position=position_dodge()) + labs(x = "years (1999-2008)", y = "Motor Vehicle Source Emissions in Baltimore & LA")

dev.off()





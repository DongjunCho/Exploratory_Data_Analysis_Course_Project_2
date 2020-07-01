#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.


setwd("C:/Users/dongj/Desktop/R_data_Desk/Exploratory_Data_Analysis/Project_2")

NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

#total emissions from PM2.5  in the United States from 1999 to 2008
total<-with(NEI,tapply(Emissions,year,sum))
print(total)
#1999    2002    2005    2008 
#7332967 5635780 5454703 3464206 

png("plot1.png", width=480, height=480)

#Using the base plotting system
barplot(total, xlab ="Years (1999 - 2008)", ylab="Emissions",
        main= "Total Emissions in US")

dev.off()


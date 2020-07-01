#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.


setwd("C:/Users/dongj/Desktop/R_data_Desk/Exploratory_Data_Analysis/Project_2")

NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

baltimore <- with(NEI, subset(NEI, fips=="24510"))
total <- with(baltimore, tapply(Emissions, year, sum))
print(total)
#1999     2002     2005     2008 
#3274.180 2453.916 3091.354 1862.282 

png("plot2.png", width=480, height=480)

#Using the base plotting system
barplot(total, xlab ="Years (1999 - 2008)", ylab="Emissions",
        main= "Total Emissions in Baltimore City, MaryLand")

dev.off()
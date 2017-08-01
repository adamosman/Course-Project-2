# Sets the working directory
setwd("~/Desktop/Course Project 2/exdata%2Fdata%2FNEI_data/")
# Reads in the data and subsets it for Baltimore County. It then calculates 
# the sum of the total emissions for each year
NEI <- readRDS("summarySCC_PM25.rds")
bmore <- subset(NEI, fips == "24510")
total <- aggregate(Emissions ~ year, data = bmore, FUN = sum)
# Plots total emissions using the base plot and saves it to a PNG
png("plot2.png")
plot(total, 
     xlab = "Year",
     ylab = expression("Total PM"[2.5]*" Emissions (tons)"),
     main = expression("Total PM"[2.5]*" Emissions in Baltimore City"),
     type = "o")
dev.off()
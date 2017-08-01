# Sets the working directory
setwd("~/Desktop/Course Project 2/exdata%2Fdata%2FNEI_data/")
# Reads in the data and calculates the sum of the total emissions for each year
NEI <- readRDS("summarySCC_PM25.rds")
total <- aggregate(Emissions ~ year , data = NEI, FUN = sum)
# Plots total emissions using the base plot and saves it to a PNG
png("plot1.png")
plot(total, 
     xlab = "Year",
     ylab = expression("Total PM"[2.5]*" Emissions (tons)"),
     main = expression("Total PM"[2.5]*" Emissions in the United States"),
     type = "o")
dev.off()
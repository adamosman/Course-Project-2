# Sets the working directory and loads ggplot2
library(ggplot2)
setwd("~/Desktop/Course Project 2/exdata%2Fdata%2FNEI_data/")
# Reads in the data and subsets it for Baltimore County. It then calculates 
# the sum of the total emissions based on source type for each year.
NEI <- readRDS("summarySCC_PM25.rds")
bmore <- subset(NEI, fips == "24510")
# Plots total emissions using the base plot and saves it to a PNG
ggplot(bmore, aes(x = year, y = Emissions, color = type)) +
    geom_point(stat = "summary", fun.y = sum) +
    geom_line(stat = "summary", fun.y = sum) +
    labs(title = expression("Total PM"[2.5]*" Emissions in Baltimore by Source Type"),
         y = expression("Total PM"[2.5]*" Emissions (tons)"),
         x = "Year")
ggsave("plot3.png")
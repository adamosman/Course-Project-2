# Sets the working directory and loads ggplot2
library(ggplot2)
setwd("~/Desktop/Course Project 2/exdata%2Fdata%2FNEI_data/")
# Reads in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Subsets the data based on Baltimore City emissions related to motor vehicles
# and calculates the totals for each year. 
motor.sub <- subset(NEI, type == "ON-ROAD" & fips == "24510")
total <- aggregate(Emissions ~ year, data = motor.sub, FUN = sum)
# Plots total emissions using the base plot and saves it to a PNG.
ggplot(total,aes(x = year, y = Emissions)) +
    geom_point() +
    geom_line(stat = "summary", fun.y = sum) +
    labs(title = expression("PM"[2.5]*" Emissions From Motor Vehicle-Related Sources in Baltimore City"),
         y = expression("Total PM"[2.5]*" Emissions (tons)"), 
         x = "Year")
ggsave("plot5.png")
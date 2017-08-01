# Sets the working directory and loads ggplot2
library(ggplot2)
setwd("~/Desktop/Course Project 2/exdata%2Fdata%2FNEI_data/")
# Reads in the data and subsets it for Baltimore County.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Finds the indicies corresponding to "coal" in the source classification data
# frame and stores the associated SCC code.
ind <- grep("coal", SCC$EI.Sector, ignore.case = TRUE)
coal <- as.character(SCC$SCC[ind])
# The NEI data gets subsetted based on the coal indicies from the SCC data frame
# and the total emissions are calculated for each year of data.
coal.sub <- NEI[(NEI$SCC %in% coal), ]
total <- aggregate(Emissions ~ year, data = coal.sub, FUN = sum)
# Plots total emissions using the base plot and saves it to a PNG.
ggplot(total,aes(x = year, y = Emissions)) +
    geom_point() +
    geom_line(stat = "summary", fun.y = sum) +
    labs(title = expression("Total PM"[2.5]*" Emissions From Coal Combustion-Related Sources"),
         y = expression("Total PM"[2.5]*" Emissions (tons)"),
         x = "Year")
ggsave("plot4.png")


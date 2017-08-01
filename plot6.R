# Sets the working directory and loads ggplot2
library(ggplot2)
setwd("~/Desktop/Course Project 2/exdata%2Fdata%2FNEI_data/")
# Reads in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Subsets the data based on Baltimore City emissions related to motor vehicles
# and calculates the totals for each year. Adds a new column for the City.
bmore <- subset(NEI, type == "ON-ROAD" & fips == "24510")
bmore.total <- aggregate(Emissions ~ year, data = bmore, FUN = sum)
bmore.total$City <- "Baltimore City"
# Subsets the data based on Los Angeles County emissions related to motor vehicles
# and calculates the totals for each year. Adds a new column for the City.
la <- subset(NEI, type == "ON-ROAD" & fips == "06037")
la.total <- aggregate(Emissions ~ year, data = la, FUN = sum)
la.total$City <- "Los Angeles County"
# Combines the Baltimore City and Los Angeles County data frames
total.emissions <- rbind(bmore.total, la.total)
# Plots total emissions using the base plot and saves it to a PNG.
ggplot(total.emissions, aes(x = factor(year), y = Emissions)) +
    geom_bar(stat = "identity") +
    facet_grid(City ~ . , scales = "free") + 
    labs(title = expression("Total PM"[2.5]*" Emissions From Motor Vehicle-Related Sources"),
         y = expression("Total PM"[2.5]* " Emissions (tons)"), 
         x = "Year")
ggsave("plot6.png")
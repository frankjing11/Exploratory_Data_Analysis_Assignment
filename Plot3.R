
########################## Plot 3 ##################################

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

#Select the subset and aggregate the data by years
Sub_NEI <- NEI[NEI$fips=="24510",]
Sub_Totals <- aggregate(Emissions ~ year, Sub_NEI,sum)

# open device
png(filename = './plot3.png', width=800, height=500, units='px')

# Create plot
library(ggplot2)

ggplot(Sub_NEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

# close device
dev.off()

#Answer:
# For non-road, non-point and on-road types, the total emissions from PM2.5 decreased in the Baltimore City 
# from 1999 to 2008. 
# However, for point type, the total emissions from PM2.5 increased in the Baltimore City from 1999 to 2005, 
# and then decreased from 2005 to 2008.
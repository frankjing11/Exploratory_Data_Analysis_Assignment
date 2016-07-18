
########################## Plot 2 ##################################

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

#Select the subset and aggregate the data by years
Sub_NEI <- NEI[NEI$fips=="24510",]
Sub_Totals <- aggregate(Emissions ~ year, Sub_NEI,sum)

# open device
png(filename = './plot2.png')

# Create plot
barplot(
  (Sub_Totals$Emissions)/10^6,
  names.arg=Sub_Totals$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Million Tons)",
  main="Total PM2.5 Emissions  In The Baltimore City"
)

# close device
dev.off()

#Answer:
# Yes. Overall the total emissions from PM2.5 decreased in the Baltimore City 
# from 1999 to 2008. However, the total emissions in 2005 were larger than that in 2002.
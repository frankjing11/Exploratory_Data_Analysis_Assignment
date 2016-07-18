
##########################Plot 1 ##################################

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

#Aggregate the emissions by year
Totals <- aggregate(Emissions ~ year,NEI, sum)

# open device
png(filename = './plot1.png')

# Create plot
barplot(
  (Totals$Emissions)/10^6,
  names.arg=Totals$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Million Tons)",
  main="Total PM2.5 Emissions From All US Sources"
)
# close device
dev.off()

#Answer:
# Yes. Total emissions from PM2.5 have gradually decreased in the United States 
# from 1999 to 2008.

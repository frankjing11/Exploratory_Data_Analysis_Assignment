
########################## Plot 4 ##################################

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

#Select the subset
SCC_Coal <- SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

# Merge two data sets
Coal_data <- merge(x=NEI, y=SCC_Coal, by='SCC')
Aggr_Coal <- aggregate(Coal_data[, 'Emissions'], by=list(Coal_data$year), sum)
colnames(Aggr_Coal) <- c('Year', 'Emissions')


# open device
png(filename = './plot4.png')

# Create plot
library(ggplot2)

ggplot(Aggr_Coal,aes(factor(Year),Emissions/10^3)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="Year", y="Total PM2.5 Emission (Thousand Tons)") + 
  labs(title="PM2.5 Coal Combustion Source Emissions Across US from 1999-2008")


# close device
dev.off()

# Answer
# Across the United States, emissions from coal combustion-related sources slightly decreased
# from 1999 to 2005, then largely dropped from 2005 to 2008. 
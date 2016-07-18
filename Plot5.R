
########################## Plot 5 ##################################

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

#Select the subset
Sub_NEI <- subset(NEI, fips == 24510 & type == 'ON-ROAD')

# Aggregate emissions by year
Aggre_NEI <- aggregate(Sub_NEI[, 'Emissions'], by=list(Sub_NEI$year), sum)
colnames(Aggre_NEI) <- c('year', 'Emissions')

# open device
png(filename = './plot5.png')

# Create plot
library(ggplot2)

ggplot(Aggre_NEI,aes(factor(year),Emissions/10^3)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y="Total PM2.5 Emission (Thousand Tons)") + 
  labs(title="PM2.5 Motor Vehicle Source Emissions in Baltimore from 1999-2008")

# close device
dev.off()

# Answer
# Emissions from motor vehicle sources have largely dropped from 1999-2008 
# in Baltimore City
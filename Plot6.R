
########################## Plot 6 ##################################

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

#Select the subset
MD_NEI <- subset(NEI, fips == '24510' & type == 'ON-ROAD')
CA_NEI <- subset(NEI, fips == '06037' & type == 'ON-ROAD')
MD_NEI$City <- 'Baltimore City'
CA_NEI$City <- 'Los Angeles County'

#Combine the datasets together
Comb_data <- rbind(MD_NEI,CA_NEI)

# open device
png(filename = './plot6.png')

# Create plot
library(ggplot2)

ggplot(Comb_data, aes(x=factor(year), y=Emissions, fill=City)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~City) +
  guides(fill=FALSE) + theme_bw() +
  labs(x="year", y=("Total PM2.5 Emission (Tons)"))+ 
  labs(title="PM2.5 Motor Vehicle Source Emissions in Baltimore & LA")

# close device
dev.off()

# Answer
# It's obvisous that Los Angeles County has the greatest changes and fluctation
# from 1999 to 2008 in motor vehicle emissions
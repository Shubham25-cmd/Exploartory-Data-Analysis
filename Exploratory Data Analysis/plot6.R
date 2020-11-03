library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
city <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]
Final <- aggregate(Emissions ~ year + fips,city,sum)
Final$fips[Final$fips=="24510"] <- "Baltimore City"
Final$fips[Final$fips=="06037"] <- "Los Angeles County, California"
png("plot6.png")
Final %>% ggplot(aes(factor(year), Emissions, fill = fips)) + geom_bar(stat="identity") + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions from motor vehicle') + facet_wrap("fips")
dev.off()
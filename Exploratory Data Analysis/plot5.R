library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
Baltimore <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]
Final <- aggregate(Emissions ~ year, Baltimore, sum)
png("plot5.png")
Final %>% ggplot(aes(factor(year), Emissions)) + geom_bar(stat="identity") + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions from motor vehicle')
dev.off()
NEI <- readRDS("FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("FNEI_data/Source_Classification_Code.rds")

coalSCC <- SCC[grepl("Coal", SCC$Short.Name),c(1,3)]

coalNEI <- merge(NEI, coalSCC, by="SCC")
total <- tapply(coalNEI$Emissions, coalNEI$year, FUN=sum)

barplot(total, xlab="year", ylab="Emission", main="Yearly PM2.5 Coal Emission in the US.",
        col=4)

# save png
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()

# library(dplyr)
# total <- NEI %>% group_by(year) %>% summarise(Emissions = sum(Emissions))

# total <- aggregate(NEI$Emissions, by=list(year=NEI$year), FUN=sum)

NEI <- readRDS("FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("FNEI_data/Source_Classification_Code.rds")

total <- tapply(NEI$Emissions, NEI$year, FUN=sum)

barplot(total, xlab="year", ylab="Emission", main="Yearly PM2.5 Emission in the US.",
        col=4)

# save png
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()

# library(dplyr)
# total <- NEI %>% group_by(year) %>% summarise(Emissions = sum(Emissions))

# total <- aggregate(NEI$Emissions, by=list(year=NEI$year), FUN=sum)

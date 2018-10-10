NEI <- readRDS("FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("FNEI_data/Source_Classification_Code.rds")

blti.motor <- NEI[(NEI$fips == "24510" & NEI$type == "ON-ROAD"),]
blti <- tapply(blti.motor$Emissions, blti.motor$year, FUN=sum)

barplot(blti, xlab="year", ylab="Emission", main="Yearly PM2.5 Motor Emission in Baltimore.",
        col=4)

# save png
dev.copy(png, file = "plot5.png", height = 480, width = 480)
dev.off()

# library(dplyr)
# total <- NEI %>% group_by(year) %>% summarise(Emissions = sum(Emissions))

# total <- aggregate(NEI$Emissions, by=list(year=NEI$year), FUN=sum)

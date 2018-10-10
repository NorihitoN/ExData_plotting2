library(dplyr)
library(ggplot2)

NEI <- readRDS("FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("FNEI_data/Source_Classification_Code.rds")

blti.motor <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD",]
blti <- blti.motor %>% group_by(year) %>% summarise(Emissions = sum(Emissions))

los.motor <- NEI[NEI$fips == "06037" & NEI$type == "ON-ROAD",]
los <- los.motor %>% group_by(year) %>% summarise(Emissions = sum(Emissions))

blti$city <- rep("Baltimore", nrow(blti))
los$city <- rep("Los Angeles", nrow(los))

blti_los <- rbind(blti, los)

p <- ggplot(data=blti_los, aes(x=as.character(year), y=Emissions, fill=city)) +
    geom_bar(stat="identity", position=position_dodge()) + 
    theme_minimal() + 
    labs(x = "year", y="Emissions", title="Yearly PM2.5 Motor Emission in Baltimore and LA.")
p
# ggsave("plot6.png")

# save png
dev.copy(png, file = "plot6.png", height = 480, width = 480)
dev.off()

# library(dplyr)
# total <- NEI %>% group_by(year) %>% summarise(Emissions = sum(Emissions))

# total <- aggregate(NEI$Emissions, by=list(year=NEI$year), FUN=sum)

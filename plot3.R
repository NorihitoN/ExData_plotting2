library(plyr)
library(dplyr)
library(ggplot2)

NEI <- readRDS("FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("FNEI_data/Source_Classification_Code.rds")

blti <- NEI[NEI$fips == "24510",]
total <- blti %>% group_by(year,type) %>% summarise(Emissions = sum(Emissions))
# Calculate the cumulative sum of len for each dose
total_cumsum <- ddply(total, "year",
                   transform, label_ypos=cumsum(Emissions))
p <- ggplot(data=total_cumsum, aes(x=as.character(year), y=Emissions, fill=type)) +
    geom_bar(stat="identity") + 
    theme_minimal() + 
    labs(x = "year", y="Emissions", title="Yearly PM2.5 Emission in the Baltimore city.")
p

# qplot(year, Emissions, data=total, col=type,
#       xlab="year", ylab="Emissions",
#       main="Yearly PM2.5 Emission in the Baltimore City for each type") 

# save png
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()

# library(dplyr)
# total <- NEI %>% group_by(year) %>% summarise(Emissions = sum(Emissions))

# total <- aggregate(NEI$Emissions, by=list(year=NEI$year), FUN=sum)

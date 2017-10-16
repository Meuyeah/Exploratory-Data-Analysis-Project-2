NEI <- readRDS("summarySCC_PM25.rds")

install.packages("dplyr")
library(dplyr)

NEIbalt <- filter(NEI, fips == 24510 & type == "ON-ROAD")
NEIla <- filter(NEI,fips == 06037 & type == "ON-ROAD")
balt.la <- rbind(NEIbalt,NEIla)
aggbal.la <- aggregate(Emissions ~ year+fips, balt.la,sum)

install.packages(ggplot2)
library(ggplot2)

png("plot6.png",width=480,height=480)

g <- qplot(year, Emissions, data = aggbal.la, facets = .~ fips) + geom_smooth(method = "lm") + ggtitle("Comparative emissions Baltimore-LA")
print(g)
dev.off

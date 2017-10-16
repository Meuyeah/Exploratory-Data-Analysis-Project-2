NEI <- readRDS("summarySCC_PM25.rds")

install.packages("dplyr")
library(dplyr)

NEIbalt <- filter(NEI, fips == 24510 & type == "ON-ROAD")
agg <- aggregate(Emissions ~ year, NEIbalt,sum)

png("plot5.png",width=480,height=480)

g <- qplot(year, Emissions, data = agg) + geom_smooth(method = "lm") + ggtitle("Baltimore emissions by vehicles")
 print(g)
 dev.off

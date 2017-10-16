NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

install.packages("dplyr")
library(dplyr)

NEIbalt<- filter(NEI,fips=="24510")
aggBal <- aggregate(Emissions ~ year+type, NEIbalt,sum)

png("plot3.png",width= 480, height = 480)

g <- qplot(year, Emissions, data = aggBal, facets = .~ type) + geom_smooth(method = "lm") + ggtitle("Baltimore emissions by source")
print(g)
dev.off()

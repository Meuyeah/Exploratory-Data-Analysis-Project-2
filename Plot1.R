# Exploratory-Data-Analysis-Project-2


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

aggTot <- aggregate(Emissions ~ year,NEI,sum)

png("plot1.png",width=480,height=480)

barplot(aggTot$Emissions)/10^6,names.arg=aggTot$year,xlab="year",ylab="PM2.5 Emissions (10^6 Tons)",main="Total PM2.5 Emissions From All US Sources")

dev.off()

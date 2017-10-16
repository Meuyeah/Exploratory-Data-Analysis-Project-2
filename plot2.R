NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

install.packages("dplyr")
library(dplyr)

NEIbalt<- filter(NEI,fips=="24510")
aggBal <- aggregate(Emissions ~ year, NEIbalt,sum)

png("plot2.png",width=480,height=480)

barplot((aggBal$Emissions),names.arg=aggBal$year,xlab="year",ylab="PM2.5 Emissions (10^6 Tons)",main="Total PM2.5 Emissions From Baltimore")
dev.off()

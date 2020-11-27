#1. Apply strsplit() to split all the names of the data frame on the characters “wgtp”. What is the value of the 123 element of the resulting list?

library(data.table)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "quiz4data.csv")
d <- read.csv("quiz4data.csv")
strsplit(names(d), split = "wgtp")[123]

#2. Remove the commas from the GDP numbers in millions of dollars and average them. What is the average?

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "quiz4data.csv")
data <- read.csv("quiz4data.csv")

clean <- gsub(",","",data[,5])

mean(as.numeric(clean[1:215]),na.rm = TRUE)

#3. Match the data based on the country shortcode. Of the countries for which the end of the fiscal year is available, how many end in June?

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "quiz4data2.csv")

data2 <- read.csv("quiz4data2.csv")

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile = "quiz4data3.csv")

data3 <- read.csv("quiz4data3.csv")

setnames(data2, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "rankingGDP", "Long.Name", "gdp"))

all <- merge(data2, data3, by = "CountryCode")

table(grepl("june", tolower(all$Special.Notes)), grepl("fiscal year end", tolower(all$Special.Notes)))[4]

#4. quantmod (http://www.quantmod.com/) package to get historical stock prices for publicly traded companies on the NASDAQ and NYSE. Use the following code to download data on Amazon’s stock price and get the times the data was sampled.
install.packages("quantmod")
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

# 5. How many values were collected in 2012? How many values were collected on Mondays in 2012? head(data)
length(grep("^2012",sampleTimes))

install.packages("lubridate")
library(lubridate)
sampleTimes[grep("^2012",sampleTimes)]
sum(weekdays(as.Date(sampleTimes[grep("^2012",sampleTimes)])) == "Monday")

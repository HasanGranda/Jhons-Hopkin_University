#What are the first 3 values that result?

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",destfile = "quiz2data.csv")
data <- read.csv("quiz2data.csv")
logic <- data$ACR ==3 & data$AGS == 6
which(logic)

#Use the parameter native=TRUE. What are the 30th and 80th quantiles of the resulting data?

install.packages("jpeg")
library(jpeg)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", destfile = "quiz2jpeg.jpg")
jpgdat = readJPEG("quiz2jpeg.jpg", native = TRUE)
quantile(jpgdat, probs = c(0.3, 0.8))

#Match the data based on the country shortcode. How many of the IDs match? 
#Sort the data frame in descending order by GDP rank (so United States is last). 
#What is the 13th country in the resulting data frame?

library(data.table)
library(dplyr)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "quiz3data.csv")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile = "quiz3data2.csv")

countries = fread("quiz3data.csv", skip=4, nrows = 190, select = c(1, 2, 4, 5), col.names=c("CountryCode", "Rank", "Economy", "Total"))
education = fread("quiz3data2.csv")

all = merge(countries, education, by = "CountryCode")
dim(all)
alln <- arrange(all, desc(Rank), .by_group = FALSE)

head(alln,13)[33]

# What is the average GDP ranking for the “High income: OECD” and “High income: nonOECD” group?

unique(all$"Income Group")
tapply(all$Rank, all$"Income Group", mean)

alln$RankGroups <- cut2(all$Rank, g=5)
table(alln$RankGroups, all$`Income Group`)

table(alln$RankGroups, all$`Income Group`)[4]

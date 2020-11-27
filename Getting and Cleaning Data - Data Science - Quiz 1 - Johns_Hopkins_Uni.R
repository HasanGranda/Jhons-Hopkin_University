#How many properties are worth $1,000,000 or more?

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "quiz1data.csv")
data <- read.csv("quiz1data.csv")
nrow(data[which(data$VAL == 24),])

#2
install.packages(c("xlsx", "rJava", "xlsxjars"))
library("xlsx")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", 
              destfile = "C:/Users/soldi/Documents/datasciencecoursera/datasciencecoursera/Jhons-Hopkin_University/quiz1data2.xlsx", mode="wb")

row <- 18:23
col <- 7:15

dat <- read.xlsx("quiz1data2.xlsx", sheetIndex = 1, colIndex = col, rowIndex = row, header = TRUE)

head(dat)

#3.How many restaurants have zipcode 21231?
install.packages("XML")
library(XML)
URL<-"http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(URL, useInternal = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)

#4Using the data.table package, which will deliver the fastest user time?

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile="quiz1data4.csv")
install.packages("data.table")
library(data.table)
DT <- fread(input="quiz1data4.csv", sep=",")

system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(mean(DT[DT$SEX==1,]$pwgtp15)) + system.time(mean(DT[DT$SEX==2,]$pwgtp15))

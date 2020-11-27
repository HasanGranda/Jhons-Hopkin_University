#Register an application with the Github API. 
#Use this data to find the time that the datasharing repo was created. What time was it created?
install.packages("httr")
library(httr)

oauth_endpoints("github")

gitapp <- oauth_app("github",
                    key = "ca6e4566f563588598df",
                    secret = "f8ab46847d620aa610914240e0ebc045c9ee8106")

github_token <- oauth2.0_token(oauth_endpoints("github"), gitapp)

gtoken <- config(token = github_token)
req <- GET("https://api.github.com/rate_limit", gtoken)
stop_for_status(req)
content(req)

#1.
install.packages("jsonlite")
library(jsonlite)
json1 = content(req)
json2 = jsonlite::fromJSON(toJSON(json1))
repo <- json2[5]
names(repo)

repo$created_at

#2. Which of the following commands will select only the data for the probability weights pwgtp1 with ages less than 50?
install.packages("sqldf")
library("sqldf")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile = "quiz2data.csv")

acs <- read.csv("quiz2data.csv")

sqldf("select pwgtp1 from acs where AGEP < 50")
sqldf("select distinct AGEP from acs")

#  How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page:
# http://biostat.jhsph.edu/~jleek/contact.html

library("XML")
URL <- url("http://biostat.jhsph.edu/~jleek/contact.html")
lines <- readLines(URL)
close(URL)
c(nchar(lines[10]), nchar(lines[20]), nchar(lines[30]), nchar(lines[100]))

#Read this data set into R and report the sum of the numbers in the fourth of the nine columns.
#https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
widths <- c(1, 9, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3)
fixed <- read.fwf(url, widths, header = FALSE, skip = 4)
sum(fixed$V8)

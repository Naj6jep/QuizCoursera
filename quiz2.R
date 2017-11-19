Quiz week 2.

#Vraag 1

#load httr package
library(httr)
lol=oauth_endpoints("github")
myapp<-oauth_app("github", key="86d4092fc68e1c06dbc1c8a794c6f0363ae89bb559c25904322b6b1b7e76713c ", secret = "103bdcec38811bc17455df65715880deca0b35a34105909de08253c9f603d785 ")

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos",gtoken)
stop_for_status(req)
janneke<-content(req)
janneke

# zou moeten werken als ik mijn wachtwoord weer heb.

#Vraag 2
library("gsubfn")
library("proto")
library("RSQLite")
library("sqldf") 

#zet directory correct
setwd("C:/Users/deheijj/Documents/R/Coursera/Cursus 3")
getwd()

#Maak een map om de download data in op te slaan
if(!file.exists("dataQuiz2")){
  dir.create("dataQuiz2")
}

#Downloadlink
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
fileUrl

#Start Download file
download.file(fileUrl, destfile= "./dataQuiz2/quiz2.csv")

#Check of er een file is aangemaakt
list.files("./dataQuiz2")

#Data van Download altijd opslaan
dateDownloaded<-date()
dateDownloaded

# inlezen van csv file
acs<-read.csv2("./dataQuiz2/quiz2.csv", header = TRUE, sep = ",")
head(acs)

#Which of the following commands will select only the data for the probability weights pwgtp1 with ages less than 50?


#a
atest<-sqldf("select pwgtp1 from acs where AGEP < 50")
head(atest)
#b
btest<-sqldf("select * from acs")
head(btest)
#c
ctest<-sqldf("select * from acs where AGEP < 50 and pwgtp1")
head(ctest)
#d
dtest<-sqldf("select pwgtp1 from acs")
head(dtest)

# het is antwoord A

#Vraag 3
antwoord <-unique(acs$AGEP)
head(antwoord)
summary(antwoord)

#a
anta<-sqldf("select distinct AGEP from acs")
length(anta)
head(anta)

#b
antb<-sqldf("select distinct pwgtp1 from acs")
head(antb)

#c
antc<-sqldf("select AGEP where unique from acs")

#d
antd<-sqldf("select unique * from acs")

#Vraag 4

#ophalen dataset
con=url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode4 = readLines(con)
close(con)
htmlCode4
htmlCode4[178]

# Testen nchar
tellen<-c(htmlCode4[10],htmlCode4[20], htmlCode4[30],htmlCode4[100])
tellen
nchar(tellen)

# 2de methode
library("XML")
url <- "http://biostat.jhsph.edu/~jleek/contact.html"
html <- htmlTreeParse(url,useInternalNodes=T)
html
xpathSApply(html,"//title",xmlValue)

# Vraag 5
#Downloadlink
fileUrl2<-"https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
fileUrl2

#Start Download file
download.file(fileUrl2, destfile= "./dataQuiz2/quiz3.csv")

#Check of er een file is aangemaakt
list.files("./dataQuiz2")

#Data van Download altijd opslaan
dateDownloaded<-date()
dateDownloaded

# inlezen van for file
df<-read.fwf("./dataQuiz2/quiz3.csv", c(15,4,9,4,9,4,9,4,9), header = FALSE, skip = 4)
head(df)

gekko<-df[,4]
head(gekko)
summary(gekko)
sum(gekko)

#Quiz 2 week 1
install.packages("KernSmooth")
library(KernSmooth)
  
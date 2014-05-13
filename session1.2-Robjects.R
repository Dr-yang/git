## session 1.2 R objects
gDat <- read.delim("gapminderDataFiveYear.txt")
str(gDat)
head(gDat)
head(gDat, n=10)
tail(gDat, n=10)
names(gDat)
dim(gDat)
nrow(gDat)
ncol(gDat)
length(gDat)
summary(gDat)

plot(lifeExp ~ year, data=gDat)
plot(lifeExp ~ gdpPercap, data=gDat)
str(gDat)
gDat$lifeExp
summary(gDat$lifeExp)

hist(gDat$gdpPercap)

gDat$continent
as.character(gDat$continent)

## subset
subset(gDat, subset=country=="Cambodia")
subset(gDat, subset=country %in% c("Cambodia","Japan","Spain"))
subset(gDat, subset=year < 1962)
subset(gDat, subset=lifeExp < 32)

myData <- subset(gDat, subset=lifeExp < 32, select=c(country,lifeExp,pop))
mean(myData$lifeExp)
with(myData, mean(lifeExp))

plot(lifeExp ~ year, gDat, subset=country=="Spain")
lm(lifeExp ~ year, gDat, subset=country=="Canada")

with(gDat, mean(lifeExp))
with(subset(gDat, subset=country=="Canada"), mean(lifeExp))

## 
x <- c(3,5)
class(x)
x[3] <- "charactor"

## matrix
x <- cbind(1:5, c("a","b","c","d","e"))




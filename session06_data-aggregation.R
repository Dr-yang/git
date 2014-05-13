## data aggregation
gDat <- read.delim("gapminderDataFiveYear.txt")
str(gDat)

## take a data.frame
## linear regression of lifeExp on year
## return intercept and slope

lm(lifeExp ~ year, gDat)

lm(lifeExp ~ I(year - 1952), gDat)
fit <- lm(lifeExp ~ I(year - 1952), gDat)
str(fit)
summary(fit)
coef(fit)

## function
## input: a data.frame
## output: the intercept and slop from (see model above)
slop <- function(df){
  fit <- lm(lifeExp ~ I(year - 1952), df)
  return(coef(fit))
}
slop(gDat)

slop <- function(df){
  fit <- lm(lifeExp ~ I(year - 1952), df)
  coef(fit)
}
slop(gDat)

## create a subset of gDat = the data for one country
## store it as a object
## apply slop to it
libray("ggplot2")
country <- subset(gDat, country=="Rwanda")
ggplot(country, aes(x=year, y=lifeExp)) + geom_point() +
  geom_smooth(method="lm")

library("plyr")
ddply(gDat, ~ country, slop)



## writing functions
gDat <- read.delim("gapminderDataFiveYear.txt")
str(gDat)

## compute the difference between a variable's max and min
## practice with lifeExp, pop, gdpPercap
## read up on min(), max(), range()

min(gDat$lifeExp)
max(gDat$lifeExp)
range(gDat$lifeExp)

range(gDat$pop)

max(gDat$lifeExp)-min(gDat$lifeExp)
range(gDat$lifeExp)[2]-range(gDat$lifeExp)[1]

with(gDat, max(lifeExp)-min(lifeExp))

diff(range(gDat$lifeExp))

which.min(gDat$lifeExp)
gDat[which.min(gDat$lifeExp),]

## package that into a function
max_minus_min <- function(x) max(x)-min(x)
max_minus_min(gDat$lifeExp)
max_minus_min(gDat$gdpPercap)

max_minus_min(gDat$country)
max_minus_min(runif(1000))
 
x <- gDat$lifeExp
max_minus_min(x)

## get to know the quantile() function
## use lifeExp as variable

quantile(gDat$lifeExp)

quantile(gDat$lifeExp, probs=c(0.1,0.2))
quantile(gDat$lifeExp, probs=0.5)

quantile(gDat$lifeExp, probs = seq(0, 1, 0.1))

## use quantile to get 0.25 and 075 quantiles
## store them and take difference

x <- quantile(gDat$lifeExp, probs=0.25) 
y <- quantile(gDat$lifeExp, probs=0.75)
quantile(gDat$lifeExp, probs=0.75) -
  quantile(gDat$lifeExp, probs=0.25)

diff(range(quantile(gDat$lifeExp, probs=c(0.75, 0.3,0.25))))

max_minus_min <- function(x) {
  return(max(x)-min(x))
}
max_minus_min(gDat$lifeExp)
## upgrade max_minus_min <- function(x) max(x)-min(x)
## to take difference between two quantiles
## inputs: x = numeric vector
## prob = the probabilities
## return: difference between the quantiles
quant_diff <- function(df, x, quant_range) {
  diff(range(quantile(df[x], probs=quant_range)))
}
quant_diff(gDat, x="lifeExp", quant_range=c(0.25,0.75))

quant_diff <- function(x, probs) {
  the_quant <- quantile(x, probs=probs)
  return(max(the_quant) - min(the_quant))
}
quant_diff(gDat$lifeExp, probs=c(0.25,0.75))

quant_diff <- function(x, probs=c(0,1)) {
  the_quant <- quantile(x, probs=probs)
  return(max(the_quant) - min(the_quant))
}
quant_diff(gDat$lifeExp)

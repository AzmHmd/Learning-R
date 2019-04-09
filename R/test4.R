x = data.frame(pressure = c(11.2,11.5,11,11.1,13,14), weight = c(70,75,67,73,100,120))

# these ways all result the same outcome
x$pressure
x[,1]
x[,"pressure"]

# find the correlation
cor(x$pressure,x$weight)
library(ggplot2)
ggplot(x,aes(pressure,weight)) + geom_point()

# add another colomn to x
x$beat = c(70,65,80,73,58,45)

cor(x$beat,x$pressure)
# fit a linear line on the points
ggplot(x,aes(pressure,beat)) + geom_point() + geom_smooth(method = "lm")

# fit a smooth line (exact fit) on the points
ggplot(x,aes(pressure,beat)) + geom_point() + geom_smooth()

# find the cor matrix for all the data
cor(x)

# show t.test results too to make sure the cor is significant based on the p.value
cor.test(x$pressure,x$weight)

x$alaki = runif(6)
cor(x$pressure,x$alaki)
cor.test(x$alaki,x$pressure)
# --------------------------------


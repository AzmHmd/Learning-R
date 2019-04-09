x = read.delim("/Users/azh2/Documents/Education/R/Data/Endoderm.txt")
#install.packages("ggplot2")
rownames(x) = x[,1]
x = x[,-1]
x = log2(x+1)

# find standard deviation
standarddev = sd(x[4:6,1])
s = sd(c(1,5,7))

# define a function
se = function(x) 
  {
  sd(x)/sqrt(length(x))
}
se(c(3,5,7))
se(x[4:6,1])

options("digits")   #  default was 7
options(digits = 2)

# ------------------------------------
x$Sample = rownames(x)
x$Sample = substr(x$Sample,1,nchar(x$Sample)-2)

substr("Hello",1,3)
nchar("Hello")
nchar(x$Sample)

x.m = aggregate(.~Sample,x,mean)
library(ggplot2)
ggplot(x.m,aes(Sample,HLXb9),fill = Sample)+geom_bar(stat = "identity")

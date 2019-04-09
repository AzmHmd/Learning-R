x = read.delim("/Users/azh2/Documents/Education/R/Data/Endoderm.txt")
#install.packages("ggplot2")
rownames(x) = x[,1]
x = x[,-1]
xx = log2(x+1)
# mizane bayane 1 gene
summary(xx[,1])

summary(xx)

# we want to draw a graph to show all these information
library(ggplot2)

install.packages("reshape")
library(reshape)
x.m = melt(x) # reshape data from matrix to array
head(x.m)
dim(x.m)
dim(x)

ggplot(x.m,aes(variable,value))+geom_boxplot()
ggplot(x.m,aes(variable,value))+geom_boxplot(outlier.size = 0)
ggplot(x.m,aes(variable,value,fill = variable))+geom_violin()

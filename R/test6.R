xx = c(0,4,3,0,1)
y = c(37,39,38,36.8,37.5)
cor(xx,y,method = "spearman")
cor(xx,y,method = "pearson")

#-------------------------------------
x = read.delim("/Users/azh2/Documents/Education/R/Data/Endoderm.txt")
#install.packages("ggplot2")
rownames(x) = x[,1]
x = x[,-1]
x = log2(x+1)
x = as.matrix(x)
library(pheatmap)
heatmap(x)
colnames(x)
rownames(x)
x = na.omit(x)
x = x[-2:-3,]
head(x)
pheatmap(x) # this heatmap is based on euclidian distance
# order of cols and rows is now different based on the correlation values
pheatmap(x,clustering_distance_cols ="correlation",clustering_distance_rows = "correlation" )
rowMeans(x)
colMeans(x)
apply(x,1,var) # 1 is row and 2 is column
as.numeric(x[2,]) # change into vector
apply(x,2,min,na.rm=T)
lapply(1:3,function(x) x^2)
sapply(1:3,function(x) x^2)
t.test(x[4:10,1],x[11:32,1])
# if we have lots of genes this is hard so:
MyTest = function(i){t.test(x[4:10,i],x[11:32,i])$p.value}
MyTest(1)
MyTest(2)
MyTest(3)
MyTest(4)
sapply(1:ncol(x),MyTest)

x = read.delim("/Users/azh2/Documents/Education/R/Data/Endoderm.txt")
#install.packages("ggplot2")
rownames(x) = x[,1]
x = x[,-1]
# transpose x
x = data.frame(t(x))
library(ggplot2)
# scatter plot
# add a new cols to x with the same values as
# x$Gene = rownames(x) is the same as the next line
x = cbind(x,Gene=rownames(x))
p0 = ggplot(x,aes(x=SC.1,y=DE.2,label = Gene)) + geom_point() + geom_text()
p0
y = x[,c("Gene","DE.3")]
p1 = ggplot(y,aes(x=Gene,y=DE.3,fill=Gene))
p1 = p1 + geom_bar(stat = "identity") 
p2 = p1 + ylab("Expression of genes")
pdf("/Users/azh2/Documents/Education/R/plots3.pdf")
p0
p1
p2
dev.off() 
# -------------------------------------------------------------------
x = read.delim("/Users/azh2/Documents/Education/R/Data/Endoderm.txt")
#install.packages("ggplot2")
rownames(x) = x[,1]
x = x[,-1]
xx = log2(x+1)

xx.cor = cor(xx)    # lots of not availables are shown!!!
head(xx.cor)
any(is.na(xx))  # check if any NAs exist
dim(xx)
xx2 = na.omit(xx) # always omits the row. if want to omit col...then transpose the matrix
dim(xx2)
xx2.cor = cor(xx2)
head(xx2.cor) # this is cor between cols which contain genes
library(pheatmap)
library(ggplot2)
pheatmap(xx2.cor)
ggplot(x,aes(NKX6.1,NEUROD1)) + geom_point()
ggplot(x,aes(HLXb9,HHEX)) + geom_point()
ggplot(x,aes(HLXb9,HLXb9)) + geom_point()



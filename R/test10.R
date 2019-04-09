setwd("/Users/azh2/Documents/Education/R")
x = read.delim("/Users/azh2/Documents/Education/R/Data/Endoderm.txt")
#install.packages("ggplot2")
rownames(x) = x[,1]
x = x[,-1]
x = log2(x+1)
x.t = t(x)

# by correlation
x.t2 = x.t[,-2:-3]
xC = cor(x.t2)
xC = xC[,-16]
xC = xC[,-26]
xC = xC[-16,]
xC = xC[-26,]
D = dim(xC)
library(pheatmap)
pdf("H.pdf",width = 14,height = 14)
pheatmap(xC,method = "spearman")
dev.off()

# by PCA
xx = na.omit(x)
pc = prcomp(xx)
pcx = data.frame(pc$x)
pcx$Sample = rownames(pcx)
pcx$Sample = substr(pcx$Sample,1,nchar(pcx$Sample))
pdf("pca.pdf",width = 14,height = 14)
#ggplot(pcx,aes(PC1,PC2,color = Sample))+geom_point(size = 3)+theme_complete_bw()
library(ggplot2)
ggplot(pcx,aes(PC1,PC2,color = Sample))+geom_point(size = 3)
dev.off()

# by ANOVA
library(reshape)
x2 = t(x)
x2.m = melt(as.matrix(x2))
colnames(x2.m) = c("Sample","Gene","Exp")
anova(aov(Exp~Gene+Sample,data = x2.m))

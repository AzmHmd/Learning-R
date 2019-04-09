setwd("/Users/azh2/Documents/Education/R")
x = read.delim("/Users/azh2/Documents/Education/R/Data/Endoderm.txt")
#install.packages("ggplot2")
rownames(x) = x[,1]
x = x[,-1]
x = log2(x+1)

x = na.omit(x)
any(is.na(x))   # check if NA exists
is.na(x)    # check if NA exists

# when u want to get PCA, u should not have NA values
pc = prcomp(x)       #  get PCA values

plot(pc)      #  plot PCA coefficients: PCA1, PCA2, ...

pcx = data.frame(pc$x)   #  give values for PCA coefficients: PCA1, PCA2, ...

library(ggplot2)
ggplot(pcx,aes(PC1,PC2))+geom_point()
pcx$Sample = rownames(pcx)
pcx$Sample = substr(pcx$Sample , 1,nchar(pcx$Sample)-2)
ggplot(pcx,aes(PC1,PC2,color = Sample))+geom_point(size = 3)

barplot(x$PAX4)

pcr = pc$rotation
pcr[,1]  # zarayeb = ahamiate gene ha dar noghat

pcr = data.frame(pc$rotation)
pcr$Gene = rownames(pcr)
ggplot(pcr,aes(PC1,PC2,color = Gene,label = Gene))+geom_text()+geom_point(size = 3)

# 3D plotting
install.packages("rgl")
library(rgl)
plot3d(pcx[,1:3])

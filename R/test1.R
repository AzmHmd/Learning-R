X = read.delim("/Users/azh2/Documents/Education/R/Data/Endoderm.txt")
class(X)

# an ugly heatmap
heatmap(as.matrix(X[,-1]))
class(as.matrix(X[,-1]))

# add values to the first default column in X
rownames(X) = X[,1]
X = X[,-1]

# a pretty heatmap
pheatmap::pheatmap(X)
# save as a file
pdf("/Users/azh2/Documents/Education/R/heat1.pdf")
pheatmap::pheatmap(X,fontsize_row = 5,border_color = 2)
dev.off()  # close saving into a file

#say the column names
colnames(X)

barplot(log2(X[,"PAX4"]))
max(X,na.rm = T) # remove NAs


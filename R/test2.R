# in this program we want to find the relation between 2 cells in the amount of a gene
# using t.test
x = read.delim("/Users/azh2/Documents/Education/R/Data/Endoderm.txt")
rownames(x) = x[,1]
x = x[,-1]

a = x[1:3,1]
b = x[4:6,1]
t.test(a,b)

# show improvement during time during treatment
# if two groups are paired!!
# pay attention the distribution of ur data should be normal 
# unless do not use t.test
t.test(1:5,c(0.1,1:4),paired = T)


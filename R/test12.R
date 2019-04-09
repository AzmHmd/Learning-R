a1 = rnorm(30)
summary(a1)
a2 = rnorm(30)
summary(a2)
t.test(a1,a2)
plot(a1,a2)
qqplot(a1,a2)


a11  = rnorm(20,mean=1,sd=5)
a22  = rnorm(20,mean=5,sd=5)
t.test(a11,a22)

a111  = rnorm(20,mean=1,sd=.5)
a222  = rnorm(20,mean=1,sd=5)
t.test(a111,a222)
#-------------------------------
a1 = runif(30)
summary(a1)
a2 = runif(30)
summary(a2)
t.test(a1,a2)
plot(a1,a2)
wilcox.test(a1,a2)

a12 = runif(30,min=0,max=1.5)
qqplot(a1,a2)

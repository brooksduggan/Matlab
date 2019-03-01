# 5.6-3
zhi= pnorm(2)
zlo= pnorm(-1)
ans1 = zhi-zlo
ans1
# 5.6-13
ans2 = 1 - pnorm(-5/3)
ans2
# 7.1-3
w = c(17.5, 14.5, 15.2, 14, 17.3, 18, 13.8)
t.test(w, conf.level = .9)
sqrt(var(w))
# 7.2-9
preM = c(11.1, 19.5, 14, 8.3, 12.4, 7.89, 12.1, 8.3, 12.31, 10)
posM = c(9.97, 15.8, 13.02, 9.28, 11.51, 7.4, 10.7, 10.4, 11.4, 11.95)
preW = c(22.9, 31.6, 27.7, 21.7, 19.36, 25.03, 26.9, 25.75, 23.63, 25.06)
posW = c(22.89, 33.47, 25.75, 19.8, 18, 22.33, 25.26, 24.9, 21.8, 24.28)
difM = posM-preM
difW = posW-preW
t.test(difM, conf.level = .9)
t.test(difW, conf.level = .9)
plot(difM, main="Men Body Fat %", xlab="Before", ylab = "After")
plot(difW, main="Women Body Fat %", xlab="Before", ylab = "After")
# 7.2-12
groupX = c(133.5, 137.2, 136.3, 133.3, 137.5, 135.4, 138.4, 137.1, 136.5, 139.4, 137.9, 136.8)
groupY = c(134, 134.7, 136, 132.7, 134.6, 135.2, 135.9, 135.6, 135.8, 134.2)
t.test(groupX)
var(groupX)
t.test(groupY)
var(groupY)
t.test(groupX, groupY)
boxplot(groupX, groupY)
#7.3-5
binconf(9, 50, method = "asymptotic")
binconf(9, 50)
binconf(9+2, 50+4, method = "asymptotic")
#7.3-11
y = c(1100, 385)
n = c(1300, 520)
prop.test(y, n, correct = FALSE)


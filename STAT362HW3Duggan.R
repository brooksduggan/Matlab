# 9-3.1
pf(6.026, 3, 20, lower.tail = FALSE)

# 9-3.5
stack35 =  stack(data.frame(cuckoo_9_3_5))
stack35 = na.omit(stack35)
boxplot(values ~ ind, data=stack35)
aov.1 = aov(values ~ ind, data=stack35)
summary(aov.1)

# 9-4.3
View(concrete_9_4_3)
aov.2 = aov(strength ~ treatment + batch, data = concrete_9_4_3)
summary(aov.2)
anova(aov.2)

#9-4.5
View(food_9_4_5)
aov.3 = aov(consumed ~ treatment*group, data = food_9_4_5)
boxplot(consumed ~ treatment*group, data = food_9_4_5)
summary(aov.3)

# 9-5.1
library("DoE.base")

twolev= fac.design(nlevels = 2, nfactors = 2, randomize = FALSE)
View(twolev)

# 9-5.5
x = c(71, 61, 90, 82, 68, 61, 87, 80, 61, 50, 89, 83, 59, 51, 85, 78)
fourlev = fac.design(nlevels = 2, nfactors = 4, randomize = FALSE)
add.response(fourlev, x)
twoaov = aov(x~A*B, data = fourlev)
summary(twoaov)
threeaov = aov(x~A*B*C, data = fourlev)
summary(threeaov)
fouraov = aov(x~A*B*C*D, data = fourlev)
summary(fouraov)
coefficients(fouraov)
qqnorm(coefficients(fouraov))

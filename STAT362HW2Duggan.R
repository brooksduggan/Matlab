# 8.1-9
x1 = c(11.5, 11.8, 15.7, 16.1, 14.1, 10.5, 15.2, 19.0, 12.8, 12.4, 19.2,
       13.5, 16.5, 13.5, 14.4, 16.7, 10.9, 13.0, 15.1, 17.1, 13.3, 12.4,
       8.5, 14.3, 12.9, 11.1, 15.0, 13.3, 15.8, 13.5, 9.3, 12.2, 10.3)
t.test(x1, mu = 15.7, alternative = "less", conf.level = .98, paired = FALSE)
qnorm(.02)
# 8.2-9
x2 = c(2.9, 14.9, 1, 12.6, 9.4, 7.6, 3.6, 3.1, 2.7, 4.8, 3.4, 7.1, 7.2)
y2 = c(7.8, 4.2, 2.4, 12.9, 17.3, 10.4, 5.9, 4.9, 5.1, 8.4, 10.8, 23.4, 9.7)
streamdiff = y2 - x2
t.test(x2, y2, mu = 0, alternative = "less", conf.level = .95, paired = FALSE)
boxplot(x2,y2)
# 8.3-9
qnorm(.01)
prop.test(20, 300, p = .037, correct = FALSE, alternative = "greater", conf.level = .99)
(.0667-.037)/sqrt((.037*(1-.037))/300)
# 8.3-13
y = c(124, 70)           # vector of "successes"
n = c(894, 700)      # vector of sample sizes
prop.test(y, n, correct = FALSE)
sqrt(5.5014)
# 7.4-5a
qnorm(.005)
# 8.5-3
pwr.norm.test(d= 19/90 , n=  36  , sig.level = .05, 
              alternative = "less")
power.t.test(n= 36  , sig.level = .05, delta=  19  , sd=  90   ,
             type=  "one.sample"   ,alternative = "one.sided" )
power.t.test(n= 36  , sig.level = .08, delta=  19  , sd=  90   ,
             type=  "one.sample"   ,alternative = "one.sided" )
power.t.test(sig.level = .05, delta=  19  , sd=  90   , power = .8,
             type=  "one.sample"   ,alternative = "one.sided" )

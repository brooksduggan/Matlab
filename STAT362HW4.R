#4-1a
yoga = na.omit(yoga)
lnIL6 = exp(yoga$lnIL6)
plot(yoga$PhysAct, lnIL6)#It appears that there isn't an obvious relationship, but potentially a negatively linear one
#4-1b + c
physact.lm= lm(PhysAct ~ lnIL6, data = yoga)
summary(physact.lm)
abline(physact.lm)
#4-1d + e are written
confint(physact.lm, level = .95)

#4-2a
yr.lm= lm(lnIL6 ~ YogaYr, data = yoga)
anova(yr.lm)
#4-2b
summary(yr.lm)
#4-2c
lot.lots = data.frame(YogaYr=c(0,15,25,35,50))  # estimates for other x values
predyr = predict(yr.lm, lot.lots)
confyr = predict(yr.lm, lot.lots, interval = "confidence")
predyr
confyr
#4-2d
plot(lnIL6, yoga$YogaYr)
conf.lots = predict(yr.lm, lot.lots, interval = "confidence")
lines(lot.lots$YogaYr, conf.lots[,1]) #this is the formatting for matrices, get all rows (blank) and get all columns
lines(lot.lots$YogaYr, conf.lots[,2], col = "blue", lty = 2, lwd = 2)
lines(lot.lots$YogaYr, conf.lots[,3], col = "red", lty = 3, lwd = 2)
pred.lots = predict(yr.lm, lot.lots, interval = "prediction")
lines(lot.lots$YogaYr, pred.lots[,2], col = "green", lty = 4, lwd = 2)
lines(lot.lots$YogaYr, pred.lots[,3], col = "orange", lty = 3, lwd = 2)

#4-3
plot(physact.lm)

#4-4
mlryoga.lm = lm(lnIL6 ~ Group + YogaYr + Adiponectin, data = yoga)
summary(mlryoga.lm)
mlryoga2.lm = lm(lnIL6 ~ Group + YogaYr, data = yoga)
summary(mlryoga2.lm)

# Homework-3
group project workspace

GPD$HIV <-as.factor(GPD$HIV)
#

is.factor(GPD$HIV)
#

barWithErrors_GPDbyHIV <-ggplot(GPD, aes(HIV,Grooved_Pegboard_Dominant))
#

barWithErrors_GPDbyHIV
#

barWithErrors_GPDbyHIV + stat_summary(fun.y = mean, geom = "bar", fill = "White", colour = "Black")
#

install.packages("Hmisc")
#

library(Hmisc)
#

barWithErrors_GPDbyHIV + stat_summary(fun.y = mean, geom = "bar", fill = "White", colour = "Black") + stat_summary(fun.data = mean_cl_normal, geom = "pointrange", colour = "Green")
#

barWithErrors_GPDbyHIV + stat_summary(fun.y = mean, geom = "bar", fill = "White", colour = "Black") + stat_summary(fun.data = mean_cl_normal, geom = "pointrange", colour = "Green") + labs(x = "HIV", y = "Grooved Pegboard Dominant")
#
install.packages("pastecs")
#

library(pastecs)
#

by(GPD$Grooved_Pegboard_Dominant, GPD$HIV, mean)
#

barWithErrors_GPDbyHIV + stat_summary(fun.y = mean, geom = "bar", fill = "White", colour = "Black") + stat_summary(fun.data = mean_cl_normal, geom = "pointrange", colour = "Green") + labs(x = "HIV", y = "Grooved Pegboard Dominant") + scale_y_continuous(limits = c(0, 60), breaks = seq(from =0, to = 60, by = 5))
#



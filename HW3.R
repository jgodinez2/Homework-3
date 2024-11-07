setwd("/cloud/project")

install.packages("readxl")
#this package is needed to read in an .xlsx file

library(readxl)
#loading the package and its dependencies

TM <- read.csv("TextMessages.csv")
#importing the csv data file and referencing it as an object called TM

nrow(TM)

install.packages("ggplot2")
library(ggplot2)

TM$Group <- as.factor(TM$Group)

is.factor(TM$Group)

boxplot_TMbyGroup <- ggplot(TM, aes(Group,Baseline))

boxplot_TMbyGroup

boxplot_TMbyGroup + geom_boxplot()

boxplot_TMbyGroup + geom_boxplot() + labs(x="Group", y="Baseline")

min(TM$Baseline)
#min is 46

max(TM$Baseline)
#max is 89

boxplot_TMbyGroup + geom_boxplot() + labs(x="Group", y="Baseline")+ scale_y_continuous(limits = c(40, 90))

boxplot_TMbyGroup + geom_boxplot() + labs(x="Group", y="Baseline")+ scale_y_continuous(limits = c(40, 90), breaks = seq(from =40, to = 90, by = 5))

install.packages("pastecs")

library(pastecs)

by(TM$Baseline, TM$Group, median)

by(TM$Baseline, TM$Group, range)

by(TM$Baseline, TM$Group, quantile)







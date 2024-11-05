setwd("/cloud/project")

install.packages("readxl")
#this package is needed to read in an .xlsx file
library(readxl)
#loading the package and its dependencies

install.packages("reshape")
library(reshape)

colnames(TM)
long_data <- melt(TM, id.vars= c("Participant","Group"), variable.name = 
                    "Time", value.name="Value")

TM <- read.csv("TextMessages.csv")
#importing the csv data file and referencing it as an object called TM

nrow(TM)
#50 rows

install.packages("ggplot2")
library(ggplot2)

long_data$Group <- as.factor(long_data$Group)

is.factor(long_data$Group)

boxplot_TMbyGroup <- ggplot(long_data, aes(Group,value))

boxplot_TMbyGroup

boxplot_TMbyGroup + geom_boxplot()

boxplot_TMbyGroup + geom_boxplot() + labs(x="Group", y="value")

min(long_data$value)
#min is 9

max(long_data$value)
#max is 89

boxplot_TMbyGroup + geom_boxplot() + labs(x="Group", y="value")+ scale_y_continuous(limits = c(5, 90))

boxplot_TMbyGroup + geom_boxplot() + labs(x="Group", y="value")+ scale_y_continuous(limits = c(5, 90), breaks = seq(from =5, to = 90, by = 5))
#Group 1 has 2 outliers 

install.packages("pastecs")

library(pastecs)

by(long_data$value, long_data$Group, median)
#Group 1 = 60; Group 2 = 62

by(long_data$value, long_data$Group, range)
#Group 1 = 9-85; Group 2 = 46-89

by(long_data$value, long_data$Group, quantile)
# (Group - 1) 0% = 9  25% = 53  50% = 60  75% = 68 100% = 85; (Group - 2) 0% = 46  25% = 57  50% = 62  75% = 71 100% = 89






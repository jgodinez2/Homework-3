setwd("/cloud/project")
install.packages("reshape")
library(reshape)

install.packages("readxl")
#this package is needed to read in an .xlsx file
library(readxl)
#loading the package and its dependencies

TM <- read.csv("TextMessages.csv")
#importing the csv data file and referencing it as an object called TM

long_data <- melt(TM, id.vars= c("Participant","Group"), variable.name =
                    "variable", value.name="Value")

install.packages("pastecs")

library("pastecs")

by(long_data$Group, long_data$variable, stat.desc)


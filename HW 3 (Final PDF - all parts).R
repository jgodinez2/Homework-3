setwd("/cloud/project")

#Andrew's Part#

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

nrow(long_data)
#100 rows

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

colnames(TM)

by(long_data$value, long_data$Group, median)
#Group 1 = 60; Group 2 = 62

by(long_data$value, long_data$Group, range)
#Group 1 = 9-85; Group 2 = 46-89

by(long_data$value, long_data$Group, quantile)
# (Group - 1) 0% = 9  25% = 53  50% = 60  75% = 68 100% = 85; (Group - 2) 0% =
# 46  25% = 57  50% = 62  75% = 71 100% = 89

#Abell's Part#

# Install and load required packages
install.packages("readxl")
install.packages("reshape2")
install.packages("ggplot2")

library(readxl)
library(reshape2)
library(ggplot2)

# Importing the csv data file and referencing it as an object called TM
TM <- read.csv("TextMessages.csv")

# Reshaping the data to long format
long_data <- melt(TM, id.vars= c("Participant","Group"), variable.name = "Time", value.name="Value")

# Removing rows with missing values to avoid errors
long_data <- long_data[!is.na(long_data$Value), ]

# Converting Group and Time to factors
long_data$Group <- as.factor(long_data$Group)
long_data$Time <- as.factor(long_data$Time)

# Creating a stratified bar chart of text messages by Time
bar_chart_TMbyTime <- ggplot(long_data, aes(x = Time, y = Value, fill = Group)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Time", y = "Number of Text Messages", title = "Stratified Bar Chart of Text Messages by Time and Group") +
  theme_minimal()


# Display the bar chart
bar_chart_TMbyTime

#Jasmine's Part#
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

#Andrew#
TM <- read.csv("TextMessages.csv", header = TRUE)

is.factor(TM$Six_months)
#False

names(TM)

install.packages("pastecs")

library(pastecs)

stat.desc(TM$Baseline)

stat.desc(TM$Six_months)

round(stat.desc(TM$Baseline),2)
#nbr.val     nbr.null       nbr.na          min          max        range 
#50.00           0.00         0.00        46.00        89.00        43.00 
#sum            median       mean       SE.mean CI.mean.0.95          var 
#3261.00        64.50        65.22         1.51         3.03       113.52 
#std.dev     coef.var 
#10.65         0.16 

round(stat.desc(TM$Six_months),2)
#nbr.val     nbr.null       nbr.na          min          max        range 
#50.00           0.00         0.00         9.00        79.00        70.00
#sum           median         mean      SE.mean CI.mean.0.95          var 
#2870.00        60.50        57.40         1.97         3.96       194.12 
#std.dev     coef.var 
#13.93         0.24 

#We can determine that there are 50 observation with 4 variables. The mean for
#baseline is 65.22 and the mean for six_months is 57.4 which shows there is a
#decline in text messages between the 2 variables from baseline to six_months.
#The standard deviation for six_months is 13.93. The min for six_months is 9
#showing the lowest one person texted. The max is 79 which is lower than the
#baseline (89). This is indicating that the participants text lower in
#six_months verses the baseline.

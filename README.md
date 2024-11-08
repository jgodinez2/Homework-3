# Homework-3
group project workspace

#setwd("/cloud/project")

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

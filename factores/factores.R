library(readxl)

mydata = read_xlsx("ejemplo07.xlsx")
mydata

results = aov(mydata$Value ~ Primer*Spraying, data = mydata)
summary(results)


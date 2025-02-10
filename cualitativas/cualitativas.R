library(readxl)

mydata = read_xlsx("ejemplo03.xlsx")
mydata

model1 = lm(Repair_time ~ Last_service, data = mydata)
summary(model1)

model2 = lm(Repair_time ~ Last_service + Type, data = mydata)
summary(model2)

model2$residuals

qqnorm(model2$residuals, main = "normal")
qqline(model2$residuals)
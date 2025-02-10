library(readxl)

mydata = read_xlsx("ejemplo02.xlsx")
mydata

model1 = lm(Travel_time ~ Miles, data = mydata)
summary(model1)

model2 = lm(Travel_time ~ Miles + Deliveries, data = mydata)
summary(model2)
model2$residuals
cor(mydata)
library(readxl)

mydata = read_xlsx("ejemplo02.xlsx")
mydata

model1 = lm(Travel_time ~ Miles, data = mydata)
summary(model1)

model2 = lm(Travel_time ~ Miles + Deliveries, data = mydata)
summary(model2)
model2$residuals
cor(mydata)

newdata = data.frame(Deliveries = c(5), Miles = c(90))
newdata

est = predict(model2, newdata =newdata)
est

conf = predict(model2, newdata = newdata, interval = "confidence")
conf

conf = predict(model2, newdata = newdata, interval = "predict")
conf

library(readxl)

mydata = read_xlsx("ejemplo04.xlsx")
mydata 

model1 = glm(Coupon ~ Annual_spending + Simmons_card, data = mydata, family = "binomial")
model1

summary(model1)
predict(model1)
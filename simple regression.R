sample_data <- data.frame(
  Student_Population = c(2,6,8,8,12,16,20,20,22,26),
  Quaterly_Sales = c(58,105,88,118,117,137,157,169,149,202)
)

sample_data

plot(sample_data$Student_Population, sample_data$Quaterly_Sales,
     xlab = "Student Population",
     ylab = "Quaterly Sales",
     main = "Scatter Plot of Student Population vs Quaterly Sales")

par(mfrow=c(1, 2))  # divide graph area in 2 columns
boxplot(sample_data$Student_Population, main="Population", sub=paste("Outlier rows: ", boxplot.stats(sample_data$Student_Population)$out))  # box plot for 'speed'
boxplot(sample_data$Quaterly_Sales, main="Sales", sub=paste("Outlier rows: ", boxplot.stats(sample_data$Quaterly_Sales)$out))  # box plot for 'distance'

lin_model <- lm(Quaterly_Sales ~ Student_Population, data = sample_data)
lin_model
lin_model$residuals

summary(lin_model)

new_values <- data.frame(Student_Population = c(10,15))

predicted_values <- predict(lin_model, newdata = new_values)
predicted_values


qqnorm(lin_model$residuals, main = "Normal")
qqline(lin_model$residuals)

predicted_confidence <- predict(lin_model, newdata = new_values, interval = "confidence")
predicted_confidence

predicted_intervals <- predict(lin_model, newdata = new_values, interval = "predict")
predicted_intervals
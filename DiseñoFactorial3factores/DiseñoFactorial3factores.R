library(readxl)
library(dplyr)
library(tidyr)
library(agricolae)

mydata = read_xlsx("ejemplo09.xlsx")
mydata

arranged_data = pivot_longer(mydata, cols = c("1","2"), names_to = "Factores", values_to = "Valores")
arranged_data

arranged_data = arranged_data[,-which(names(arranged_data) == "Factores")]
arranged_data

results = aov(Valores ~ A*B*C, data = arranged_data)
summary(results)
library(readxl)
library(dplyr)
library(agricolae)
library(tidyr)

mydata = read_xlsx("ejemplo06.xlsx")
mydata

#Es necesario ordenar los datos de mejor manera

arranged_data = pivot_longer(mydata, cols = c("Sistema A", "Sistema B", "Sistema C"), names_to = "Controlador", values_to = "Valores")
arranged_data

results = aov(Valores ~ Controlador + ...1, data = arranged_data)
summary(results)


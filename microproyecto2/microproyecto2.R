library(readxl)
library(dplyr)
library(agricolae)
library(tidyr)

mydata = read_xlsx("microproyecto2.xlsx")
mydata

arranged_data = pivot_longer(mydata, cols = "1":"3", names_to = "Metodo", values_to="Tiempo")
arranged_data

results = aov(Tiempo ~ Metodo + Estudiante, data = arranged_data)
summary(results)

lsdresults = LSD.test(results, "Estudiante")
lsdresults
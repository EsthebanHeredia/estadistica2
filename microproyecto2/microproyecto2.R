library(readxl)
library(dplyr)
library(agricolae)
library(tidyr)

mydata = read_xlsx("microproyecto2.xlsx")
mydata

arranged_data = pivot_longer(mydata, cols = c("1","2","3"), names_to = "Estudiante", values_to="Valores")
arranged_data

results = aov(Valores ~ Estudiante + ...1, data = arranged_data)
summary(results)

lsdresults = LSD.test(results, "Estudiante")
lsdresults
library(readxl)
library(dplyr)
library(tidyr)
library(agricolae)

mydata = read_xlsx("ejemplo08.xlsx")
mydata

arranged_data = pivot_longer(mydata, cols = c("1","2","3","4"), names_to = "Factores", values_to = "Valores")
arranged_data

## Podemos obviar la columna de (1,2,3,4) o eliminarla, porque solo usaremos los factores A y B.

arranged_data = arranged_data[,-which(names(arranged_data) == "Factores")]
arranged_data

results = aov(Valores ~ A*B, data = arranged_data)
summary(results)

lsdresults = LSD.test(results,"A")
lsdresults

lsdresults = LSD.test(results,"B")
lsdresults

lsdresults = LSD.test(results,c("A","B"))
lsdresults

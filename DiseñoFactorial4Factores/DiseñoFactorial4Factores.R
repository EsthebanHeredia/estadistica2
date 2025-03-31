library(readxl)
library(dplyr)
library(tidyr)
library(agricolae)

##En esta solo tenemos una replicación, el diseño factorial no arroja resultados para una replicación porque no existen los residuales. 

mydata = read_xlsx("ejemplo10.xlsx")
mydata

results = aov(Valor ~ A*B*C*D, data = mydata)
summary(results)

#Para esto consideramos solamente algunos factores, solo los que tengan un orden superior.
#Consideremos pues solamente las interacciones de uno y de dos porque estas generalmente tienen más efecto.

results = aov(Valor ~ A + B + C + D + A*B + A*C + A*D + B*C + B*D + C*D, data = mydata)
summary(results)
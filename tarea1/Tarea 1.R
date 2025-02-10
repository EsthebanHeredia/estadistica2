library(readxl)

mydata = read_xlsx("Tarea1Estadistica.xlsx")
mydata

modeloEjeCla = lm (Clasificación ~ Ejecución, data = mydata)
modeloEjeCla

summary(modeloEjeCla)

modeloUsoCla = lm(Clasificación ~ Uso, data = mydata )
modeloUsoCla
summary(modeloUsoCla)

modeloRanCla = lm(Clasificación ~ Rango, data = mydata)
modeloRanCla 
summary(modeloRanCla)

modeloEjeUsoCla = lm(Clasificación ~ Ejecución + Uso, data = mydata)
summary(modeloEjeUsoCla)

modeloEjeRanCla = lm(Clasificación ~ Ejecución + Rango, data = mydata)
summary(modeloEjeRanCla)

modeloUsoRanCla = lm(Clasificación ~ Uso + Rango, data = mydata)
summary(modeloUsoRanCla)

modelo3var = lm(Clasificación ~ Uso + Rango + Ejecución, data = mydata)
summary(modelo3var)
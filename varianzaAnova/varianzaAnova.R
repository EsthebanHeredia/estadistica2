library(readxl)
#instalar las siguientes librerias
library(dplyr)
library(agricolae)
library(tidyr)

#cargar archivo de datos
mydata = read_xlsx("ejemplo05.xlsx")
mydata

#Es necesario organizar los datos de una manera distinta
#para poder realizar el análisis de varianza

data_arrange = pivot_longer(mydata, cols = c("A", "B", "C"), names_to = "Tratamiento", values_to = "Valores")
data_arrange

#Ahora crearemos un modelo de análisis de varianza

results = aov(Valores ~ Tratamiento, data = data_arrange)
summary(results)

#Esto nos devuelve grados de libertad de 2 y 12 para tratamiento y residuals respectivamente en la primera columna.
#Luego esta la suma cuadrada
#luego esta la media de los cuadrados que es la suma partida los grados de libertad
#luego esta el valor F que es la media de los cuadrados de tratamiento dividido por la media de los cuadrados de los residuales
#luego esta el valor p que es la probabilidad de que el valor F sea mayor que el valor observado
#luego esta el valor de significancia
#Si tenemos una significancia de 0.05 y el valor p es menor que 0.05 entonces rechazamos la hipotesis nula
#En este caso el valor p es 0.0001 por lo que rechazamos la hipotesis nula
#Como rechazamos la hipotesis nula entonces hay diferencias significativas entre los tratamientos

#Hagamos un analisis de LSD fischer

#Se mete el modelo y la variable independiente. 

lsdresults = LSD.test(results, "Tratamiento")
lsdresults

#Esto se interpreta con las medias de cada uno de los grupos agrupando las que son estadisticamente iguales en la misma letra



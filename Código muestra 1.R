library(tidyverse)
library(dslabs)

# Cargar el conjunto de datos 'heights' del paquete dslabs
data(heights)

# Ver resumen del conjunto de datos 'heights'
summary(heights)

# 1. Generar un conjunto de datos aleatorios (supongamos que estamos midiendo ingresos)
set.seed(123)  # Fijamos la semilla para obtener resultados reproducibles
datos <- rnorm(100, mean = 50000, sd = 12000)  # Generamos 100 datos con media de 50,000 y sd de 12,000

# 2. Calcular medidas de tendencia central para los ingresos simulados
media <- mean(datos)  # Media
mediana <- median(datos)  # Mediana
moda <- as.numeric(names(sort(table(datos), decreasing = TRUE)[1]))  # Moda (una aproximación)

# Calcular medidas de tendencia central para los datos de alturas
media_alts <- mean(heights$height)
mediana_alts <- median(heights$height)
moda_alts <- as.numeric(names(sort(table(heights$height), decreasing = TRUE)[1]))  # Moda (una aproximación)

# Mostrar medidas de tendencia central para ingresos simulados
cat("Medidas de tendencia central para ingresos simulados:\n")
cat("Media:", media, "\n")
cat("Mediana:", mediana, "\n")
cat("Moda (aproximada):", moda, "\n\n")

# Mostrar medidas de tendencia central para alturas del conjunto de datos 'heights'
cat("Medidas de tendencia central para alturas:\n")
cat("Media:", media_alts, "\n")
cat("Mediana:", mediana_alts, "\n")
cat("Moda (aproximada):", moda_alts, "\n\n")


# 3. Calcular medidas de dispersión
desviacion_estandar <- sd(datos)  # Desviación estándar
varianza <- var(datos)  # Varianza
rango <- range(datos)  # Rango

cat("Medidas de dispersión:\n")
cat("Desviación estándar:", desviacion_estandar, "\n")
cat("Varianza:", varianza, "\n")
cat("Rango:", rango, "\n\n")

# 4. Realizar una prueba de hipótesis: ¿el ingreso medio es mayor que 48,000?
hipotesis_nula <- 48000  # Valor de comparación para la hipótesis nula
t_test <- t.test(datos, mu = hipotesis_nula, alternative = "greater")  # Prueba t unilateral

cat("Resultado de la prueba de hipótesis:\n")
print(t_test)

# 5. Visualización de los datos: histogramas, densidad y boxplots
# Histograma para ingresos simulados
hist(datos, main = "Histograma de Ingresos Simulados", xlab = "Ingresos", col = "lightblue", border = "black")

# Densidad para ingresos simulados
plot(density(datos), main = "Densidad de Ingresos Simulados", xlab = "Ingresos", col = "blue", lwd = 2)

# Boxplot para los ingresos simulados
boxplot(datos, main = "Boxplot de ingresos simulados", ylab = "Ingresos")

# Boxplot para las alturas
boxplot(heights$height, main = "Boxplot de Alturas", ylab = "Alturas", col = "lightgreen")

# Boxplot de alturas divididas por sexo
boxplot(heights$height ~ heights$sex, 
        main = "Boxplot de Alturas por Sexo", 
        xlab = "Sexo", 
        ylab = "Alturas", 
        col = c("lightblue", "red3"))

# Notas:
# - heights$height es la variable de altura.
# - heights$sex es la variable categórica que define los grupos (masculino y femenino).
# - 'col' utiliza diferentes colores para cada grupo.

# Histograma para las alturas
hist(heights$height, main = "Histograma de Alturas", xlab = "Altura", col = "lightblue", border = "black")

# Densidad para las alturas
plot(density(heights$height), main = "Densidad de Alturas", xlab = "Altura", col = "green", lwd = 2)


# 5. Calcular la potencia estadística para un tamaño de muestra y diferencia de medias (Cohen's d)
# Supongamos que la diferencia mínima que queremos detectar es 2,000 (digamos, pesos o dólares)

library(pwr) #Carguemos un paquete que tiene funciones de determinar poder.

# Supongamos que estamos interesados en probar si la media de una muestra es 
# significativamente mayor que un valor dado.
# En este caso, queremos calcular el poder estadístico y el tamaño de muestra 
# necesario para detectar una diferencia
# mínima en los ingresos (diferencia de $2000) con un nivel de significancia del 5%.

# Diferencia mínima que queremos detectar
diferencia_minima <- 2000

# Desviación estándar de los datos simulados (se calcula previamente en tu análisis)
# Aquí se supone que ya hemos calculado la 'desviacion_estandar'
# Este valor podría variar en función de los datos reales o simulados.
desviacion_estandar <- 12000  # Ejemplo de desviación estándar

# Calculamos el tamaño del efecto (Cohen's d)
# El tamaño del efecto se define como la diferencia entre las medias, 
#  dividida por la desviación estándar.
tamaño_efecto <- diferencia_minima / desviacion_estandar

# Paso 1: Calcular la potencia estadística para una muestra de tamaño 100
# Queremos calcular qué tan potente sería un estudio con 100 observaciones 
# para detectar esta diferencia mínima
potencia <- pwr.t.test(n = 100,                  # Tamaño de muestra
                       d = tamaño_efecto,       # Tamaño del efecto (Cohen's d)
                       sig.level = 0.05,         # Nivel de significancia (α)
                       type = "one.sample",      # Prueba t de una muestra
                       alternative = "greater")  # Prueba unilateral (esperamos un aumento)

# Imprimimos los resultados de la potencia estadística
cat("\nPotencia estadística (para n=100):\n")
print(potencia)

# Anotación:
# Este cálculo nos indica cuál sería la potencia de un estudio con 100 observaciones para detectar
# una diferencia mínima de $2000 entre la media de los ingresos observados y el valor esperado, 
# con un nivel de significancia del 5%.Específicamnte dice que el efecto esperado
# la d de Cohen es débil o pequeño. La potencia será de 50%. Pero queremos que sea 80%.
# la línea de 'alternative' dando greater dice que es unilateral (la hipótesis iba en una dirección)

# Paso 2: Calcular el tamaño de muestra necesario para alcanzar una potencia de 0.80
# En este paso, queremos saber cuántas observaciones necesitamos para subir la potencia al 80%
muestra_necesaria <- pwr.t.test(power = 0.80,                # Potencia deseada
                                d = tamanio_efecto,          # Tamaño del efecto (Cohen's d)
                                sig.level = 0.05,            # Nivel de significancia (α)
                                type = "one.sample",         # Prueba t de una muestra
                                alternative = "greater")     # Prueba unilateral

# Imprimimos el tamaño de muestra necesario para lograr una potencia de 0.80
cat("\nTamaño de muestra necesario para una potencia de 0.80:\n")
print(muestra_necesaria)

# Este cálculo nos da el número mínimo de observaciones necesarias para alcanzar 
# un 80% de potencia con un tamaño de efecto de $2000 y una desviación estándar 
# de $12000, manteniendo un nivel de significancia del 5%.

#Otro ejercicio sobre poder.

# Digamos que queremos determinar cuántos lanzamientos de pesetas necesitamos 
# para detectar si una peseta cae con cara el 75% del tiempo en lugar del 50% 
# esperado, es decir, para detectar si tiene truco.

# En este caso haremos una prueba de proporciones unilaterales.

# Cálculo del tamaño del efecto
# ES.h es la función que calcula el tamaño del efecto para proporciones.
# h es el valor que representa la diferencia entre las proporciones transformadas con el arcoseno.
efecto <- ES.h(p1 = 0.75, p2 = 0.50)

# Definimos el nivel de significancia (alfa), que es la tolerancia que tenemos para cometer un error tipo I.
nivel_significancia <- 0.05

# Queremos un poder del 80%, es decir, una probabilidad del 80% de detectar un efecto real.
potencia_deseada <- 0.80

# Usamos la función pwr.p.test para calcular el tamaño de muestra necesario.
resultado <- pwr.p.test(h = efecto,                # Tamaño del efecto (diferencia entre las proporciones)
                        sig.level = nivel_significancia,  # Nivel de significancia
                        power = potencia_deseada,  # Potencia deseada
                        alternative = "greater")   # Prueba unilateral (especificamos que esperamos que el valor sea mayor)

# Mostramos los resultados
print(resultado)

# Anotación:
# El valor que obtenemos de n (22.55, digamos 23) es el número mínimo de 
# observaciones (en este caso,lanzamientos de la peseta) que necesitamos 
# para tener un 80% de potencia y detectar si la moneda cae el 75% de las veces con cara.

# Visualización del poder en función del tamaño de muestra
# plot() permite visualizar cómo cambia el poder si variamos el tamaño de la muestra.
plot(resultado)

# Notas sobre la interpretación:
# El gráfico generado nos permite ver que con un tamaño de muestra mayor al 
# mínimo necesario, la potencia aumenta.
# Siempre es importante contar con suficiente poder para evitar errores tipo II 
# (no detectar un efecto real).

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
boxplot(datos, main = "Boxplot de Ingresos Simulados", ylab = "Ingresos")

# Boxplot para las alturas
boxplot(heights$height, main = "Boxplot de Alturas", ylab = "Alturas", col = "lightgreen")

# Histograma para las alturas
hist(heights$height, main = "Histograma de Alturas", xlab = "Altura", col = "lightblue", border = "black")

# Densidad para las alturas
plot(density(heights$height), main = "Densidad de Alturas", xlab = "Altura", col = "green", lwd = 2)

# 5. Calcular la potencia estadística para un tamaño de muestra y diferencia de medias (Cohen's d)
# Supongamos que la diferencia mínima que queremos detectar es 2,000

library(pwr)

diferencia_minima <- 2000
tamanio_efecto <- diferencia_minima / desviacion_estandar  # Calculamos el tamaño del efecto
potencia <- pwr.t.test(n = 100, d = tamanio_efecto, sig.level = 0.05, type = "one.sample", alternative = "greater")

cat("\nPotencia estadística:\n")
print(potencia)

# 6. Calcular el tamaño de muestra necesario para alcanzar una potencia de 0.80 con el mismo efecto
muestra_necesaria <- pwr.t.test(power = 0.80, d = tamanio_efecto, sig.level = 0.05, type = "one.sample", alternative = "greater")

cat("\nTamaño de muestra necesario para una potencia de 0.80:\n")
print(muestra_necesaria)
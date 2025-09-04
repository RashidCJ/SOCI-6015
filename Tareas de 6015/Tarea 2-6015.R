# SOCI 6015                     #
# Nombre:                       #
# Apellidos:                    #
# Tarea 2: Inicios de R         #
# Instrucciones ---------------------------------------------------

#En esta tarea harán lo siguiente
# 1. Guardar esta tarea, cambiando el nombre de Tarea2-6015.R
# a Apellido1-Apellido2-Tarea2-6015.R 
# 2. Completar las próximas secciones, guardando la secuencia
# de comandos que usaron para cumplir con lo pedido. A modo de ejemplo
# dejo una parte ya hecha. Continúen desde ahí con sus cambios.

# Parte 0: Cargar datos ---------------------------------------------------
# activarán el paquete 'dslabs', y pedirán con función para datos preguardados
# 'murders', que cubre la cantidad de asesinatos en EEUU por armas de fuego en
# el año 2010. Se recomienda setear aquí el directorio de trabajo.

library(dslabs) 
library(tidyverse) # de una vez lo activo porque lo usarán.
data("murders") # cargan los datos.
setwd("/dirección/hacia/carpeta-de-trabajo/") # Cambien esta línea por la dirección de su carpeta de trabajo

# Parte 1: Revisión y manipulación inicial de datos -----------------------
# 1. Visualicen las primeras seis filas usando el comando adecuado.
head(murders)
# 2. Creen una variable adicional a las existentes, la tasa de asesinatos
# esta debe ser por 100,000 habitantes. El nombre de la variable les toca 
# a ustedes decidir


# Parte 2: Creación de un objeto ------------------------------------------

# 1. Crearán un objeto donde se almacene el nombre del estado con MAYOR
# tasa de asesinatos por 100,000 habitantes.

# 2. Crearán otro objeto donde se almacene el nombre del estado con MENOR
# tasa de asesinatos por 100,000 habitantes.

# 3. ¿Qué estados son estos? En comentario indiquen el nombre de los estados
# con mayor y menor tasa de asesinatos por 100,000 habitantes.

# Parte 3: Estadísticas de resumen -----------------------------------------

# 1. Creando una función propia, nueva. Creen una función que genere resúmenes de datos como
# media, mediana, desviación estándar, mínimo, máximo o el rango intercuartil. 
# Esta función debe recibir un vector numérico y devolver un marco de datos o dataframe. 
# revisen el texto de Irizarry para pistas.

# 2. Usando summarise de dplyr (parte del tidyverse), generarán un resumen usando
# datos de las tasas de homicidios generado de los datos del banco de datos de
# murders, con group_by de región. Inicio con el esqueleto de los comandos.

murders |> 
  group_by() |>
  summarise()

# Parte 4: Creación de una imagen -----------------------------------------
# 1. Crearán una imagen para representar los asesinatos de estas jurisdicciones
# esta imagen podrá ser un diagrama de caja, un histograma, o un diagrama de
# dispersión.

# 2. Guardarán esta imagen como 'ImagenTarea2.png'. La enviarán, junto al script
# de R modificado, con todas las funciones escritas, tal que yo pueda reproducir
# lo que hicieron de principio a fin en mi ordenador personal.




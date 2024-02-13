---
title: "Trabajo Andrés Lara Romero De Ávila"
author: "Andrés Lara Romero De Ávila"
date: "`r Sys.Date()`"
output:
  pdf_document: default
  html_document: default
warnings: no
message: no
lang: "es-ES"
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE, warning=FALSE, message=FALSE)
```

# **`Descripción de los datos`**

La base de datos utilizada trata sobre diferentes accidentes en carretera. Los datos datan de 2016 y el lugar donde se produjeron los accidentes fue Reino Unido. La base de datos se encuentra en kaggle en el siguiente enlace: <https://www.kaggle.com/datasets/bluehorseshoe/uk-2016-road-safety-data?select=dftRoadSafety_Accidents_2016.csv>. La base de datos como comenta el usuario que la subió pertenece al apartado de transporte del gobierno de Reino Unido. Esta página contiene gran cantidad de recursos para entrenamiento en machine learning e incluso tiene actualizados, a partir de esta clase de datos estudios en los que explican las zonas y las condiciones en las que se producen mayor cantidad de accidentes para prevenir a los ciudadanos . La interpretación de los atributos de la tabla la he realizado gracias la explicación de las distintas opciones de cada variable que vienen en kaggle, pues no he encontrado ningún glosario.

Entre las columnas encontramos:

-   Fallecido: implica si hubo fallecidos

    0.  No hubo fallecidos

    <!-- -->

    1.  Hubo al menos un fallecido

-   Numero_Vehiculos : El número de vehículos implicados en el accidente. Este número puede ir desde un solo vehículo implicado hasta un máximo de 16 vehículos.

-   Numero_Afectados : Número de heridos (victimas o con lesiones) afectados por el accidente. Esta es una variable cuantitativa cuyo valor mínimo es cero afectados y el máximo es 60.

-   Tipo_Via_Principal: Indica el tipo de vía donde se produjo el accidente. Sus valores pueden ser:

    1.  Autovía
    2.  Autovía de tipo A
    3.  Carretera General del estado
    4.  Carretera tipo B
    5.  Carretera tipo C
    6.  No clasificado

-   Especificación_Via: Indica algún detalle relevante sobre la vía principal.

    1.  Rotonda
    2.  Calle de un solo carril
    3.  Carretera con dos carriles

    <!-- -->

    6.  Carretera con un carril
    7.  Carril de aceleración o deceleración

    <!-- -->

    9.  Desconocido

-   Límite de velocidad: Indica el límite máximo de velocidad permitido en la vía donde se produjo el accidente. Las unidades son millas por hora.

-   Detalles de cruce: Indica información adicional en el caso de que en la zona del accidente había un cruce

    0.  No hay cruce o lo hay a al menos a 20 metros
    1.  Rotonda
    2.  Mini-rotonda
    3.  Intersección en forma de codo

    <!-- -->

    5.  Carril de deceleración o aceleración
    6.  Cruce de carreteras
    7.  Más de 4 vías sin rotonda
    8.  Entrada privada
    9.  Otro cruce

-   Organización_Control_Cruce_Persona: Nos indica si existe alguna organización como policia o protección civil que se encargue del paso de peatones en la vía del accidente.

    0.  No hay nada en al menos 50 metros
    1.  Control escolar por una patrulla
    2.  Control por otra organización autorizada

-   Facilidades_Cruce_Personas: Indica si hay alguna infrastructura que facilite el paso de peatones en la zona.

    0.  No hay en al menos 50 metros
    1.  Paso de zebra

    <!-- -->

    4.  "Paso de pelícano": paso de zebra controlado por semáforos.
    5.  Semáforo para peatones

    <!-- -->

    7.  Puente o tunel
    8.  Refugio central: zona segura entre carriles de coches

-   Condiciones lumínicas: sus posibles valores son:

    1.  Luz del día

    <!-- -->

    4.  Oscuridad con luz artificial
    5.  Oscuridad sin luz artificial encendida aún
    6.  Oscuridad sin dispositivos lumínicos
    7.  Oscuridad y desconocimiento de luces

-   Condiciones climatológicas:

    1.  Bueno, sin vientos fuertes
    2.  Lloviendo sin fuertes vientos
    3.  Nevando sin fuertes vientos
    4.  Bien pero vientos fuertes
    5.  Lloviendo con vientos fuertes
    6.  Nevando con fuertes vientos
    7.  Niebla
    8.  Otro
    9.  Desconocido

-   Condiciones superficie via: Indica las condiciones de la parte superficial de la via en el momento del accidente.

    1.  Seco
    2.  Húmedo o mojado
    3.  Nevado
    4.  Helado
    5.  Inundación por encima de los 3cm
    6.  Aceite o combustible
    7.  Barro

-   Zona urbana o rural: Indica si la zona del acontecimiento pertenecía a una zona rural o urbana

    1.  Urbana
    2.  Rural
    3.  Desubicada

-   Tipo de vehiculo:

    1.  Vehículo a pedal
    2.  Motocicleta inferior a 50cc
    3.  Motocicleta inferior a 125cc
    4.  Motocicleta superior a 125cc y por debajo de 500cc
    5.  Motocicleta superior a 500cc

    <!-- -->

    8.  Taxi y coche privado o alquilado
    9.  Coche
    10. Minibus
    11. Autobus

    <!-- -->

    16. Caballo
    17. Vehiculo agrícola
    18. Tranvía
    19. Caravana
    20. Camión entre 3.5 y 7.5 toneladas
    21. Camión mayor a 7.5 toneladas
    22. Scoter
    23. Motocicleta eléctrica

    <!-- -->

    90. Otro

    <!-- -->

    97. Motocicleta sin conocer sus cc
    98. Camión de mercancias sin conocer su peso

-   Maniobra del vehículo: Indica la maniobra que realizaba el vehículo en el momento del accidente.

    1.  Marcha atrás
    2.  Aparcado
    3.  Esperando para salir
    4.  Decelerando o patando
    5.  Apartándose
    6.  Haciendo un cambio de sentido
    7.  Girando izquierda
    8.  Esperando para girar a la izquierda
    9.  Girando a la derecha
    10. Esperando para girar a la derecha
    11. Cambiando al carril derecho
    12. Cambiando al carril izquierdo
    13. Apartando un vehículo en movimiento fuera de la carretera
    14. Apartando un vehículo parado fuera de la carretera

-   Localización cruce : Indica donde se encontraba el cruce respecto a la zona del accidente

    0.  No había en al menos 20 metros
    1.  Intersección o esperando entrar al cruce
    2.  Intersección depejada o esperando a salir de ella
    3.  Saliendo de una rotonda
    4.  Entrando a una rotonda
    5.  Dejando la carretera principal
    6.  Entrando a la carretera principal
    7.  Entrando desde un carril de aceleración
    8.  En mitad de una intersección o de una rotonda

-   Primer punto de impacto: Nos indica donde se produjo el primer impacto que recibió el vehículo implicado

    0.  No impactó
    1.  Choque frontal
    2.  Alcance
    3.  Choque al lateral del vehículo
    4.  Rozando alguna parte

-   Objetivo del viaje : Objetivo que tenía el viaje para el conductor principal.

    1.  Viaje de trabajo
    2.  Traslado al puesto de trabajo
    3.  Llevando a los niños al colegio
    4.  Adolescentes conduciendo a casa
    5.  Otro
    6.  Desconocido

-   Sexo del conductor:

    1.  Masculino
    2.  Femenino
    3.  Desconocido

-   Edad del conductor

-   Clase afectado: Indica el rol del implicado en el accidente.

    1.  Conductor
    2.  Pasajero
    3.  Peatón

-   Sexo del afectado :

    1.  Masculino
    2.  Femenino
    3.  Desconocido

-   Edad del afectado

-   Fallecido

    0.  No hubo fallecidos
    1.  Hubo al menos un fallecido

Con estos atributos intentaremos resolver las preguntas:

-   ¿Hay algún patrón para los accidentes que involucre a los diferentes usuarios de la vía?

-   ¿Podemos predecir el momento más seguro para salir a la carretera?, ¿Y el más peligroso?

-   ¿Puede esta información ayudar a los diferentes conductores para poder predecir las zonas, días, etc donde se producen la mayoría de accidentes?

-   ¿Son algunos vehículos más propensos a los accidentes que otros?

# Limpiar datos

En primer lugar voy a convertir todos los archivos .csv a data frame y luego los voy a concatenar según el índice del accidente en la tabla data. Aunque a priori hay celdas vacias y valores a nulos pero luego los quitaremos.

```{r}
data <- read.csv("dftRoadSafety_Accidents_2016.csv")
veh <- read.csv("veh.csv")
cas <- read.csv("Cas.csv")
data <- merge(merge(data, veh, by = "Accident_Index"), cas, by = "Accident_Index")
```

```{r}
class(data)
```

Vemos que la clase de nuestra tabla ya es un data frame

```{r}
str(data)
```

En nuestra base de datos encontramos que hay 32 columnas y 136621 filas (accidentes).

Ahora vamos a comenzar a limpiarla

```{r}
#Eliminamos las variables que no podemos utilizar
data <- subset(data, select = -c(1,2,3,4,5,6,12,13,14,16,22,28,31,32,33,35,37,39,40,41,42,44,48,49,50,52,53,54,55,56,60,61,62,63,64,65,66,67,68,69))

#Cambiar el nombre de las columnas
colnames(data) <- c("Gravedad_Accidente","Numero_Vehiculos,","Numero_Afectados","Fecha","Dia_Semana","Tipo_Via_principal","Especificacion_Via","Limite_Velocidad","Detalles_cruce","Control_Cruce","Tipo_Via_Secundaria","Organizacion_Control_Cruce_Personas","Facilidades_Cruce_Personas","Condiciones_Luminicas","Condiciones_Climatologicas","Condiciones_Superficie_Via","Imprevistos","Zona_Urbana_Rural","Tipo_Vehiculo","Maniobra_Vehiculo","Localizacion_Cruce","Primer_Punto_Impacto","Objetivo_Viaje","Sexo_Conductor","Edad_Conductor","Edad_Vehiculo","Clase_Afectado","Sexo_Afectado","Edad_Afectado")

#Vamos a comprobar la parte superficial de los datos
str(data)
```

Comenzamos viendo que aun quitando las variables que no nos sirven hay que modificar algunas columnas para poder utilizarlas en los algoritmos.

```{r}
summary(data)

```

```{r}
dim(data)
```

Ahora ya nos quedamos solo con 18 columnas de las cuales solo hay 1 respuesta que es la gravedad del accidente y todas las demás son explicativas.

Vamos a convertir la variable límite de velocidad en entero para que detecte si hay valores vacios o nulos.

```{r}
#Convertimos también la velocida máxima permitida en entero
data$Limite_Velocidad <- as.integer(data$Limite_Velocidad)

table(factor(data$Limite_Velocidad))
```

```{r}

#Vamos a comprobar también si hay algún dato vacio, con null
anyNA(data)
```

Vemos que hay algunos valores tipo NA

```{r}
#Vamos a comprobar en que columna están los datos vacios
colSums(is.na(data))
```

Los datos vacios se encuentran en la columna Límite de velocidad y al tener tantas filas lo más conveniente es eliminarlos.

```{r}
data <- data[complete.cases(data), ]

#Volvemos a comporbar que valores son NA
colSums(is.na(data))

```

Como vemos ya hemos eliminado las filas que contenían valores vacios. Vamos a comprobar también si hay valores nulos en la tabla.

```{r}
is.null(data)
```

No hay valores nulos.

```{r}
str(data$Fecha)
```

Al tener la variable fecha como caracter no la podemos utilizar para el estudio por lo que nos vamos a quedar con los meses para estudiar si un accidente en un mes determinado importa en su gravedad. El año es el mismo por lo que no va a explicar nada, y el día es complicado pues se vuelven a repetir cada mes y por tanto es dificil diferenciarlos con el mes

```{r}
data$Fecha <- as.Date(data$Fecha, format = "%d/%m/%Y")

# Extraer los meses de la columna "fecha"
data$Mes <- format(data$Fecha, format = "%m")
#Convertimos los meses en entero
data$Mes <- as.integer(data$Mes)

#Convertida la variable fecha la eliminamos
data <- subset(data, select = -c(Fecha))

#Ahora voy a colocar la variable mes
Mes <- data$Mes
data <- subset(data, select = -c(Mes))
data <- cbind(data[, 1:4], Mes, data[, 5:ncol(data)])

#Comprobamos la variable
table(factor(data$Mes))
```

Voy a convertir todos los datos con un -1 a valores de tipo NA para que podamos limpiarlos tratar con ellos y si queremos asignarle la mediana o moda.

```{r}
data[data == -1] <- NA
```

# Convertir variable respuesta

Vamos a separar el archivo según la columna de gravedad del accidente. Vamos a dividir los accidentes entre los que tuvieron fallecidos y los que no pues estos primeros nos interesan más, y el resultado lo introducimos en una variable (Fallecidos) en la que representamos con un 1 sí que hay fallecidos y con un 0 lo no hubo ningún fallecido. En este caso hay que comprobar la variable Gravedad del accidente pues es la que nos dice si algún individuo murió. Esta variable puede presentar 3 valores los cuales son:

-   1 : Hubo más de un fallecido

-   2 : El accidente fue importante pues hubo heridos graves y algún fallecido

-   3 : El accidente ha sido leve

```{r}
#Vamos a dividir las tuplas en dos con la nueva variable Gravedad_Accidente
data$Fallecido <- ifelse(data$Gravedad_Accidente > 2, "0", "1")

#Al dividir las tuplas ya no hace falta la variable gravedad_Accidente pues es explicativa por lo que la borramos
data <- subset(data, select = -c(Gravedad_Accidente))

#Convertimos la variable a entero
data$Fallecido <- as.factor(data$Fallecido)

#Vamos a ver el resultado
table(data$Fallecido)

```

Como vemos la mayoría de los casos estudiados implicaron al menos un fallecido.

# Comprobar las variables y sus valores

Esto lo realizo para poder comprender mejor las variables de cara a su uso posterior en el estudio.

Vamos a comprobar una visión general del resultado de limpiar los datos

```{r}
str(data)
```

Todas las variables de nuestra tabla son de tipo entero.

Vamos a comprobar todas las variables individualmente:

```{r}
library(ggplot2)
qplot(data$Numero_Vehiculos)
```

Como vemos hay mucha diversidad en los resultados pero la mayoría de accidente implicaron uno, dos o tres coches como máximo.

```{r}
table(data$Numero_Afectados)
```

Como vemos en la mayoría de los accidentes solo hubo un implicado en el accidente. A este valor le siguen 2 afectados posteriormente 3.

```{r}
library(ggplot2)
qplot(data$Dia_Semana)
```

El número de accidentes por día de la semana es muy similar en los 7, por lo que seguramente esta variable no ofrezca mucha información. Como tenemos variables de sobra la quitamos.

```{r}
data <- subset(data, select = -c(Dia_Semana))
```

```{r}
qplot(data$Mes)
```

Al mes le ocurre lo mismo que al día de la semana, y es que para todos los meses hubo un número muy parecido de accidentes por lo que esta variable tampoco explicará mucho. La quitamos también.

```{r}
data <- subset(data, select = -c(Mes))
```

```{r}
table(data$Tipo_Via_principal)
```

En la variable tipo de vía tenemos como campeón en cuanto a cantida de accidentes al valor 3 que consiste en carreteras de tipo A que son parte de la red de carreteras principales y que se consideran las vías más importantes y de mayor capacidad. Estas suelen ser autopistas o carreteras principales con múltiples carriles y están diseñadas para el tráfico de larga distancia y alta velocidad. A esta categoría le siguen las carreteras de tipo B que consisten en carreteras que conectan zonas rurales, pueblos y ciudades pequeñas.

```{r}
table(data$Especificacion_Via)
```

En este caso el que contiene mayor número de valores es en el tipo 6 que representa las carreteras de un solo carril, es decir, que cada sentido tiene un solo carrill. A este valor le sigue el 3 que representa a las carreteras con dos carriles por sentido como las autovías y autopistas.

```{r}
table(data$Limite_Velocidad)
```

```{r}
library(ggplot2)
qplot(data$Limite_Velocidad, geom = "histogram")
```

En el límite de velocidad los valores más repetidos son las vías de 30 millas por hora seguido de las vías de 60 millas/hora. Esto quiere decir que la mayoría de los accidentes se concentra en velocidades medias-bajas.

```{r}
qplot(data$Detalles_cruce)
```

En este caso en accidentes no había cruce o lo había a 20 metros o más, y el otro valor que más aparece es el 3 que corresponde con una intersección o cruce escalonado, es decir, un tipo de intersección que se realiza cuando las vías que se cruzan no están en una alineación directa sino que están desplazadas unas de otras.

```{r}
table(data$Control_Cruce)
```

El claro nivel en el control de cruce es el número 4 que consiste en un cruce el cual no tiene ninguna señalización para controlar el paso de los vehículos, seguido del valor -1 que hace referencia a que en ese accidente el dato no se tuvo en consideración. Esta variable no va a explicar mucho por lo que la podemos quitar al tener variables de sobra.

```{r}
data <- subset(data, select = -c(Control_Cruce))
```

```{r}
prop.table(table(factor(data$Tipo_Via_Secundaria))) * 100
```

En cuanto a las vías secundarias que aparecen en el suceso, en el 41% de los sucesos no había ninguna vía secundaria, y en el 40% no se tomo nota sobre este campo. Como en este caso en gran parte de los datos no está recogido el dato eliminamos la variable.

```{r}
data <- subset(data, select = -c(Tipo_Via_Secundaria))
```

```{r}
table(data$Organizacion_Control_Cruce_Personas)
```

Esta variable hace referencia a si existe algún organismo humano para controlar el cruce de personas por la vía como puediera ser la policia o protección civil. Podemos ver que en la mayoría de casos no existe ningun organismo encargado de esto y por lo tanto podrá ser una dato relevante de cara al estudio.

```{r}
table(factor(data$Facilidades_Cruce_Personas))
```

En cuanto a las facilidades para el paso de personas encontramos que en la mayoría de casos no había ningún tipo de infrastructura para el paso de peatones en al menos 50 metros, aunque en algunos casos encontramos que había semáforos habilitados con paso de peatones.

```{r}
table(data$Condiciones_Luminicas)
```

Las condiciones lumínicas en la mayoría de los casos son del caso 1 que indica que el accidente fue de día, es decir, con luz diurna. También tenemos otros cuantos con el valor 4 que indica que el accidente fue en unas condiciones nocturnas pero con luces encendidas de por medio, es decir, que puede ser en una zona donde haya farolas u otro tipo de luz artificial.

```{r}
table(data$Condiciones_Climatologicas)
```

En la gran mayoría de los casos, las condiciones climatológicas fueron normales, es decir, un día sin lluvias y con viendo moderado o calmado. Esta variable puede ser también de gran utilidad para el estudio.

```{r}
table(data$Condiciones_Superficie_Via)
```

En el caso de la variable que indica el estado de la vía, la mayoría de los casos indican que el asfalto estaba seco (valor 1), y a esto le siguen otros cuantos sucesos con piso mojado o húmedo(valor 2).

```{r}
table(data$Imprevistos)
```

En el caso de los improvistos no explica mucho, pues en la gran mayoría de los casos no hubo ningún imprevisto en el momento del accidente. Esta variable la voy a quitar porque no hay mucha información sobre ella.

```{r}
data <- subset(data, select = -c(Imprevistos))
```

```{r}
table(data$Zona_Urbana_Rural)
```

Podemos ver que la mayoría de los accidentes se produjeron en entornos urbanos(valor 1) aunque también hubo muchos de ellos en entornos rurales (valor 2). Esta variable puede sernos de gran utilidad para entrenar el modelo

```{r}
table(data$Tipo_Vehiculo)
```

El tipo de vehículo puede ser información diferencial para un accidente fatal y además en nuestro caso existe una gran heterogeneidad pues hay muchos valores diferentes. La gran cantidad de vehículos implicados son cohces.

```{r}
table(data$Maniobra_Vehiculo)
```

Esta variable contiene los valores muy repartidos y puede ser de gran utilidad, pues representa la maniobra que realizaba el vehículo a la hora del accidente.

```{r}
table(data$Localizacion_Cruce)
```

```{r}
table(data$Primer_Punto_Impacto)
```

Esta variable puede ser de gran ayuda también para determinar si hay algún fallecido, pues por ejemplo un golpe frontal puede ser practicamente mortal.

```{r}
table(data$Objetivo_Viaje)
```

El objetivo del viaje puede aportar información en el sentido del estádo de ánimo del conductor, por ejemplo, un conductor que vaya al trabajo y que encima haya un atasco puede tener una probabilidad mayor de accidente que un conductor que vaya de vacaciones.

```{r}
prop.table(table(data$Sexo_Conductor, data$Fallecido)) *100
```

Utilizando una tabla de doble entrada podemos ver mejor si realmente el sexo del conductor depende a la hora de tener un accidente grave. En este caso vemos que en proporción a la cantidad de hombres o mujeres, son más los hombres que tienen un accidente con muertos, con más o menos 1/4 de probabilidad, que las mujeres las cuales presentan 1/6 de probabilidad.

```{r}
table(data$Edad_Conductor)
```

Como vemos la edad del condcutor hay valores que no son muy lógicos por lo que vamos a quitar todas aquellas filas cuyos valores sean menores que 14 años, pues aunque no exista un carnet con esa edad pero si que un niño de 14 años está capacitado para conducir un vehículo.

```{r}
data <- subset(data, Edad_Conductor >= 14)
qplot(data$Edad_Conductor)
```

Ahora esta variable tiene más sentido y la podemos utilizar sin problemas.

```{r}
qplot(data$Edad_Vehiculo)
```

```{r}
table(data$Clase_Afectado)
```

Esta variable indica el rol del afectado, es decir, que este podía ser conductor, pasajero o peatón respectivamente.

```{r}
table(data$Sexo_Afectado)
```

```{r}
qplot(data$Edad_Afectado)
```

Vemos que la edad de los afectados es muy dispar y por tanto puede ser de gran utilidad para el estudio.

# Corregir valores NA

Ahora vamos a corregir todas las variables a las que les hemos quitado el valor -1 para convertirlo en NA y que así no aparecieran en el estudio con el valor -1.

```{r}
colSums(is.na(data))
```

En todos los casos salvo en la edad del vehículo hay pocos valores 'NA' por lo que vamos a eliminarlos y la variable de edad_vehículo la quitamos porque tenemos suficientes variables.

```{r}
condicion <- complete.cases(data[, -20])
data <- data[condicion, ]
colSums(is.na(data))
```

Ahora ha corregido todos los valores 'NA' menos los de la columna de la edad del vehículo.

```{r}
data <- subset(data, select = -c(Edad_Vehiculo))

```

Filamente las dimensiones de la tabla son:

```{r}
dim(data)
```

# División de datos

Vamos a comenzar dividiendo nuestros datos en la parte de entrenamiento y la parte de test. La proporción será de 70% para el entrenamiento y 30% para el test, y en ningún momento se podrá filtrar información de los datos de test a los del entrenamiento. En primer lugar también vamos a fijar una semilla para que siempre nos haga la misma división.

```{r}
library(caret)

set.seed(100)
muestra <- createDataPartition(data$Fallecido, p = .70, list = FALSE)

train.accidentes=data[muestra,]
test.accidentes=data[-muestra,]

dim(train.accidentes)
dim(test.accidentes)

prop.table(table(train.accidentes$Fallecido))
prop.table(table(test.accidentes$Fallecido))
```

# Entrenamiento del modelo

Para poder comparar correctamente el modelo entrenado por cada algoritmo hay que asegurar que se utilizan las mismas particiones de datos para todos los algoritmos a utilizar. Vamos a crear nuestras particiones con la función create folds de la librería caret. Vamos a utilizar en nuestro caso 5 folds:

```{r}
#Primero fijamos la semillas para que siempre nos de el mismo resultado
set.seed(100)
modelos <- createFolds(train.accidentes$Fallecido, k = 5)

trainControl <- trainControl(method = "cv", number = 5, index = modelos)
```

# Random Forest

El primer algoritmo que voy a utilizar es random forest. En primer lugar voy a crear un objeto llamado caret y dentro de el contendra instancias de los diferentes algoritmos.

```{r}
install.packages("randomForest")
library(randomForest)
library(caret)


RF<- train(Fallecido ~ ., data = train.accidentes,
method = "rf",
tuneLength = 5,
trControl = trainControl,
metric = "Accuracy")

RF

plot(RF)
```

# Suport Vector Machine

```{r}
SVM <- train(Fallecido ~ .,
                   data = train.accidentes,
                   method = "svmRadial",
                   preProcess = c("center", "scale"),
                   trControl=trainControl,
                   tuneLength = 10)

SVM

plot(SVM)
```

# Naive Bayes

```{r}
NaiveB <- train(Fallecido ~ .,
                   data = train.accidentes,
                   method = "naive_bayes",
                   preProcess = c("center", "scale"),
                   trControl=trainControl)

NaiveB

plot(NaiveB)
```

# Comparando los modelos

Vamos por último a comparar los modelos de entrenamientos realizados anteriormente

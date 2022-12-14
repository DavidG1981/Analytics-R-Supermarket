# Tratamiento de datos
# ==============================================================================
library(dplyr)
library(tidyr)
library(skimr)
library(ISLR)

# Gr?ficos
# ==============================================================================
library(ggplot2)
library(ggpubr)
library(rpart)
library(rpart.plot)
library(dlookr)
library(plotly)
library(hrbrthemes) # temas/colores de ggplot2
library(gridExtra) # crear composiciones de im?genes con ggplot2
library(grid) # poner textos dentro de la composici?n de plots

# Correlaci?n
library(Hmisc)
library(GGally) # matrix plot por grupos
library(ggstatsplot) # graficos para publicaciones

# Modelos estad?sticos:
library(MASS)
library(glmulti)

# Machine learning supervisado
library(caret)

# Pintar arboles de decision
library(rattle)
#Leemos los datos:
supermarket <- read.csv("Curso Analisis de Datos/KAGGLE/supermarket_sales.csv")
datos = supermarket

#Nombres de las columnas y filas:
colnames(supermarket)
row.names(supermarket)

#Letura de las diez primeras y ?ltimas filas:
head(supermarket, 10)
tail(supermarket, 10)

# Tipos de varibales. Construimos un data frame con el nombre de las variables y la columnas que corresponde:
aux = as.data.frame(t(t(sapply(supermarket, class))))
colnames(aux) <- "Tipo de Variable"
aux$Numero_Columna = seq(nrow(aux))
aux

# Ejemplo de cambiar numerica a factor = cualitativa
supermarket$Sucursal <- as.factor(supermarket$Sucursal)
supermarket$Tipo_Cliente <- as.factor(supermarket$Tipo_Cliente)
supermarket$Forma_Pago <- as.factor(supermarket$Forma_Pago)
supermarket$Fecha <- as.character(supermarket$Fecha)
supermarket$Genero <- as.factor(supermarket$Genero)

# Ordenar los niveles dentro de un factor
supermarket$Sucursal <- factor(supermarket$Sucursal, levels = c("A", "B","C"))
supermarket$Tipo_Cliente <- factor(supermarket$Tipo_Cliente, levels = c("Member", "Normal"))
supermarket$Forma_Pago <- factor(supermarket$Forma_Pago, levels = c("Cash", "Ewallet","Credit card"))
supermarket$Genero <- factor(supermarket$Genero, levels = c("Male", "Female"))

skim(supermarket)

# Explorar los tipos de variables y valores perdidos:
plot(overview_na(supermarket))





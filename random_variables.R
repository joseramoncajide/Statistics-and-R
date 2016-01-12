install.packages("rafalib")
install.packages("downloader")
getwd()
setwd("/Users/JOSE/Documents/GitHub/Statistics and R")

dat <- read.csv('femaleMiceWeights.csv')

library(dplyr)
control <- filter(dat,Diet=="chow") %>% select(Bodyweight) %>% unlist
treatment <- filter(dat,Diet=="hf") %>% select(Bodyweight) %>% unlist
print( mean(treatment) )
print( mean(control) )
obsdiff <- mean(treatment) - mean(control)
print(obsdiff)

#variable aleatoria

population <- read.csv(file = "femaleControlsPopulation.csv")
population <- unlist(population) # turn it into a numeric

control <- sample(population,12)
mean(control)

control <- sample(population,12)
mean(control)

control <- sample(population,12)
mean(control)

#Null distr

control <- filter(dat,Diet=="chow") %>% select(Bodyweight) %>% unlist
treatment <- filter(dat,Diet=="hf") %>% select(Bodyweight) %>% unlist
print( mean(treatment) )
print( mean(control) )
obsdiff <- mean(treatment) - mean(control)
print(obsdiff)

##12 control 
control <- sample(population,12)

#Una muestra sobre la misma población, como si no hubiera efecto. De esta forma estamos garantizando que el efecto es el mismo
treatment <- sample(population,12)
print(mean(treatment) - mean(control))

n <- 10000
null <- vector("numeric",n)
for (i in 1:n) {
  control <- sample(population,12)
  treatment <- sample(population,12)
  null[i] <- mean(treatment) - mean(control)
}

#Diferencias entre la medias
max(null)
min(null)
hist(null)

#p-value
#qué porcentaje de las 10.000 observaciones es mayor que 3.020833 (obsdiff)?
#Cuantos de los null son mayores que los obs

#numero de veces totales en que null es mayor que la diferencia entre las dos medias
sum(null > obsdiff)
#propoción de veces en que null es mayor que la diferencia entre las dos medias
sum(null > obsdiff) / n
#o
mean(null > obsdiff)
# Es decir el 1.45% de las veces
mean(abs(null) > obsdiff)
# Es decir el 2.63% de las veces (Este es el p-value)
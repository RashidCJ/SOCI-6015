a<-1
b=0
a==b
a!=b
c<--2
a
print(a)
help(lm)
sqrt(9)
?sqrt
edad.de.entrevistado <- c(23, 25, 21, 18)
edad.de.entrevistado
mean(edad.de.entrevistado)
library(tidyverse)

library(dslabs)
data(murders)
murders<-mutate(murders, tasa = total/population*10^5)
filter(murders, tasa<=0.71 )
murders<-mutate(murders, tasa = total/population*10^5)
filter(murders, tasa<=0.71 )
filter(murders, tasa<=0.71 )
filter(murders, tasa<=0.4)
filter(murders, tasa<=0.3)
select(murders, state, population, tasa)
tablanueva<-select(murders, state, population, tasa)

murders |> select(state, population, tasa) |> filter(tasa<=0.4)


data(heights)
heights |> group_by(sex) |> summarise(promedio=mean(height),
                                      desviación_estándar=sd(height))

library(readr)
sueldos_alcaldes_2023_2024 <- read_csv("sueldos_alcaldes_2023_2024.csv")
View(sueldos_alcaldes_2023_2024)


murders|> ggplot()+
  geom_point(aes(x=population, y=total, colour=region), size=3)


library(ggthemes)
library(ggrepel)

r <- murders |> 
  summarise(rate = sum(total) /  sum(population) * 10^6) |>
  pull(rate)

murders |> 
  ggplot(aes(x=population/10^6, y=total)) +   
  geom_abline(intercept = log10(r), lty = 2, colour = "darkgrey") +
  geom_point(aes(col = region), size = 3) +
  geom_text_repel(aes(label = abb)) + 
  scale_x_log10() +
  scale_y_log10() +
  labs(title = "US Gun Murders in 2010",
       x = "Populations in millions (log scale)", 
       y = "Total number of murders (log scale)",
       color = "Region") +
  theme_economist()

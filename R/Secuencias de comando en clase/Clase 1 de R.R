#install.packages("dslabs")
library(dslabs)
data("murders")
View(murders)
?murders
# usando tidyverse dame el nombre del Estado con mayor tasa de asesinatos
library(tidyverse)
murders |> 
  mutate(tasa = total / population * 10^5) -> murders

murders |> 
  filter(tasa == max(tasa)) |>
  select(state)
murders |> slice_max(tasa, n = 1)
murders |> arrange(desc(tasa)) |> head(1) |> select(state)
murders |> top_n(1, tasa) |> select(state)


mediana_mín_máx <- function(x){
  qs <- quantile(x, c(0.5, 0, 1))
  data.frame(mediana = qs[1], mín = qs[2], máx = qs[3])
}
mediana_mín_máx(murders$tasa)

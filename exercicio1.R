# Carregar pacotes necessários
library(dplyr)

# 2
# Definir semente para reprodutibilidade
set.seed(19092005)

# Carregar a base de dados
base <- read.csv("dados_salarios.csv", sep = ";")

# Amostragem aleatória de 350 observações
base1 <- base %>% sample_n(350)

# 3
# Recodificar os valores da variável trab_reamoto
base1$trab_remoto <- factor(base1$trab_remoto, 
                            levels = c(0, 50, 100), 
                            labels = c("Não", "Parcial", "Sim"))

# 4
# Carregar pacotes necessários
library(ggplot2)

# Criar gráfico de barras com proporção em porcentagem
ggplot(base1, aes(x = experiencia)) +
  geom_bar(aes(y = (..count..) / sum(..count..) * 100), fill = "steelblue") +
  labs(title = "Distribuição de Experiência dos Profissionais",
       x = "Nível de Experiência",
       y = "Porcentagem (%)") +
  theme_minimal()

# 5
ggplot(base1, aes(x = experiencia, fill = trab_remoto)) +
  geom_bar(aes(y = (..count..) / sum(..count..) * 100), position = "dodge") +
  labs(title = "Relação entre Experiência e Trabalho Remoto",
       x = "Nível de Experiência",
       y = "Porcentagem (%)",
       fill = "Trabalho Remoto") +
  theme_minimal()

# 6
ggplot(base1, aes(x = salario_USD)) +
  geom_density(fill = "lightblue", alpha = 0.6) +
  labs(title = "Distribuição de Densidade dos Salários",
       x = "Salário em USD",
       y = "Densidade") +
  theme_minimal()

# 7
ggplot(base1, aes(x = salario_USD, fill = trab_remoto)) +
  geom_density(alpha = 0.4) +
  labs(title = "Distribuição Salarial por Tipo de Trabalho Remoto",
       x = "Salário em USD",
       y = "Densidade",
       fill = "Trabalho Remoto") +
  theme_minimal()



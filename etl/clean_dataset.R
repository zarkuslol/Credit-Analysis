# Imports
library(dplyr)
library(Hmisc)

# Read dataset
dataset <- read.csv('https://raw.githubusercontent.com/andre-marcos-perez/ebac-course-utils/main/dataset/credito.csv')
View(dataset)

# Remove unecessary columns and reorder columns
cleaned.dataset <- dataset %>% select(c(idade:meses_inativo_12m, valor_transacoes_12m, qtd_transacoes_12m, limite_credito))
View(cleaned.dataset)

# General statistics of our dataset
dim(cleaned.dataset)
describe(cleaned.dataset)
sapply(cleaned.dataset, class)

# Changing 'na' values in escolaridade, estado_civil and salario_anual
dim(cleaned.dataset %>% filter(escolaridade == 'na')) # 1519 values
dim(cleaned.dataset %>% filter(estado_civil == 'na')) # 749 values
dim(cleaned.dataset %>% filter(salario_anual == 'na')) # 1112 values

cleaned.dataset[cleaned.dataset$escolaridade == 'na',]$escolaridade <- 'nao informado'
cleaned.dataset[cleaned.dataset$estado_civil == 'na',]$estado_civil <- 'nao informado'
cleaned.dataset[cleaned.dataset$salario_anual == 'na',]$salario_anual <- 'nao informado'

# Searching for duplicated values
sum(duplicated(cleaned.dataset))

# Handling missing data
sum(is.na(cleaned.dataset))

# Changing data types of 'valor_transacoes_12m' and 'limite_credito' to numeric
convert.to.numeric <- function(data, column.name) {
  data[[column.name]] <- gsub('\\.', '', data[[column.name]])
  data[[column.name]] <- gsub(',', '.', data[[column.name]])
  data[[column.name]] <- as.numeric(data[[column.name]])
  return(data[[column.name]])
}

cleaned.dataset$valor_transacoes_12m <- convert.to.numeric(cleaned.dataset, 'valor_transacoes_12m')
cleaned.dataset$limite_credito <- convert.to.numeric(cleaned.dataset, 'limite_credito')

# Converting df to data.table
cleaned.dataset <- data.table::data.table(cleaned.dataset)

# Changing columns names
colnames(cleaned.dataset) <- c('Age', 'Gender', 'Dependents', 'Education', 'Marital Status',
                               'Annual Salary', 'Card Type', 'Months of Relationship', 'Products',
                               'Iterations 12m', 'Number of Months Inactive 12m', 'Transactions Amount 12m',
                               'Transactions 12m', 'Credit Limit')

# Saving dataset in 'data\\cleaned' folder
write.csv(cleaned.dataset, 'data\\cleaned\\credit.csv', row.names = F)

# Imports
library(tidyverse)
library(scales)

# Loading data
data <- read.csv('data\\cleaned\\credit.csv')
View(data)

test <- data %>%
  group_by(Education) %>%
  summarise(sum_credit_limit = sum(Credit.Limit, na.rm = TRUE)) %>%
  arrange(desc(sum_credit_limit))

View(head(test))

# Verifying correlation between categorical data and Credit.Limit
plot_categorical_data_with_cl <- function(data, column.name, color) {
  return(
    ggplot(data, aes(x = !!sym(column.name), y = Credit.Limit)) +
      geom_boxplot() +
      scale_y_continuous(labels = scales::comma) +
      theme_classic() +
      labs(
        title = sprintf('Credit limit distribution for %s', column.name),
        subtitle = sprintf('How %s impacts credit limit', column.name),
        caption = 'Data source: EBAC Online Courses',
        x = column.name,
        y = 'Credit Limit'
      )
  )
}

# Verifying correlation between continuous data and Credit.Limit
plot_continuous_data_with_cl <- function(data, column.name, color) {
  return(
    ggplot(data) +
      geom_bar(aes(x=.data[[column.name]], y=Credit.Limit), stat = 'identity', fill = color) +
      scale_y_continuous(labels = scales::comma) +
      theme_classic() +
      labs(
        title = sprintf('Credit limit distribution for %s', column.name),
        subtitle = sprintf('How %s impacts in credit limit', column.name),
        caption = 'Data font: EBAC Online Courses',
        y = 'Credit Limit',
      )
  )
}

plot_continuous_data_with_cl(data, 'Dependents', 'gray75')

plot_categorical_data_with_cl(data, 'Marital.Status', 'gray75')

describe(data$Marital.Status)

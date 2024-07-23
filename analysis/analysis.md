Credit Analysis
================

So, first, let’s see the head of our data.

``` r
# Showing data head
knitr::kable(head(data), 'pipe')
```

| idade | sexo | dependentes | escolaridade        | estado_civil  | salario_anual   | tipo_cartao | meses_de_relacionamento | qtd_produtos | iteracoes_12m | meses_inativo_12m | valor_transacoes_12m | qtd_transacoes_12m | limite_credito |
|------:|:-----|------------:|:--------------------|:--------------|:----------------|:------------|------------------------:|-------------:|--------------:|------------------:|---------------------:|-------------------:|---------------:|
|    45 | M    |           3 | ensino medio        | casado        | \$60K - \$80K   | blue        |                      39 |            5 |             3 |                 1 |              1144.90 |                 42 |       12691.51 |
|    49 | F    |           5 | mestrado            | solteiro      | menos que \$40K | blue        |                      44 |            6 |             2 |                 1 |              1291.45 |                 33 |        8256.96 |
|    51 | M    |           3 | mestrado            | casado        | \$80K - \$120K  | blue        |                      36 |            4 |             0 |                 1 |              1887.72 |                 20 |        3418.56 |
|    40 | F    |           4 | ensino medio        | nao informado | menos que \$40K | blue        |                      34 |            3 |             1 |                 4 |              1171.56 |                 20 |        3313.03 |
|    40 | M    |           3 | sem educacao formal | casado        | \$60K - \$80K   | blue        |                      21 |            5 |             0 |                 1 |               816.08 |                 28 |        4716.22 |
|    44 | M    |           2 | mestrado            | casado        | \$40K - \$60K   | blue        |                      36 |            3 |             2 |                 1 |              1088.07 |                 24 |        4010.69 |

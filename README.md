
<!-- README.md is generated from README.Rmd. Please edit that file -->

# pontejornalismo

<!-- badges: start -->

[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/jjesusfilho/pontejornalismo?branch=master&svg=true)](https://ci.appveyor.com/project/jjesusfilho/pontejornalismo)
[![Travis build
status](https://travis-ci.org/jjesusfilho/pontejornalismo.svg?branch=master)](https://travis-ci.org/jjesusfilho/pontejornalismo)
<!-- badges: end -->

# pontejornalismo

O pacote pontejornalismo baixa e organiza notícias do jornal [Ponte
Jornalismo](https;//ponte.org)

Por ora, eu só implementei a leitura dos sumários das notícias, pois era
só disso que eu precisava. Logo adiciono a leitura completa.

## Instalação

``` r
devtools::install_github("jjesusfilho/pontejornalismo")
```

## Uso

``` r
library(pontejornalismo)
dir.create("paginas")
baixar_paginas_ponte("paginas") # baixará as dez primeiras páginas
df <- ler_paginas_ponte(diretorio="paginas")
```

# Código de conduta

Please note that the ‘pontejornalismo’ project is released with a
[Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to
this project, you agree to abide by its terms.

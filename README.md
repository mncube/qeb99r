
<!-- README.md is generated from README.Rmd. Please edit that file -->

# qeb99r

<!-- badges: start -->
<!-- badges: end -->

The goal of qeb99r is to provide tools for quantitative ethnobotany

## Installation

You can install development version from [GitHub](https://github.com/)
with:

``` r
# install.packages("devtools")
devtools::install_github("mncube/qeb99r")
```

## Density of species

The dsp function can be used to compute the density of species (Dsp) on
a data frame that includes the names of the species and the distance
from the random sampling points to the distance to the nearest
individual of the species:

``` r
library(qeb99r)

#Create a data frame of species and distances
df_sp <- data.frame(spec = sample(c("sp1", "sp2", "sp3"), 100, replace = TRUE),
                    dis = rnorm(100, 100, 25))

#Compute the Dsp for each species
df_sp_dens <- dsp(data = df_sp, species = spec, distance = dis)

#Display Dsp for each species
dplyr::select(dplyr::distinct(df_sp_dens, spec, .keep_all = TRUE), -dis)
#> # A tibble: 3 x 2
#>   spec    Dsp
#>   <chr> <dbl>
#> 1 sp2    66.9
#> 2 sp1    73.7
#> 3 sp3    64.8
```

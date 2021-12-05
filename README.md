
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

#Display results
head(df_sp_dens)
#> # A tibble: 6 x 3
#>   spec    dis   Dsp
#>   <chr> <dbl> <dbl>
#> 1 sp3   165.   69.9
#> 2 sp2    65.6  76.2
#> 3 sp1   123.   73.1
#> 4 sp3   123.   69.9
#> 5 sp3   161.   69.9
#> 6 sp1   105.   73.1
```

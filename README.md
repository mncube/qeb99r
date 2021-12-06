
<!-- README.md is generated from README.Rmd. Please edit that file -->

# qeb99r

<!-- badges: start -->
<!-- badges: end -->

qeb99r stands for quantitative ethnobotany 1999 in R. The goal of the
qeb99r is to provide a central package which implements the methods
outlined in:

Höft, M., Barik, S. K., & Lykke, A. M. (1999). Quantitative Ethnobotany:
Applications of Multivariate and Statistical Analyses in Ethnobotany.

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
#> 1 sp1    90.3  67.6
#> 2 sp3   100.   69.7
#> 3 sp2    88.5  70.0
#> 4 sp3    82.2  69.7
#> 5 sp1    95.6  67.6
#> 6 sp1    73.7  67.6
```

The dsp function can also be used to compute the dsp on a numeric vector
of distances for one species

``` r
vec_sp <- rnorm(33, 100, 25)
dsp(distance = vec_sp)
#> [1] 70.37096
```

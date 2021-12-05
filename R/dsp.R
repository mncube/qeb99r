#' dsp
#'
#' Density of species (Dsp) function
#'
#' @param data a data frame
#' @param species data frame column specifying the species of the observation
#' @param distance distance from random sampling point to nearest individual of a species
#'
#' @return input data frame with Dsp (density of species) column added on
#' @export
#'
#' @examples
#' #The dsp function works on class data.frame
#' df1 <- data.frame(sp = c("a", "b", "b", "a", "b", "a"),
#'                   dis = c(3, 6, 4, 7, 3, 8))
#' dsp(df1, sp, dis)
#'
#' #dsp also works on class numeric
#' y <- c(4, 7, 9, 10)
#' dsp(distance = y)
dsp <- function (data, species, distance){
  UseMethod("dsp")
}


#' dsp
#'
#' Density of species (Dsp) function
#'
#' @param data a data frame
#' @param species data frame column specifying the species of the observation
#' @param distance distance from random sampling point to nearest individual of a species
#'
#' @return input data frame with Dsp (density of species) column added on
#' @export
#'
#' @examples
#' df1 <- data.frame(sp = c("a", "b", "b", "a", "b", "a"),
#'                   dis = c(3, 6, 4, 7, 3, 8))
#' dsp(df1, sp, dis)
dsp.data.frame <- function(data, species, distance){

  #Do dsp calculation
  data <- dplyr::group_by(data, {{species}})
  data <- dplyr::ungroup(dplyr::mutate(data, Dsp = ((mean({{distance}})^2)/2)^(1/2)))

  #Return data frame with dsps
  return(data)

}


#' @export
dsp.numeric <- function(distance){
  #Do dsp calculation
  ((mean({{distance}})^2)/2)^(1/2)
}


dsp <- function(data, species, distance, ...){

  #Use evaluation methods
  species <- deparse(substitute(species))
  distance <- deparse(substitute(distance))

  #Rebuild data frame
  temp <- data.frame(species = as.factor(data[[species]]),
                     distance = data[[distance]])

  #Do calculation
  temp <- dplyr::group_by(temp, species)
  data <- dplyr::ungroup(dplyr::mutate(temp, dsp = ((mean(distance)^2)/2)^(1/2)))

  #Return data frame with dsps
  return(data)

}

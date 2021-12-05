#Set up data frame with species and distances
df1 <- data.frame(sp = c("a", "b", "b", "a", "b", "a"),
                  dis = c(3, 6, 4, 7, 3, 8))

#Add Dsp column
df1 <- dsp(df1, sp, dis)

#Get Dsp for species a
df1_a <- dplyr::filter(df1, sp == "a")
a_df <- as.numeric(head(dplyr::select(df1_a, Dsp), 1))

#Create vector of distances for species a
a <- c(3, 7, 8)
a_vec <- dsp(a)

#Run test for species a
test_that("dsp gives expected answer for species a", {
  expect_equal(a_df, a_vec)
})

#Get Dsp for species b
df1_b <- dplyr::filter(df1, sp == "b")
b_df <- as.numeric(head(dplyr::select(df1_b, Dsp), 1))
#Create vector of distances for species b
b <- c(6, 4, 3)
b_vec <- dsp(b)

#Run test for species b
test_that("dsp gives expected answer for species b", {
  expect_equal(b_df, b_vec)
})

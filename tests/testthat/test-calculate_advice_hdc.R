kids <- data.frame(
  dom1 = c(NA, NA, NA, 499, 134, 134, 134, 134, 134),
  dom0 = c(NA, NA, NA, NA, NA, NA, NA, 104, 104),
  y1   = c(NA, NA, NA, 43, 47, 35, 43, 43, 43),
  y0   = c(NA, NA, NA, NA, NA, NA, 41, 41, 42),
  sex  = c(NA_character_, "male", "male", "female", "female",
           "female", "female", "female", "female"),
  ga   = c(NA, NA, NA, NA, 33, 33, NA, NA, NA),
  code = c(3019, 3015, 3015, 3021, 3041, 3043, 3022, 3044, 3031),
  stringsAsFactors = FALSE)

# apply algorithm to kids
results <- matrix(NA, nrow = nrow(kids), ncol = 3)
colnames(results) <- c("k", "expected", "found")
for (k in 1:nrow(kids)) {
  found <- calculate_advice_hdc(sex  = kids[k, "sex"],
                                ga   = kids[k, "ga"],
                                dom1 = kids[k, "dom1"],
                                y1   = kids[k, "y1"],
                                dom0 = kids[k, "dom0"],
                                y0   = kids[k, "y0"])
  results[k, ] <- c(k, kids$code[k], found)
}

test_that("expected equals found", {
  expect_equal(results[, "expected"], results[, "found"])
})

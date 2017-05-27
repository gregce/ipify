library(ipify)
context("Test get_os")

test_that("minimal test to ensure it returns a value", {
  expect_true(!is.null(ipify:::get_os()))
}
)

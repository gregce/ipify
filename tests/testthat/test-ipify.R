library(ipify)
context("Test function calls")

test_that("get_ip_response returns correct messages for incorrect formats passed as its paramaters", {
  expect_message(ipify:::get_ip_response(format="jsond"),"jsond is not a recognized return format, defaulting to text")
  expect_message(ipify:::get_ip_response(format="JSON"),"JSON is not a recognized return format, defaulting to text")
  expect_message(ipify:::get_ip_response(format=""),"is not a recognized return format, defaulting to text")
}
)

test_that("get_ip_response returns no output", {
  expect_silent(ipify:::get_ip_response())
  expect_silent(ipify:::get_ip_response(format="json"))
  expect_silent(ipify:::get_ip_response(format="jsonp"))
}
)

test_that("get_ip returns correct messages for incorrect formats passed as its paramaters", {
  expect_message(ipify::get_ip(format="jsond"),"jsond is not a recognized return format, defaulting to text")
  expect_message(ipify:::get_ip(format="JSON"),"JSON is not a recognized return format, defaulting to text")
  expect_message(ipify:::get_ip(format=""),"is not a recognized return format, defaulting to text")
}
)

test_that("get_ip returns message output in certain cases", {
  expect_message(ipify:::get_ip(),"No encoding supplied: defaulting to UTF-8.")
  expect_silent(ipify:::get_ip(format="json"))
  expect_message(ipify:::get_ip(format="jsonp"),"No encoding supplied: defaulting to UTF-8.")
}
)



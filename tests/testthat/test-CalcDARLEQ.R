context("Test CalcDARLEQ functions")

test_that("CalcDARLEQ returns correct values from demo_data", {
    skip_on_cran()
    expect_silent(CalcDARLEQ(demo_data, metric = "rivers", version = "latest"))
})


context("CalcDARLEQ")

test_that("CalcDARLEQ returns correct error measures", {
   # skip_on_cran()
    expect_silent(CalcDARLEQ(demo_data, metric = "rivers", version = "latest"))

    bad_data <- data.frame(sampleID =c("1","2","3"),
                                date = c("01/01/2002","01/01/2002","01/01/2002"))
    expect_error(CalcDARLEQ(bad_data, metric = "rivers", version = "latest"),
                 "It seems the input data.frame does not have the required columns")
    expect_error(CalcDARLEQ(metric = "rivers", version = "latest"),
                 "No dataframe has been specified as 'data'")


})

test_that("CalcDARLEQ returns same results as DARLEQ outputs", {

riverAquaMetrics  <-  read.csv(system.file("extdata","diatomRivers2012-aquametrics-format.csv",
                               package = "aquaMetrics"))

riverDARLEQRResults  <-  read.csv(system.file("extdata","ResultsDARLEQRiver2012.csv",
                                 package = "aquaMetrics"))

riverAquaMetricsResults  <-  CalcDARLEQ(riverAquaMetrics, metric="rivers")
riverAquaMetricsResults  <- data.frame(riverAquaMetricsResults[1])
expect_equal(round(riverAquaMetricsResults$rivers.oTDI4,2), round(riverDARLEQRResults$TDI4,2))

})

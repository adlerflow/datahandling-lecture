# Setup
# In case you do not have the kofdata package installed:
# install.packages("kofdata", repo = "https://stat.ethz.ch/CRAN/")
library(kofdata)
library(tidyverse)
library(yaml)

# plotting TS example
baro_vint <- get_collection("globalbaro_vintages")
baro_20210 <- baro_vint$`globalbaro_leading_2020-10`

plot_both <- ts.plot(
  baro_20210,
  gpars = list(
    xlab = "Year",
    ylab = "Value",
    main = "Global Barometer of 2020-10"
  )
)

plot_both


# getting baro data and inspecting it
baro <- get_time_series("ch.kof.barometer")
view(baro)
# in this repository I have a data folder, specify your path
write.csv(baro, "data/baro.csv")
# no date here, because this is a time series object
print(str(baro))
meta <- get_metadata("ch.kof.barometer")
head(meta)
write_yaml(meta, "data/baro_meta.yaml")



# API example - diy
library(httr)
library(jsonlite)
keys <- "ch.kof.barometer"

url <- "https://datenservice.kof.ethz.ch/api/v1/public/ts"
query <- list(keys = keys, df = "Y-m-d")

response <- GET(url, query = query)
print(response)
data <- fromJSON(content(response, as = "text"))
head(data)

# API Wrapper example - kofdata
library(kofdata)
ts <- get_time_series("ch.kof.barometer")
head(ts)
meta <- get_metadata("ch.kof.barometer")
print(meta)

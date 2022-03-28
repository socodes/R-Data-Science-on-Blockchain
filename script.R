# import libraries
library(tidyverse)
library(httr)
library(jsonlite)
library(scales)
library(waffle)
library(ggrepel)
Sys.setenv(API_KEY = "75M7UOXmGM6IRRnKreRblUTEhJSE1Hfnn6cEUSVPmQdvsdf1KwMwBCpznqMTBoHn")

token=Sys.getenv("API_KEY")

URL <- "https://deep-index.moralis.io/api/v2/nft/search?chain=eth&format=decimal&q=successful&filter=name&limit=1"
res <- GET(
  URL,
  
  add_headers('Accept'= 'application/json', 'X-API-Key'='75M7UOXmGM6IRRnKreRblUTEhJSE1Hfnn6cEUSVPmQdvsdf1KwMwBCpznqMTBoHn')
)
data <- fromJSON(rawToChar(res$content), flatten=TRUE)

data2 <- fromJSON(rawToChar(data$result$metadata), flatten=TRUE)
data2
data <- data %>% 
  select_if(~!all(is.na(.)))




# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L


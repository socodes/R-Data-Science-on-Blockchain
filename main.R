# import libraries
library(tidyverse)
library(httr)
library(jsonlite)
library(scales)
library(waffle)
library(ggrepel)

Sys.setenv(API_KEY = "75M7UOXmGM6IRRnKreRblUTEhJSE1Hfnn6cEUSVPmQdvsdf1KwMwBCpznqMTBoHn")

token=Sys.getenv("API_KEY")

URL <- "https://deep-index.moralis.io/api/v2/nft/search?chain=eth&format=decimal&q=successful&filter=name&limit=3000"
res <- GET(
  URL,
  
  add_headers('Accept'= 'application/json', 'X-API-Key'='75M7UOXmGM6IRRnKreRblUTEhJSE1Hfnn6cEUSVPmQdvsdf1KwMwBCpznqMTBoHn')
)
data <- fromJSON(rawToChar(res$content), flatten=TRUE)
time_vector<-c()
created_vector<-c()
metadata <- data$result$metadata
for (i in metadata) {
    i <- fromJSON(i)
    created_at <- i$created_at
    print(created_at)
    if(!is.null(created_at)){
      created_vector <- append(created_vector,created_at)
      # Calling difftime() function
      xtime <- difftime( "2022-3-28", created_at, units = "days")
      time_vector <- append(time_vector,xtime)
    }

}
print(created_vector)
for (i in created_vector) {
  print(i)
}
print(time_vector)



# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L


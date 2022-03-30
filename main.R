# Clear current environment
rm(list = ls()) 

# Clear current console
cat("\014")  # ctrl+L

# import libraries
library(tidyverse)
library(httr)
library(jsonlite)
library(scales)
library(waffle)
library(ggrepel)


# Get API Key from System Environments.
token=Sys.getenv("API_KEY")

# API Url.
URL <- "https://deep-index.moralis.io/api/v2/nft/search?chain=eth&format=decimal&q=successful&filter=name&limit=3"

# make a get request to API and take related data.
res <- GET(
  URL,
  
  add_headers('Accept'= 'application/json', 'X-API-Key'='75M7UOXmGM6IRRnKreRblUTEhJSE1Hfnn6cEUSVPmQdvsdf1KwMwBCpznqMTBoHn')
)
#Convert raw data to JSON.
data <- fromJSON(rawToChar(res$content), flatten=TRUE)

time_vector<-c()
created_vector<-c()
# take metadata in data/result.
metadata <- data$result$metadata

# take every nft's creation time and calculate the time difference from today.
for (i in metadata) {
  i <- fromJSON(i)
  created_at <- i$created_at
  print(created_at)
  if(!is.null(created_at)){
    created_vector <- append(created_vector,created_at)
    # Calling difftime() function
    xtime <- difftime( Sys.time(), created_at, units = "days")
    time_vector <- append(time_vector,xtime)
  }
  
}

print(created_vector)
for (i in created_vector) {
  print(i)
}
print(time_vector)

barplot(as.matrix(time_vector))                       # Draw barplot with names

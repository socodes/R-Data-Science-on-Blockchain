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
#import library that is needed in the testing
library(testthat)

get_data <- function(api) {
  # make a get request to API and take related data.
  res <- GET(
    api,
    add_headers('Accept'= 'application/json', 'X-API-Key'='75M7UOXmGM6IRRnKreRblUTEhJSE1Hfnn6cEUSVPmQdvsdf1KwMwBCpznqMTBoHn')
  )
  #Convert raw data to JSON.
  data <- fromJSON(rawToChar(res$content), flatten=TRUE)
}

draw_barchart <- function(data, xstring,ystring) {
  barplot(data$x_axis ~ data$y_axis, ylim= c(1500,1600),ylab = ystring, xlab = xstring,
          horiz = FALSE)
}

# Get API Key from System Environments.
token=Sys.getenv("API_KEY")

# API Url.
URL <- "https://deep-index.moralis.io/api/v2/nft/search?chain=eth&format=decimal&q=successful&filter=name&limit=5"


data <- get_data(URL)
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
data <- data.frame(x_axis = time_vector,  
                   y_axis = (1:5))

bar <- draw_barchart(data, "NFT", "Days passed from creation")




# TESTS

# correct response should have 4 elements: total, page, page_size, result
expect_true(length(get_data(URL)) == 4)

# draw_barchart function returns the total NFT number. In our case it is 5.
expect_true(length(bar) == 5)


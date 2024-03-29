# Data Science on Blockchain in R
This repository includes a R project that takes NFT related metrics from Moralis API and visualize them.

## Dependencies:
- R language version 4.0.5
- tidyverse
- httr
- jsonlite
- scales
- waffle
- ggrepel
- testthat


## Building:

- Install devtools by typing (within R)

```
- install.packages(devtools)
```

- Then load the devtools package with
```
- library(devtools)
```
- Then, to build the package, type
```
- build()
```
This will create the PACKAGE_NAME.tar.gz file.


## Testing:

Unit testing is used. Testing covers to have the correct number of answers from the API and the correct number of NFTs while plotting the barplot.

````
- Change current working directory to repository location.
- Run the script: "Rscript tests.R"
````

## Install:

To install the R package, you’d type

from R:
```
- install()
```
OR

from command line:
```
- R CMD INSTALL NFT_1.0.0.tar.gz
```

## How to use:
- Install required R language version from https://www.r-project.org
- install required packages from command line as:
install.package(PACKAGE_NAME)
- Change current working directory to repository location.
- Run the script: "Rscript main.R"


Plot that shows how many days passed from the creation of each NFT:
![](plot1.png)

## External Resources:
- https://docs.moralis.io/introduction/readme
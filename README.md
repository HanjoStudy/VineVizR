# VineVizR
A package to visualise RVineMatrix objects with visNetwork

## Installation
Install the VineVizR package from inside `R` using the `devtools` library 
```r
library(devtools)
install_gtithub("HanjoStudy/VineVizR")
library(VineVizR)
```
After packge has succesfully installed, we need to load the libraries that the function will need to generate the network. You can use the helper function `load_pkg` to load all the package. If the package is not installed, this function will install it and then load the library. The package also contain some data that should help illustrate the function use

```r
load_pkg(c("dplyr", "visNetwork", "tidyr", "VineCopula"))
data("RVM")
data("Market_info")
```
Now that the packages have been loaded along with the `RVineMatrix` and some market information, we now generate a group that is formed using the my industry groupings from the `Market_Info` dataset
```r
group <- Market_info$Hanjo.Industry %>% as.character()
group.size <-  
  Market_info %>% 
  group_by(Hanjo.Industry) %>%
  summarise(n = n()) %>% 
  select(n) %>% unlist 

colours <- c("#39c9bb", "#398fc9", "#39c973"," #bb39c9", 	"#c9bb39")
 ```
 After you set the groupings, the group sizes and any of the other optional parameters, the function can now be run
 ```r
 VisVineR(
  RVM,
  group = group,
  group.size = group.size,
  colours = colours,
  shape = "circle",
  seed = 50)
```
Enjoy the interactive display!



R\_networkD3
------------
  
  NetworkD3 in R

#### link to data

[data](data/network3D_diagonalNetwork.csv)


``` r
library(networkD3)
library(data.tree)


df <- read.csv("data/network3D_diagonalNetwork.csv",stringsAsFactors = FALSE)
head(df)
```

##           from            to
## 1         Plot  One Variable
## 2         Plot Two Variables
## 3 One Variable       Numeric
## 4 One Variable     Categoric
## 5      Numeric     Histogram
## 6      Numeric       Density

``` r
# using data.tree to create a tree
networkD3 <- data.tree::FromDataFrameNetwork(df)
networkD3
```

##                                        levelName
## 1  Plot                                         
## 2   ¦--One Variable                             
## 3   ¦   ¦--Numeric                              
## 4   ¦   ¦   ¦--Histogram                        
## 5   ¦   ¦   ¦--Density                          
## 6   ¦   ¦   °--Histogram & Density              
## 7   ¦   °--Categoric                            
## 8   ¦       ¦--Barplot                          
## 9   ¦       ¦--Pie plot                         
## 10  ¦       ¦--Doughnut                         
## 11  ¦       °--Treemap                          
## 12  °--Two Variables                            
## 13      ¦--2 Numeric Vars                       
## 14      ¦   ¦--Scatter plot                     
## 15      ¦   ¦--Area plot                        
## 16      ¦   °--Line plot                        
## 17      ¦--2 Categoric Vars                     
## 18      ¦   ¦--Barplot by Group                 
## 19      ¦   ¦--Ven Diagram                      
## 20      ¦   °--Pie plot by Group                
## 21      °--1 Numeric & 1 Categoric Vars         
## 22          ¦--Histogram by Group               
## 23          ¦--Density plot by Group            
## 24          ¦--Histogram & Density plot by Group
## 25          ¦--Scatter plot by Group            
## 26          ¦--Area plot by Group               
## 27          °--Boxplot

![plot](plot/network3D_diagonalNetwork.png)



![plot](docs/network3D.html)


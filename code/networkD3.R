#####################################################
library(networkD3)
library(data.tree)


df <- read.csv("data/network3D_diagonalNetwork.csv",stringsAsFactors = FALSE)

# using data.tree to create a tree
networkD3 <- data.tree::FromDataFrameNetwork(df)
networkD3 <- as.list(networkD3, mode = 'explicit', unname = TRUE)

# Create color for node, link and text
nodeVector <- c("black", rep("red", 2), rep("blue", 5),rep("green", 19))
linkVector <- c(rep("red", 2), rep("blue", 5),rep("#66bd63", 19))
textVector <- c("#e08214", rep("#01665e", 2), rep("#9e0142", 5),rep("#2166ac", 19))

# apply js 
network_vector <- lapply(list(nodeVector,linkVector,textVector), function(j) {
  JS(paste0('function(d, i) { return ',paste0('["', paste(j, collapse = '", "'), '"]'), '[i]; }'))
})

# save html file
library(magrittr)
diagonalNetwork(List = networkD3, 
                fontSize = 20, 
                opacity = 0.9, 
                margin = NULL,
                height = 900, width=1200,
                nodeStroke = network_vector[[1]],
                linkColour = network_vector[[2]],
                textColour = network_vector[[3]]) %>% saveNetwork(file = 'docs/network3D.html')


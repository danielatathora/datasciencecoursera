# Coursera - Data ANalytics Week 3 

# Video Hierarchical clustering - Part 1

# Uclidian Distance
# Manhatten Distance


# Video Hierarchical clustering - Part 2

set.seed(1234)
par(mar = c(0,0,0,0))
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1, 2, 1), each = 4), sd = 0.2)
plot(x, y, col = "blue", pch = 19, cex = 2)
text(x + 0.05, y + 0.05, lebels = as.character(1:12))

dataFrame <- data.frame(x = x, y = y)
dist(dataFrame)


# finding point closest together, then next set of points closest together
# and you end up with a Dendrogram

##########################################
# Video Hierarchical clustering - Part 2
##########################################

# plot a Dendrogram
distxy <- dist(dataFrame)
hClustering <- hclust(distxy)
plot(hClustering)
names(hClustering)

##########################################
# Video Hierarchical clustering - Part 3
##########################################

myplclust <- function(hclust, lab = hclust$labels, lab.col = rep(1, length(hclust$labels)),
                      hang = 0.1, ...) {
  ## modification of plclust for plotting hclust *in colour*!
  ## Argumnents: hclust: hclust object lab: a character vector
  ## of labels of the leaves of the tree lab.col: colour for the labels;
  ## NA=default device foreground colour hang: as in hclust * plclust Side
  ## effect: A disploy of hierarchical cluster with coloured leaf labels.
  y <- rep(hclust$height, 2)
  x <- as.numeric(hclust$merge)
  y <- y[which(x < 0)]
  x <- x[which(x < 0)]
  x <- abs(x)
  y <- y[order(x)]
  x <- x[order(x)]
  plot(hclust, labels = FALSE, hang = hang, ...)
  text(x = x, y = y[hclust$order] - (max(hclust$height) * hang), labels = lab[hclust$order],
       col = lab.col[hclust$order], srt = 90, adj = c(1, 0.5), xpd = NA, ...) 
}

distxy <- dist(dataFrame)
hClustering <- hclust(distxy)
myplclust(hClustering, lab = rep(1:3, each = 4), lab.col = rep(1:3, each = 4))

#Merging points - two approaches
#===============================
  
#  - Average Linkage:
  
#  - Complete Linkage:
  
  
#  Heatmaps
# ========
# the heatmap function runs a Hierarchical cluster analysis on the rows of the data
# and on the columns of the data.

dataFrame <- data.frame(x = x, y = y)
set.seed(143)
dataMatrix <- as.matrix(dataFrame)[sample(1:12), ]
heatmap(dataMatrix)


# =====================================
#K-Means Clustering (Part 1)

#K-means clustering - example

set.seed(1234)
par(mar = c(0, 0, 0, 0))
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1, 2, 1), each = 4), sd = 0.2)
plot(x, y, col = "blue", pch = 19, cex = 2)
text(x + 0.05, y + 0.05, labels = as.character(1:12))


# =====================================
# K-Means Clustering (Part 2)

dataFrame <- data.frame(x, y )
kmeansObj <- kmeans(dataFrame, centers = 3)

names(kmeansObj)

# [1] "cluster"      "centers"      "totss"        "withinss"  "tot.withinss"
# [6] "betweenss"    "size"         "iter"         "ifault"      

kmeansObj$cluster
# [1] 3 3 3 3 1 1 1 1 2 2 2 2

# kmeans()
par(mar = rep(0, 2, 4))
plot(x, y, col = kmeansObj$cluster, pch = 19, cex = 2)
points(kmeansObj$centers, col = 1:3, pch = 3, cex = 3, lwd = 3)


# Heatmaps
set.seed(1234)
dataMatrix = as.matrix(dataFrame)[sample(1:12), ]
kmeansObj2 <- kmeans(dataMatrix, centers = 3)
par(mfrow = c(1,2), mar = c(2, 4, 0.1, 0.1))
image(t(dataMatrix)[, nrow(dataMatrix):1], yaxt = "n")
image(t(dataMatrix)[, order(kmeansObj$cluster)], yaxt = "n")

# =====================================
# Dimension Reduction (Part 1)

# Matrix data

set.seed(12345)
par(mar = rep(0.2, 4))
dataMatrix <- matrix(rnorm(400), nrow = 40)
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1])

# Cluster the data
par(mar = rep(0.2, 4))
heatmap(dataMatrix)


# No interesting pattern

# What if we add a pattern?


set.seed(678910)
for( i in 1:40) {
  # flip a Coin
  coinFlip <- rbinom(1, size =1, prob = 0.5)
  # if coin is heads add a common pattern to that row
  if(coinFlip) {
    dataMatrix[i, ] <- dataMatrix[i, ] + rep(c(0, 3), each = 5)
  }
}

# checl Matrix data again 
par(mar = rep(0.2, 4))
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1])

# run Heatmap again
par(mar = rep(0.2, 4))
heatmap(dataMatrix)

# Patterns in rows and columns
hh <- hclust(dist(dataMatrix))
dataMatrixOrdered <- dataMatrix[hh$order, ]
par(mfrow = c(1, 3))
image(t(dataMatrixOrdered)[, nrow(dataMatrixOrdered):1])
plot(rowMeans(dataMatrixOrdered), 40:1, , xlab = "Row Mean", ylab = "Row", pch = 19)
plot(colMeans(dataMatrixOrdered), xlab = "Column", ylab = "Column Mean", pch = 19)



# =====================================
# Dimension Reduction (Part 2)

svd1 <- svd(scale(dataMatrixOrdered))
par(mfrow = c(1, 3))
image(t(dataMatrixOrdered)[, nrow(dataMatrixOrdered):1])
plot(svd1$u[, 1], 40:1, , xlab = "Row", ylab = "First left singular vector",
      pch = 19)
plot(svd1$v[, 1], xlab = "Column", ylab = "First right singular vector",
     pch = 19)


# Components of the SVD - Variable explained
par(mfrow = c(1, 2))
par(mar = c(4, 4, 0, 0))

plot(svd1$d, xlab = "Column", ylab = "Singular value", pch = 19)
plot(svd1$d^2/sum(svd1$d^2), xlab = "Column", ylab = "Prop. of variance explained",
     pch = 19)


# Relationship of the principle components

par(mfrow = c(1, 1))
svd1 <- svd(scale(dataMatrixOrdered))
pca1 <- prcomp(dataMatrixOrdered, scale = TRUE)

plot(pca1$rotarion[, 1], svd1$v[, 1], pch = 19, xlab = "Principle Component 1",
      ylab = "Right Singular Vector 1")
abline(c(0,1))

# ** issue here pca1$rotation is NULL


# Component of the SVD - varianece explained
constantMatrix <- dataMatrixOrdered*0
for( i in 1:dim(dataMatrixOrdered)[1]) { constantMatrix[i,] <- rep(c(0, 1), each=5)}
svd1 <- svd(constantMatrix)
par(mfrow = c(1, 3))
image(t(constantMatrix)[, nrow(constantMatrix):1])
plot(svd1$d, xlab = "Column", ylab = "Singular value", pch=19)
plot(svd1$d^2/sum(svd1$d^2), xlab = "Column", ylab = "Prop. of variance explained", pch=19)

# What if we add a second pattern

set.seed(678910)
for( i in 1:40) {
  # flip a Coin
  coinFlip1 <- rbinom(1, size =1, prob = 0.5)
  coinFlip2 <- rbinom(1, size =1, prob = 0.5)
  # if coin is heads add a common pattern to that row
  if(coinFlip1) {
    dataMatrix[i, ] <- dataMatrix[i, ] + rep(c(0, 5), each = 5)
  }
  if(coinFlip2) {
    dataMatrix[i, ] <- dataMatrix[i, ] + rep(c(0, 5),  5)
  }
  hh <- hclust(dist(dataMatrix))
  dataMatrixOrdered <- dataMatrix[hh$order, ]
}

# Singuler value decomposition - true patterns
svd2 <- svd(scale(dataMatrixOrdered))
par(mfrow = c(1, 3))
image(t(dataMatrixOrdered)[, nrow(dataMatrixOrdered):1])
plot(rep(c(0,1), each = 5), pch = 19, xlab = "Column", ylab = "Pattern 1")
plot(rep(c(0,1),5), pch = 19, xlab = "Column", ylab = "Pattern 2")



# v and patterns of variace in rows
svd2 <- svd(scale(dataMatrixOrdered))
par(mfrow = c(1, 3))
image(t(dataMatrixOrdered)[, nrow(dataMatrixOrdered):1])
plot(svd2$v[, 1], pch = 19, xlab = "Column", ylab = "First right singular vector")
plot(svd2$v[, 2], pch = 19, xlab = "Column", ylab = "Second right singular vector")

# d and variance explained
svd1 <- svd(scale(dataMatrixOrdered))
par(mfrow = c(1, 2))
plot(svd1$d, xlab = "Column", ylab = "Singular value", pch = 19)
plot(svd1$d^2/sum(svd1$d^2), xlab = "Column", ylab = "Percent of variance explained",
        pch = 19)


# =====================================
# Dimension Reduction (Part 3)

# Missing values

dataMatrix2 <- dataMatrixOrdered
## Randomlty insert some missingf data
dataMatrix2[sample(1:100, size = 40, replace = FALSE)] <- NA
svd1 <- svd(scale(dataMatrix2))  ## Doesn't work 

## Error: infinite or missing values in 'x'

# imputing {impute}

library(impute)  ## Available from http://bioconductor.org
dataMatrix2 <- dataMatrixOrdered
dataMatrix2[sample(1:100, size = 40, replace = FALSE)] <- NA
dataMatrix2 <- impute.knn(dataMatrix2)
svd1 <- svd(scale(dataMatrixOrdered)); svd2 <- svd(scale(dataMatrix2))
par(mfrow=c(1,2)); plot(svd1$v[, 1], pch=19) ; plot(scv2$v[,1], pch=19)


# Face example
load("data/face.rda")
image(t(faceData)[, nrow(faceData):1])

# Face example - variace explained
svd1 <- svd(scale(fateData));
plot(svd1$d^2/sum(svd1$d^2), pch = 19, xlab = "Singular vector", ylab = "Variance explained")

# Face example - create approximations
svd1 <- svd(scale(fateData));

## Note that %*% is matrix multiplication

# Here svd1$[1] is a constant
aprox1 <- svd1$u[, 1] %*% t(svd1$v[, 1]) * svd1$d[1]

# In these examples we need to make a diagonal matric out of d
approx5  <- svd1$u[, 1:5] %*% diag(svd1$d[1:5]) %*% t(svd1$v[, 1:5]) 
approx10 <- svd1$u[, 1:10] %*% diag(svd1$d[1:10]) %*% t(svd1$v[, 1:10]) 

# Face example - plot approximations
par(mfrow=c(1, 4))
image(t(approx1)[, nrow(approx1):1], main = "(a)")
image(t(approx5)[, nrow(approx1=5):1], main = "(b)")
image(t(approx10)[, nrow(approx10):1], main = "(c)")
image(t(faceDate)[, nrow(faceData):1], main = "(d)") ## Original data


#################################
## Color Utilities in R (Part 1)
#################################

#################################
## Color Utilities in R (Part 2)
#################################

#- colorRamp

#- colorRampPalette

# colors()


# gray(0:8 / 8)
# [1] "#000000" "#202020" "#404040" "#606060" "#808080"
# [6] "#9F9F9F" "#BFBFBF" "#DFDFDF" "#FFFFFF"

#colorRamp

pal <- colorRamp(c("red", "blue"))

pal(0)
#      [,1] [,2] [,3]
#[1,]  255    0    0
# Red

pal(1)
#     [,1] [,2] [,3]
#[1,]    0    0  255
# Blue

pal(0.5)
#       [,1] [,2]  [,3]
#[1,] 127.5    0 127.5
# a color Mix


pal(seq(0, 1, len = 10))
#[,1] [,2]      [,3]
#[1,] 255.00000    0   0.00000
#[2,] 226.66667    0  28.33333
#[3,] 198.33333    0  56.66667
#[4,] 170.00000    0  85.00000
#[7,]  85.00000    0 170.00000
#[5,] 141.66667    0 113.33333
#[6,] 113.33333    0 141.66667
#[8,]  56.66667    0 198.33333
#[9,]  28.33333    0 226.66667
#[10,]   0.00000    0 255.00000

pal <- colorRampPalette(c("red", "yellow"))

pal(2)
# [1] "#FF0000" "#FFFF00"

pal(10)
# [1] "#FF0000" "#FF1C00" "#FF3800" "#FF5500" "#FF7100"
# [6] "#FF8D00" "#FFAA00" "#FFC600" "#FFE200" "#FFFF00"
# [1] == red and  [10]== yellow (the extremes)

#################################
## Color Utilities in R (Part 3)
#################################

library(RColorBrewer)

cols <- brewer.pal(3, "BuGn")

cols
# [1] "#E5F5F9" "#99D8C9" "#2CA25F"


image(volcano, col = pal(20))


# The smoothScatter function (good for a lot of points)

x <- rnorm(10000)
y <- rnorm(10000)
smoothScatter(x, y) ## good for a lot of points

#################################
## Color Utilities in R (Part 4)
#################################



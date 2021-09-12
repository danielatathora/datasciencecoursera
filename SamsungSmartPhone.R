# load csv

#df <- read.table("SamsungSmartPhone/train.csv", header = TRUE)
# dim(df)

setwd("/Users/daniel/Documents/Coursera_data_analytics_r_studio_work/Week_4")
getwd()

samsungData <- read.csv(file = 'SamsungSmartPhone/train.csv')
# dim(samsungData)
# [1] 7352  563

names(samsungData[1:12])

table(samsungData$Activity)

# Plotting average acceleration of for first subject

par(mfrow = c(1, 2), mar = c(5, 4, 1, 1))
samsungData <- transform(samsungData, Activity = factor(Activity)) ## convert to factor variable
sub1 <- subset(samsungData, subject == 1)
plot(sub1[, 1], col = sub1$Activity, ylab = names(sub1)[1])
plot(sub1[, 2], col = sub1$Activity, ylab = names(sub1)[2])
legend("bottomright", legend = unique(sub1$Activity), col = unique(sub1$Activity),
       pch = 1)


par(mfrow = c(1, 2))
plot(sub1[, 1], col = sub1$Activity, ylab = names(sub1)[1])
plot(sub1[, 2], col = sub1$Activity, ylab = names(sub1)[2])

# Plotting Mac Accelloration for the first saubject
par(mfrow = c(1, 2))
plot(sub1[, 10], col = sub1$Activity, ylab = names(sub1)[10])
plot(sub1[, 11], col = sub1$Activity, ylab = names(sub1)[11])


# Single Value Decomposition
svd1 = svd(scale(sub1[, -c(562, 583)] ))
par(mfrow = c(1, 2))
plot(svd1$u[, 1], col = sub1$Activity, pch = 19)
plot(svd1$u[, 2], col = sub1$Activity, pch = 19)


# Find maximum contributor
plot(svd1$v[, 2], pch = 19)

# New clustering with maximum contributer
par(mfrow = c(1, 1))
maxContrib <- which.max(svd1$v[, 2])
distanceMatrix <- dist(sub1[, c(19:12, maxContrib)])
hClustering <- hclust(distanceMatrix)
myplclust(hclustering, lab.col = unclass(sub1$Activity))

# New clustering with maximum contributer
names(samsungData)[maxContrib]
# [1] "fBodyAcc.meanFreq...Z"

# K-means clustering (nstart=1, first try)
kClust <- kmeans(sub1[, -c(562, 563)], centers = 6)
table(kClust$cluster, sub1$Activity)
# LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS
# 1     18       9        2       0                  0                0
# 3     29       0        0       0                  0                0
# 2      3       0        0       0                  0               53
# 4      0      33        1       0                  0                0
# 5      0       5       50       0                  0                0
# 6      0       0        0      95                 49                0

# K-means clustering (nstart=1, second try)
kClust <- kmeans(sub1[, -c(562, 563)], centers = 6, nstart = 1)
table(kClust$cluster, sub1$Activity)

# LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS
# 1     29       0        0       0                  0                0
# 2      0      37       51       0                  0                0
# 3      3       0        0       0                  0               53
# 4      0       0        0      95                  0                0
# 5     18      10        2       0                  0                0
# 6      0       0        0       0                 49                0

# K-means clustering (nstart=100, first try)
kClust <- kmeans(sub1[, -c(562, 563)], centers = , nstart = 100)
table(kClust$cluster, sub1$Activity)
# LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS
# 1     29       0        0       0                  0                0
# 2      0      37       51       0                  0                0
# 3      3       0        0       0                  0               53
# 4      0       0        0      95                  0                0
# 5     18      10        2       0                  0                0
# 6      0       0        0       0                 49                0

# Cluster 1 Variable Centers (Laying)
plot(kClust$center[1, 1:10], pch = 19, ylab = "Cluster Center", xlab = "")

# Cluster 2 Variable Centers (Walking)
plot(kClust$center[4, 1:10], pch = 19, ylab = "Cluster Center", xlab = "")




#-------------------------------------
#
# AQS - Air Quality System
#
#-------------------------------------
# check this url
# https://aqs.epa.gov/aqsweb/airdata/download_files.html#Annual



# Question
# Go to the web site for the EPA Air Quality System (AQS) data for downloading  and find the two files containing PM2.5 data for 1999 and 2012 that will be used in this video under PM2.5 "Local Conditions". What is the AQS parameter code (a 5-digit code) for PM2.5?
# 81102
# 42101
# 42602
# 88101

# pm25_1999 <- read.csv(file = 'data/annual_conc_by_monitor_1999.csv')

pm25_1999 <- read.csv(file = 'data/annual_aqi_by_county_1999.csv')


names(pm25_1999)
head(pm25_1999)

x <- subset(pm25_1999, Parameter.Code == c(81102, 42101, 42602, 88101))

head(subset(x, Parameter.Code == 88101))[1:1,]

       
       
       











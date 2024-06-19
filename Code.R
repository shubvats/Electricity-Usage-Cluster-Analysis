# Load required libraries
library(tidyverse)
library(factoextra)

# Load the dataset
data <- read.csv("household_electricity_consumption.csv")

# Check the structure of the dataset
str(data)

# Preprocess the data if necessary
# For example, you may need to remove irrelevant columns or handle missing values

# Perform K-means clustering
set.seed(123) # for reproducibility
k <- 4 # number of clusters
kmeans_result <- kmeans(data[, -c(1:2)], centers = k)

# Visualize the clustering results
fviz_cluster(kmeans_result, data = data[, -c(1:2)], 
             geom = "point", 
             palette = "jco",
             ggtheme = theme_minimal())

# Print the cluster centers
print(kmeans_result$centers)

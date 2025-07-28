library("vegan")
library("tidyverse")
library("factoextra")
library("FactoMineR")
library("pheatmap")
library("ggpubr")
library("ggsci")
library("ape")
library(Hmisc)
library("picante")
library("igraph")

# Load Data
guizhou.raw <- read.csv("./guizhou_T1_bivalve.csv", header = TRUE, row.names = 1)
guizhou.raw[is.na(guizhou.raw)] <- 0

## Clustering Analysis
# Data normalization
guizhou.norm <- decostand(guizhou.raw, method = "log")
# Calculate the dissimilarity distance with horn-morisita index
guizhou.dist <- vegdist(guizhou.norm, method="horn")
# Q-mode clustering
guizhou_clust <- hclust(guizhou.dist, method="average") 
plot(guizhou_clust)
# Heatmap Clustering
guizhou.heatmap <- pheatmap(guizhou.norm,
         cluster_rows = guizhou_clust,
         cluster_cols = FALSE,
         cutree_rows = 5,
         colorRampPalette(c("white", "navy"))(50))


## NMDS
guizhou.nmds <- metaMDS(guizhou.norm, distance = "horn", k=2)
# Check the stress and plot it.
guizhou.nmds$stress
stressplot(guizhou.nmds)
# NMDS Ordination
# Clecting data into a dataframe
guizhou.nmds.df <- data.frame(guizhou.nmds$points)
guizhou.group <- c(rep("B", 10), rep("C",5), "D", "E", rep("A",4), rep("B",4), "E", "D", "D", "E", "D", "E")
section <- c(rep("LD", 17), rep("SZ", 14))
guizhou.nmds.df$group <- guizhou.group
guizhou.nmds.df$section <- section
guizhou.nmds.sp <- data.frame(guizhou.nmds$species)
# Plot
ggscatter(guizhou.nmds.df, x = "MDS1", y = "MDS2", color = "group", shape = "section", size = 3,
          label = rownames(guizhou.nmds.df),
          ellipse = TRUE, 
          ellipse.type = "t",
          #ellipse.border.remove = TRUE,
          mean.point = FALSE,
          star.plot = TRUE) +
  scale_color_npg() +
  scale_fill_npg() +
  geom_vline(xintercept = 0, linetype = "dashed") +
  geom_hline(yintercept = 0, linetype = "dashed")

## Permanova tests are condected one by one pair using adonis2() function. It is an easy but boring task.

## Co-occurrence network analysis
# Change abundance data to presence/absence matrix
guizhou.pa <- decostand(guizhou.raw, method = "pa")
# Calculate the spearman correlation index
guizhou.r <-rcorr(as.matrix(guizhou.pa), type = "spearman")
# Export the results to the the software Gephi and you will get the network ordination. But note the figure results may vary but the structure should be the same. 



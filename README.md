# LSE_DA301_assignment

LSE_DA301 Assignment Report

# Assignment activity 1: Make predictions with regression

To understand the relationships between loyalty points (dependable variable) and age, remuneration, and spending scores, three simple regression models were built. The result shows that spending scores and remuneration have a positive relationship with loyalty points, meaning the higher the spending score or the remuneration a customer has, the higher the loyal points the customer acquires. Compared to spending scores, remuneration seems to have a stronger impact on loyalty points, meaning that remuneration can influence loyalty points better than spending scores (remuneration coefficient r = 34.187825; spending score coefficient r = 33.061693). Interestingly, age has a negative relationship with loyalty points as the coefficient is showing as minus (-4.012805), indicating that the older a customer is, the less the loyalty points the customer acquires. 

# Assignment activity 2: Make predictions with clustering

The clustering algorithm was applied to identify groups with the given data – game marketing. Firstly, the scatterplot and pair plot were used to understand the distribution of the dataset. The result shows that most data points are showing overlapped by each other. However, we can still identify 5 clusters in the plot. Interestingly, education was input as hues, but the result shows that it seems not the ideal attribute to cluster the dataset. Afterwards, the elbow and Silhouette methods were investigated to improve the accuracy and define the k cluster number. The outcome demonstrates that 5 clusters are ideal, which aligned with the distribution of the scatterplot and pair plot. Lastly, the visualisation was built and there are clearly 5 clusters to be interpreted. Based on the attribute of the 5 clusters, we can identify new market segmentation (listed as below) and better target customers. 
- Cluster Black: low remuneration and high spending-score
-	Cluster Yellow: low remuneration and low spending-score
-	Cluster Red: middle remuneration and spending-score
-	Cluster Blue: high remuneration and high spending-score
-	Cluster Green: high remuneration and low spending-score


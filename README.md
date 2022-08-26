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

# Assignment activity 3: Analyse customer sentiments with reviews

The re-processing was adapted before the sentiment analysis including dropping unnecessary columns, checking missing values, changing to lower cases, replacing punctuations, dropping duplicates, removing alphanumeric characters and stopwords and tokenising. The process helps to ensure accuracy and increase the efficiency of sentiment analysis afterwards. Based on the display of the word cloud and the frequency distribution, 15 most common words in both review and summary columns are demonstrated. The text such as “game, great, fun, like, play, good” clearly explains that the customers tend to have positive sentiments towards the game. Interestingly, the review of polarity and sentiment shows that most of the text in the review and summary tend to be natural as most of the text has a sentiment score close to 0. Through reviewing the top 20 positive and negative reviews for both columns, the details of the text provide a deep understanding of customer sentiments. For instance, some customers buy a particular board game as a gift. In this case, the marketing can promote the game during Christmas to increase sales. The negative sentiments can help to spot the pinpoints and the team should implement an improvement plan for the product or service. For instance, text such as “boring and disappointing” and “bad quality” explain that the product doesn’t meet customer needs. The team should take action towards the improvement shortly before losing more customers.

# Assignment activity 4: Visualise data to gather insights

Based on the scatter plots, three regions tend to have a slight negative relationship between product ID and sales, explaining that the greater the ID is, the lower the sales are. This is interesting as customer behaviour seems to have some similarities across the three regions. Product ID smaller than 5,000 seems more popular than product ID greater than 5,000. The histograms and plot boxes show that the distribution is skewed across the three regions, the majority of the clients spend between 0K to 5K in each region. To compare global sales in North America (NA) and Europe (EU), the aggregation function was applied and the result shows that the preference of the customer in NA and EU are similar to the global customers as the product ID smaller than 5,000 are both more popular. The histograms and box plots demonstrate that the purchasing power of the customer in NA and EU are slightly higher than global customers. The finding explains that Asian markets are highly potential. The deeper investigation of customer behaviour and the enhancement/improvement of marketing campaigns in Asia is worth to invest to penetrate the market.

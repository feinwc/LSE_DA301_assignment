## LSE Data Analytics Online Career Accelerator 

# DA301:  Advanced Analytics for Organisational Impact

###############################################################################

# Assignment template

## Scenario
## You are a data analyst working for Turtle Games, a game manufacturer and 
## retailer. They manufacture and sell their own products, along with sourcing
## and selling products manufactured by other companies. Their product range 
## includes books, board games, video games and toys. They have a global 
## customer base and have a business objective of improving overall sales 
##performance by utilising customer trends. 

## In particular, Turtle Games wants to understand:
## - how customers accumulate loyalty points (Week 1)
## - how useful are remuneration and spending scores data (Week 2)
## - can social data (e.g. customer reviews) be used in marketing 
##     campaigns (Week 3)
## - what is the impact on sales per product (Week 4)
## - the reliability of the data (e.g. normal distribution, Skewness, Kurtosis)
##     (Week 5)
## - if there is any possible relationship(s) in sales between North America,
##     Europe, and global sales (Week 6).

################################################################################

# Week 4 assignment: EDA using R

## The sales department of Turtle games prefers R to Python. As you can perform
## data analysis in R, you will explore and prepare the data set for analysis by
## utilising basic statistics and plots. Note that you will use this data set 
## in future modules as well and it is, therefore, strongly encouraged to first
## clean the data as per provided guidelines and then save a copy of the clean 
## data for future use.

# Instructions
# 1. Load and explore the data.
##  - Remove redundant columns (Ranking, Year, Genre, Publisher) by creating 
##      a subset of the data frame.
##  - Create a summary of the new data frame.
# 2. Create plots to review and determine insights into data set.
##  - Create scatterplots, histograms and boxplots to gain insights into
##      the Sales data.
##  - Note your observations and diagrams that could be used to provide
##      insights to the business.
# 3. Determine the impact on sales per product_id.
##  - Use the group_by and aggregate functions to sum the values grouped by
##      product.
##  - Create a summary of the new data frame.
# 4. Create plots to review and determine insights into the data set.
##  - Create scatterplots, histograms, and boxplots to gain insights into 
##     the Sales data.
##  - Note your observations and diagrams that could be used to provide 
##     insights to the business.
# 5. Include your insights and observations.

###############################################################################

# 1. Load and explore the data

# Install and import Tidyverse.
library('tidyverse')

# Import the data set.
turtle_sales <- read.csv(file.choose(), header=T)

# Print the data frame.
head(turtle_sales)

# Create a new data frame from a subset of the sales data frame - have created "turtle_sales" above.
# Remove unnecessary columns. 
turtle_sales_2 <- select(turtle_sales, -Ranking, -Year, -Genre, -Publisher)

# View the data frame.
View(turtle_sales_2)

# View the descriptive statistics.
summary(turtle_sales_2)

################################################################################

# 2. Review plots to determine insights into the data set.

## 2a) Scatterplots
# Create scatterplots.
qplot(Product, NA_Sales, data=turtle_sales_2)
qplot(Product, EU_Sales, data=turtle_sales_2)
qplot(Product, Global_Sales, data=turtle_sales_2)

## 2b) Histograms
# Create histograms.
qplot(NA_Sales, bins=5, data=turtle_sales_2)
qplot(EU_Sales, bins=5, data=turtle_sales_2)
qplot(Global_Sales, bins=5, data=turtle_sales_2)

## 2c) Boxplots
# Create boxplots.
qplot(NA_Sales, data=turtle_sales_2, geom='boxplot')
qplot(EU_Sales, data=turtle_sales_2, geom='boxplot')
qplot(Global_Sales, data=turtle_sales_2, geom='boxplot')
###############################################################################

# 3. Determine the impact on sales per product_id.

## 3a) Use the group_by and aggregate functions.
# Group data based on Product and determine the sum per Product.
global_sales_by_product <- aggregate(turtle_sales_2$Global_Sales, by=list(Product=turtle_sales_2$Product), FUN=sum)
# NA plus EU sales.
na_eu_sales_by_product <- aggregate(cbind(turtle_sales_2$NA_Sales,turtle_sales_2$EU_Sales), by=list(Product=turtle_sales_2$Product), FUN=sum)
na_eu_sales_by_product <- mutate(sales_by_product, na_eu_sales=V1+V2)

# View the data frame.
View(na_eu_sales_by_product)
View(Global_sales_by_product)

# Explore the data frame.
summary(na_eu_sales_by_product)
summary(Global_sales_by_product)

## 3b) Determine which plot is the best to compare game sales.
# Create scatterplots.
NA_EU_scatter <- qplot(Product, na_eu_sales, data=na_eu_sales_by_product)
NA_EU_scatter + scale_x_continuous(breaks=seq(100, 10000, 500))

Global_scatter <- qplot(Product, x, data=Global_sales_by_product)
Global_scatter + scale_x_continuous(breaks=seq(100, 10000, 500))

# Create histograms.
qplot(na_eu_sales, data=na_eu_sales_by_product)
qplot(x, data=Global_sales_by_product)

# Create boxplots.
qplot(na_eu_sales, data=na_eu_sales_by_product, geom='boxplot')
qplot(x, data=Global_sales_by_product, geom='boxplot')
###############################################################################

# 4. Observations and insights

## Your observations and insights here ......
Based on the scatter plots, three regions tend to have a slight negative relationship between product ID and sales, explaining that the greater the ID is, the lower the sales are. This is interesting as customer behaviour seems to have some similarities across the three regions. Product ID smaller than 5,000 seems more popular than product ID greater than 5,000. The histograms and plot boxes show that the distribution is skewed across the three regions, the majority of the clients spend between 0K to 5K in each region. To compare global sales in North America (NA) and Europe (EU), the aggregation function was applied and the result shows that the preference of the customer in NA and EU are similar to the global customers as the product ID smaller than 5,000 are both more popular. The histograms and box plots demonstrate that the purchasing power of the customer in NA and EU are slightly higher than global customers. The finding explains that Asian markets are highly potential. The deeper investigation of customer behaviour and the enhancement/improvement of marketing campaigns in Asia is worth to invest to penetrate the market.



###############################################################################
###############################################################################


# Week 5 assignment: Cleaning and maniulating data using R

## Utilising R, you will explore, prepare and explain the normality of the data
## set based on plots, Skewness, Kurtosis, and a Shapiro-Wilk test. Note that
## you will use this data set in future modules as well and it is, therefore, 
## strongly encouraged to first clean the data as per provided guidelines and 
## then save a copy of the clean data for future use.

## Instructions
# 1. Load and explore the data.
##  - Continue to use the data frame that you prepared in the Week 4 assignment. 
##  - View the data frame to sense-check the data set.
##  - Determine the `min`, `max` and `mean` values of all the sales data.
##  - Create a summary of the data frame.
# 2. Determine the normality of the data set.
##  - Create and explore Q-Q plots for all sales data.
##  - Perform a Shapiro-Wilk test on all the sales data.
##  - Determine the Skewness and Kurtosis of all the sales data.
##  - Determine if there is any correlation between the sales data columns.
# 3. Create plots to gain insights into the sales data.
##  - Compare all the sales data (columns) for any correlation(s).
##  - Add a trend line to the plots for ease of interpretation.
# 4. Include your insights and observations.

################################################################################

# 1. Load and explore the data

# View data frame created in Week 4.


# Check output: Determine the min, max, and mean values.


# View the descriptive statistics.


###############################################################################

# 2. Determine the normality of the data set.

## 2a) Create Q-Q Plots
# Create Q-Q Plots.



## 2b) Perform Shapiro-Wilk test
# Install and import Moments.


# Perform Shapiro-Wilk test.



## 2c) Determine Skewness and Kurtosis
# Skewness and Kurtosis.



## 2d) Determine correlation
# Determine correlation.


###############################################################################

# 3. Plot the data
# Create plots to gain insights into data.


###############################################################################

# 4. Observations and insights
# Your observations and insights here...


###############################################################################
###############################################################################

# Week 6 assignment: Making recommendations to the business using R

## The sales department wants to better understand if there is any relationship
## between North America, Europe, and global sales. Therefore, you need to
## investigate any possible relationship(s) in the sales data by creating a 
## simple and multiple linear regression model. Based on the models and your
## previous analysis (Weeks 1-5), you will then provide recommendations to 
## Turtle Games based on:
##   - Do you have confidence in the models based on goodness of fit and
##        accuracy of predictions?
##   - What would your suggestions and recommendations be to the business?
##   - If needed, how would you improve the model(s)?
##   - Explain your answers.

# Instructions
# 1. Load and explore the data.
##  - Continue to use the data frame that you prepared in the Week 5 assignment. 
# 2. Create a simple linear regression model.
##  - Determine the correlation between the sales columns.
##  - View the output.
##  - Create plots to view the linear regression.
# 3. Create a multiple linear regression model
##  - Select only the numeric columns.
##  - Determine the correlation between the sales columns.
##  - View the output.
# 4. Predict global sales based on provided values. Compare your prediction to
#      the observed value(s).
##  - NA_Sales_sum of 34.02 and EU_Sales_sum of 23.80.
##  - NA_Sales_sum of 3.93 and EU_Sales_sum of 1.56.
##  - NA_Sales_sum of 2.73 and EU_Sales_sum of 0.65.
##  - NA_Sales_sum of 2.26 and EU_Sales_sum of 0.97.
##  - NA_Sales_sum of 22.08 and EU_Sales_sum of 0.52.
# 5. Include your insights and observations.

###############################################################################

# 1. Load and explor the data
# View data frame created in Week 5.


# Determine a summary of the data frame.


###############################################################################

# 2. Create a simple linear regression model
## 2a) Determine the correlation between columns
# Create a linear regression model on the original data.



## 2b) Create a plot (simple linear regression)
# Basic visualisation.


###############################################################################

# 3. Create a multiple linear regression model
# Select only numeric columns from the original data frame.


# Multiple linear regression model.


###############################################################################

# 4. Predictions based on given values
# Compare with observed values for a number of records.



###############################################################################

# 5. Observations and insights
# Your observations and insights here...


###############################################################################
###############################################################################





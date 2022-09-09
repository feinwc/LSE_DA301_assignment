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

# 3. Observations and insights

## Your observations and insights here ......
# The summary, min, max, and mean functions were applied to understand the 
# descriptive statistics of the data. Based on the scatter plots, the three 
# regions tend to have a slight negative relationship between product ID and 
# sales, explaining that the greater the ID is, the lower the sales are. This 
# is interesting as customer behaviour seems to have a similar trend across the 
# three regions. Product ID smaller than 5,000 seems to be more popular than 
# product ID greater than 5,000. The histograms and plot boxes demonstrate that 
# the distribution is skewed across the three regions. There are some visible 
# outliers and 50% of the customers in NA spend approximately 0.5K to 3.1K, the 
# customers in EU spend only 0.4 to 2.1K, whilst global customers spend around 
# 1K - 6K. The result shows that more marketing campaigns that can be considered 
# in Europe and other regions are highly potential as they contributed a 
# significant portion of global sales.

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
# 2. Determine the impact on sales per product_id.
##  - Use the group_by and aggregate functions to sum the values grouped by
##      product.
##  - Create a summary of the new data frame.
# 3. Create plots to review and determine insights into the data set.
##  - Create scatterplots, histograms, and boxplots to gain insights into 
##     the Sales data.
##  - Note your observations and diagrams that could be used to provide 
##     insights to the business.
# 4. Determine the normality of the data set.
##  - Create and explore Q-Q plots for all sales data.
##  - Perform a Shapiro-Wilk test on all the sales data.
##  - Determine the Skewness and Kurtosis of all the sales data.
##  - Determine if there is any correlation between the sales data columns.
# 5. Create plots to gain insights into the sales data.
##  - Compare all the sales data (columns) for any correlation(s).
##  - Add a trend line to the plots for ease of interpretation.
# 6. Include your insights and observations.

################################################################################

# 1. Load and explore the data

# View data frame created in Week 4.

# Install and import Tidyverse.
library('tidyverse')

# Import the data set.
turtle_sales <- read.csv(file.choose(), header=T)

# Print the data frame.
head(turtle_sales)

# Create a new data frame from a subset of the sales data frame - have created "turtle_sales" above.
# Remove unnecessary columns. 
turtle_sales_2 <- select(turtle_sales, -Ranking, -Year, -Genre, -Publisher)

# Check output: Determine the min, max, and mean values.
min(turtle_sales_2$NA_Sales)
max(turtle_sales_2$NA_Sales)
mean(turtle_sales_2$NA_Sales)

min(turtle_sales_2$EU_Sales)
max(turtle_sales_2$EU_Sales)
mean(turtle_sales_2$EU_Sales)

min(turtle_sales_2$Global_Sales)
max(turtle_sales_2$Global_Sales)
mean(turtle_sales_2$Global_Sales)

# View the descriptive statistics.
summary(turtle_sales_2)

###############################################################################

# 2. Determine the impact on sales per product_id.

## 2a) Use the group_by and aggregate functions.
# Group data based on Product and determine the sum per Product.
global_sales_by_product <- aggregate(turtle_sales_2$Global_Sales, by=list(Product=turtle_sales_2$Product), FUN=sum)
# NA plus EU sales.
na_eu_sales_by_product <- aggregate(cbind(turtle_sales_2$NA_Sales,turtle_sales_2$EU_Sales), by=list(Product=turtle_sales_2$Product), FUN=sum)
na_eu_sales_by_product <- mutate(na_eu_sales_by_product, na_eu_sales=V1+V2)

# View the data frame.
View(na_eu_sales_by_product)
View(global_sales_by_product)

# Explore the data frame.
summary(na_eu_sales_by_product)
summary(global_sales_by_product)

## 2b) Determine which plot is the best to compare game sales.
# Create scatterplots.
NA_EU_scatter <- qplot(Product, na_eu_sales, data=na_eu_sales_by_product)
NA_EU_scatter + scale_x_continuous(breaks=seq(100, 10000, 500))

Global_scatter <- qplot(Product, x, data=global_sales_by_product)
Global_scatter + scale_x_continuous(breaks=seq(100, 10000, 500))

# Create histograms.
qplot(na_eu_sales, data=na_eu_sales_by_product)
qplot(x, data=global_sales_by_product)

# Create boxplots.
qplot(na_eu_sales, data=na_eu_sales_by_product, geom='boxplot')
qplot(x, data=global_sales_by_product, geom='boxplot')

###############################################################################

# 3. Determine the normality of the data set.

## 3a) Create Q-Q Plots
# Create Q-Q Plots.
qqnorm(global_sales_by_product$x)
qqline(global_sales_by_product$x, col='red')

qqnorm(na_eu_sales_by_product$na_eu_sales)
qqline(na_eu_sales_by_product$na_eu_sales, col='red')

## 3b) Perform Shapiro-Wilk test
# Install and import Moments.
library(moments)

# Perform Shapiro-Wilk test.
shapiro.test(global_sales_by_product$x)
shapiro.test(na_eu_sales_by_product$na_eu_sales)
# as p-value is well above 0.05, and we can conclude normal distribution

## 3c) Determine Skewness and Kurtosis
# Skewness and Kurtosis.

skewness(global_sales_by_product$x)
kurtosis(global_sales_by_product$x)
skewness(na_eu_sales_by_product$na_eu_sales)
kurtosis(na_eu_sales_by_product$na_eu_sales)

## 3d) Determine correlation
# Determine correlation.
cor(global_sales_by_product$x, global_sales_by_product$Product)
# The correlation coefficient of -0.61 suggests a negative correlation.
cor(na_eu_sales_by_product$na_eu_sales, na_eu_sales_by_product$Product)
# The correlation coefficient of -0.56 suggests a negative correlation.

###############################################################################

# 4. Plot the data
# Create plots to gain insights into data.
# Choose the type of plot you think best suits the data set and what you want 
# to investigate. Explain your answer in your report.

# Global:
ggplot(global_sales_by_product,
       mapping=aes(x=Product, y=x)) +
  geom_point(color='pink',
             alpha=0.75,
             size=2.5) +
  scale_x_continuous(breaks=seq(100, 10000, 500), "Product ID") +
  scale_y_continuous(breaks=seq(0, 100, 10), "Global Sales (in £k)") +
  labs(title="Global Sales (in £k) by Product ID",
       subtitle="A Survey from Sales Team of Turtle games, FY22") +
  theme_dark()

# NA + EU:
ggplot(na_eu_sales_by_product,
       mapping=aes(x=Product, y=na_eu_sales)) +
  geom_point(color='beige',
             alpha=0.75,
             size=2.5) +
  scale_x_continuous(breaks=seq(100, 10000, 500), "Product ID") +
  scale_y_continuous(breaks=seq(0, 100, 10), "Sales in NA + EU (in £k)") +
  labs(title="Sales in NA + EU (in £k) by Product ID",
       subtitle="A Survey from Sales Team of Turtle games, FY22") +
  theme_dark()
###############################################################################

# 5. Observations and insights
# Your observations and insights here...

# To compare global sales with North America (NA) and Europe (EU), the 
# aggregation function was applied. The result displays that the customer 
# preference in NA and EU are similar to the global customers as the product ID 
# smaller than 5,000 are both more popular. The histograms and box plots 
# demonstrate that the purchasing power of the customer in NA and EU can be 
# encouraged. Also, the finding explains that Eastern markets can be highly 
# potential as they also contributed to global sales. The deeper investigation 
# of customer behaviour and the enhancement/improvement of marketing campaigns 
# are worth to invest to penetrate more markets. The result of the Q-Q plots and
# the Shapiro test explains the data is normally distributed. However, the 
# skewness is greater than 3, showing that the data is high and positive skewed 
# (right-skewed) and heavy-tiled(leptokurtic). Both figures for kurtosis are 
# quite high (greater than 3), indicating that the data has heavier tails than 
# a normal distribution. The correlation coefficient (of -0.61 in global sales 
# and of -0.56 in NA+EU sales) suggests negative correlations. Finally, two 
# scatter plots were applied to understand the relationship between product ID 
# and sales. It’s interesting to find the global trend is quite similar to the 
# trend in NA+EU regions, which explains that the customer may have similar 
# customer behaviour, preference or attitudes towards Turtle games. The marketing 
# team can execute mass marketing strategies to acquire more customers in 
# different regions to extend the market.

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

# Import the data set.
turtle_sales <- read.csv(file.choose(), header=T)

# Remove unnecessary columns. 
turtle_sales_2 <- select(turtle_sales, -Ranking, -Year, -Genre, -Publisher)

# Determine a summary of the data frame.
summary(turtle_sales_2)

# Group data based on Product and determine the sum per Product.
df <- aggregate(cbind(turtle_sales_2$NA_Sales,turtle_sales_2$EU_Sales,turtle_sales_2$Global_Sales), by=list(Product=turtle_sales_2$Product), FUN=sum)
View(df)
###############################################################################

# 2. Create a simple linear regression model
## 2a) Determine the correlation between columns
# Create a linear regression model on the original data.

# NA v.s. Global
model1 <- lm(V3~V1, data=df)
model1
summary(model1)

reg1 <- select(df, V1, V3)
str(reg1)
reg1 %>% cor()

# EU v.s. Global
model2 <- lm(V3~V2, data=df)
model2
summary(model2)

reg2 <- select(df, V2, V3)
str(reg2)
reg2 %>% cor()

# NA v.s. EU
model3 <- lm(V2~V1, data=df)
model3
summary(model3)

reg3 <- select(df, V1, V2)
str(reg3)
reg3 %>% cor()

## 2b) Create a plot (simple linear regression)
# Basic visualisation.

# NA v.s. Global
ggplot(reg1, aes(V1,V3)) + geom_point() + geom_smooth(method='lm')

# EU v.s. Global
ggplot(reg2, aes(V2,V3)) + geom_point() + geom_smooth(method='lm')

# NA v.s. EU
ggplot(reg3, aes(V1,V2)) + geom_point() +geom_smooth(method='lm')

###############################################################################

# 3. Create a multiple linear regression model
# Select only numeric columns from the original data frame.
# df have been set up with only numeric columns
View(df)

# Multiple linear regression model.
modela = lm(V3~V1+V2, data=df)
summary(modela)
###############################################################################

# 4. Predictions based on given values
# Compare with observed values for a number of records.

# a.
Product <- 107
V1 <- c(34.02)
V2 <- c(23.80)
data <- data.frame(product, V1, V2)

predict(modela, newdata=data)
# predicted global sales = 68.05655

# b.
Product <- 123
V1 <- c(3.93)
V2 <- c(1.56)
data <- data.frame(product, V1, V2)

predict(modela, newdata=data)
# predicted global sales = 7.356754

# c.
Product <- 326
V1 <- c(2.73)
V2 <- c(0.65)
data <- data.frame(product, V1, V2)

predict(modela, newdata=data)
# predicted global sales = 4.908353

# d.
Product <- 254
V1 <- c(2.26)
V2 <- c(0.97)
data <- data.frame(product, V1, V2)

predict(modela, newdata=data)
# predicted global sales = 4.761039

# e.
Product <- 195
V1 <- c(22.08)
V2 <- c(0.52)
data <- data.frame(product, V1, V2)

predict(modela, newdata=data)
# predicted global sales = 26.62556
###############################################################################

# 5. Observations and insights
# Your observations and insights here...

# The result of the linear regression model of NA and Global sales (model1) 
# shows that approximately 84% of the global sales can be affected by NA sales 
# (Adjusted R-squared:  0.8385), demonstrating NA sales have a strong relationship
# with global sales. Approximately 72% of global sales can be influenced by EU 
# sales (model2, Adjusted R-squared:  0.7185). Approximately 38% of EU sales 
# are associated with NA sales (model3, Adjusted R-squared:  0.382). 
# The correlation score also indicates the variables have strong correlations
# with one another (r ≈ 1). Also, the scatter plots explain that each variable
# has a positive relationship with one another. The outcome of the multiple 
# linear regression model reveals that approximately 97% of global sales can 
# be explained by NA and EU sales (Adjusted R-squared:  0.9664). NA and EU 
# sales show the significance associated with global sales 
# (***, p-value < 0.001). Through the prediction model, global sales can be 
# predicted by inputting NA and EU sales. The result shows the predicted 
# global sales is ≈ 68.1 when NA and EU sales are equal to 34.02 and 23.80 
# respectively; ≈ 7.3 when NA and EU sales equal to 3.93 and 1.56 respectively;
# ≈ 4.9 when NA and EU sales equal to 2.73 and 0.65 respectively; ≈ 4.8 
# when NA and EU sales equal to 2.26 and 0.91 respectively; ≈ 26.6 when NA 
# and EU sales equal to 22.08 and 0.52 respectively. 
# In summary, NA and EU sales are highly associated with global sales in this 
# model. Although the model has performed well, more variables can still 
# improve the model to create business success in real life.
###############################################################################
###############################################################################





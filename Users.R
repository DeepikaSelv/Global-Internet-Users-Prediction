# Load the required libraries
library(forecast)
library(ggpubr)
library(factoextra)

# Read the dataset
data <- read.csv("C:\\Users\\DEEPIKA S\\OneDrive\\Desktop\\Sem IV\\PA lab\\Project-PA\\global.csv")

# Data preprocessing for time series
ts_data <- ts(data$Internet.Users, start = c(2011), frequency = 1)

# Split the data into training and test sets
train_data <- window(ts_data, end = c(2020))
test_data <- window(ts_data, start = c(2021))

# Time series forecasting with ARIMA
arima_model <- auto.arima(train_data)
forecast_values <- forecast(arima_model, h = 10) # Predicting the next 10 values

# Plotting the forecast
plot(forecast_values, main = "Time Series Forecasting with ARIMA", ylab = "Internet Users", xlab = "Year", xlim = c(2021, 2030))
lines(test_data, col = "blue")
legend("bottomright", legend = c("Actual", "Forecast"), col = c("blue", "red"), lty = 1)

# Evaluate the forecast
accuracy(forecast_values, test_data)

# Select numeric columns for clustering
numeric_cols <- sapply(data, is.numeric)
df_numeric <- data[, numeric_cols]

# Compute k-means with k = 3
set.seed(123)
res.km <- kmeans(scale(df_numeric), 3, nstart = 25)

# K-means clusters showing the group of each individual
res.km$cluster

# Visualize clustering results
fviz_cluster(res.km, data = df_numeric,
             palette = c("#2E9FDF", "#00AFBB", "#E7B800"), 
             geom = "point",
             ellipse.type = "convex", 
             ggtheme = theme_bw()
)

# Perform PCA
pca_result <- prcomp(df_numeric, scale. = TRUE)

# Access the PCA results
pca_result$rotation # Principal components (loadings)
pca_result$x # Transformed data (scores)
pca_result$sdev # Standard deviations of the principal components

# Visualize PCA results
fviz_pca_ind(pca_result, col.ind = data$Continent, palette = "jco")

# Variable Importance Plot
fviz_contrib(pca_result, choice = "var", axes = 1:2, color = "blue")

# Linear Regression
lm_result <- lm(Internet.Users ~., data = data[, numeric_cols])
summary(lm_result)


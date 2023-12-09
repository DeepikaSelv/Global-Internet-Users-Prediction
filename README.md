# Global-Internet-Users-Prediction
Overview
This project involves time series forecasting using ARIMA, clustering with k-means, principal component analysis (PCA), and linear regression. The code is written in R and utilizes various libraries for statistical analysis and visualization.

Code Structure
Loading Libraries:

forecast: For time series forecasting.
ggpubr: For visualization purposes.
factoextra: For clustering and PCA visualization.
Data Loading:

Reads the dataset "global.csv" from the specified file path.
Time Series Forecasting:

Converts the data into a time series.
Splits the data into training and test sets.
Utilizes ARIMA for time series forecasting.
Plots the forecast along with actual values.
Clustering with k-means:

Selects numeric columns for clustering.
Performs k-means clustering with k = 3.
Visualizes clustering results using a scatter plot.
Principal Component Analysis (PCA):

Applies PCA to numeric columns.
Visualizes PCA results, including individual scores and variable loadings.
Linear Regression:

Performs linear regression on numeric columns.
Displays the summary of the regression analysis.
Usage
Ensure that R and the required libraries are installed.
Provide the correct file path for the dataset.
Run the script to perform time series forecasting, clustering, PCA, and linear regression.

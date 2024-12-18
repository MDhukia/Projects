Stock Price Prediction
Overview
This project involves building a linear regression model to predict Google stock prices using historical data. The project demonstrates data preprocessing, visualization, and forecasting future stock prices with machine learning techniques.

Features
Data Preprocessing: Scaled and prepared data for training and testing.
Visualization:
Daily trading volumes and closing prices over the years using Plotly.
Comprehensive analysis of open, high, low, and close prices.
Histogram of daily price changes to observe market trends.
Prediction: Predicts stock prices for the next 5 days using the Linear Regression model.
Technologies Used
Python Libraries:
numpy, pandas for data manipulation.
sklearn for model training and evaluation.
plotly for interactive visualizations.
Steps to Run the Project
Clone the repository to your local machine.
Install the required libraries:
bash
Copy code
pip install numpy pandas scikit-learn plotly
Download the GOOG.csv file with Google stock data and place it in the project folder.
Run the script to process and analyze the stock data, and train the linear regression model.
Expected Output
1. Data Visualizations
Daily Trading Volume Plot:
A line graph showing the daily trading volume over time.
Closing Prices Over the Years:
A line graph indicating the trend of closing prices over the dataset period.
Stock Price Analysis:
Combined plot of open, high, low, and close prices, with markers and lines.
Histogram of Daily Price Changes:
A histogram displaying the distribution of daily price differences.
2. Prediction Results
Test Score (Model Accuracy):

The score variable reflects the accuracy of the model on the test set (e.g., 0.85 or 85%).
Forecasted Prices (Next 5 Days):

The forecast array contains predicted stock prices for the next 5 days based on the trained model.

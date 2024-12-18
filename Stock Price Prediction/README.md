# **Stock Price Prediction**

## **Overview**
This project involves building a **linear regression model** to predict Google stock prices using historical data. The project demonstrates:
- Data preprocessing.
- Visualization of stock trends using Plotly.
- Forecasting stock prices with machine learning.

---

## **Features**
- **Data Preprocessing:**
  - Scaled and prepared data for training and testing.
- **Visualization:**
  - Daily trading volumes and closing prices over the years using Plotly.
  - Combined analysis of open, high, low, and close prices.
  - Histogram of daily price changes to observe market trends.
- **Prediction:**
  - Predicts stock prices for the next 5 days using the **Linear Regression** model.

---

## **Technologies Used**
- **Python Libraries:**
  - `numpy`, `pandas` for data manipulation.
  - `scikit-learn` for model training and evaluation.
  - `plotly` for interactive visualizations.

---

## **Steps to Run the Project**
1. Clone the repository to your local machine.
2. Install the required libraries:
   ```bash
   pip install numpy pandas scikit-learn plotly
3. Download the `GOOG.csv` file with Google stock data and place it in the project folder.  
4. Open the Python script file `stock_prediction.py` in your preferred code editor (e.g., Visual Studio Code, Jupyter Notebook).  
5. Run the script to process and analyze the stock data, train the linear regression model, and generate predictions:  
   ```bash
   python stock_prediction.py

   ---

### **Expected Output**

### **1. Data Visualizations**
- **Daily Trading Volume Plot:**
  - A line graph showing the daily trading volume over time.
- **Closing Prices Over the Years:**
  - A line graph indicating the trend of closing prices over the dataset period.
- **Stock Price Analysis:**
  - Combined plot of open, high, low, and close prices, with markers and lines.
- **Histogram of Daily Price Changes:**
  - A histogram displaying the distribution of daily price differences.

### **2. Prediction Results**
- **Test Score (Model Accuracy):**
  - The `score` variable reflects the accuracy of the model on the test set (e.g., 0.85 or 85%).
- **Forecasted Prices (Next 5 Days):**
  - Example output:
    ```json
    {
      "test_score": 0.85,
      "forecast_set": [2980.45, 2995.12, 3003.67, 3010.84, 3025.60]
    }
    ```


# Flood-Risk-Prediction

Week 6 report and the corresponding data files &amp; Explanation for the  (13) Flood Risk Prediction.

# **Project Title:** Flood Risk Prediction


**Group Members**

* Yogeshwaran N
* Soumyadeep Bhattacharyya
* **Ramkrishna Ghosh**


## 1. Introduction

Floods are among the most devastating natural disasters, causing significant loss of life, infrastructure damage, and economic disruption. Accurate flood risk prediction is essential for disaster preparedness, early warning systems, and sustainable urban planning. This project focuses on predicting flood risk zones by integrating historical rainfall, river level, and geospatial data using data analytics, machine learning, and GIS-based visualization techniques.

The project follows an end-to-end data analytics pipeline, starting from data collection and preprocessing to predictive modeling and dashboard-based visualization for decision support.

---

## 2. Objectives

* Analyze historical rainfall and river level data to understand flood patterns
* Predict flood occurrence (classification) and flood severity (regression)
* Identify high-risk flood zones using spatial (GIS) analysis
* Develop an interactive dashboard for flood risk monitoring and early warning support

---

## 3. Data Sources

The project integrates multiple heterogeneous datasets to capture hydrological, meteorological, and geographical flood drivers:

* Historical rainfall data (mm)
* River gauge readings (river level and flow rate)
* Meteorological parameters (temperature, humidity, wind speed, wind direction)
* Topographic data (elevation)
* Land-use / land-cover data
* Soil texture classification
* Urban indicators (impervious surface percentage, population, population density)

All datasets were unified into a single analytical dataset after preprocessing.

---

## 4. Tools and Technologies Used

### 4.1 Programming & Analysis

* **R:** Data cleaning, statistical summaries, and exploratory visualization
* **Python:** ETL pipeline, preprocessing, feature engineering, EDA, machine learning (classification & regression)

### 4.2 GIS & Visualization

* **Python GIS Libraries:** GeoPandas, Matplotlib, Contextily
* **Tableau:** Interactive dashboards, KPI cards, and spatial flood risk maps

---

## 5. Methodology

### 5.1 Data Integration (ETL)

Rainfall, river, meteorological, and geospatial datasets were merged using spatial (latitude–longitude, city) and temporal (date) attributes to create a unified dataset.

### 5.2 Data Cleaning (R)

* Removal of duplicate records
* Handling missing values using statistical imputation
* Standardization of column names and data types
* Filtering noisy and inconsistent observations

#### 5.2.1 Dataset Loading and Environment Setup

The dataset was loaded using `read.csv()` in R. Required libraries such as **dplyr**, **ggplot2**, and **reshape2** were installed and loaded to support data manipulation and visualization.

#### 5.2.2 Data Type Correction

* Timestamp converted from character to `Date`
* Categorical variables converted to factor types
* Dataset structure verified using `str()`

#### 5.2.3 Missing Value Assessment

Missing values were assessed using `is.na()` across all columns. No critical missing values were detected, indicating good data quality.

#### 5.2.4 Column Renaming for Standardization

Column names were simplified using `rename()` from **dplyr** to improve readability and reduce modeling errors.

#### 5.2.5 Outlier Detection

Outliers were identified using boxplots for key hydrological and meteorological variables. Extreme values were retained, as they represent realistic flood indicators.

#### 5.2.6 Exploratory Data Visualization

* Histogram analysis of river levels
* Time-series rainfall trends
* Monthly flow rate boxplots

These visualizations revealed seasonal and extreme-event patterns.

#### 5.2.7 Column Removal

Redundant attributes (numeric landcover and soil texture codes) were removed to reduce dimensionality.

---

## 5.3 Data Preprocessing

* Normalization and scaling of numerical features
* Encoding of categorical variables
* Temporal feature extraction from date fields

### 5.3.1 Feature Engineering (Python)

* Rainfall intensity indicators
* River level deviation metrics
* Urbanization indicators
* Temporal features (month, season)

---

## 5.5 Exploratory Data Analysis (EDA)

EDA revealed strong relationships between rainfall, river level, elevation, and flood occurrence through statistical summaries, correlation analysis, and spatial visualization.

---

## 5.7 Feature Engineering

### Log Transformation

Applied `log1p()` to river level and flow rate to handle skewness and stabilize variance.

### Lag Features

City-wise lag features were created for rainfall, river level, and flow rate to capture hydrological memory.

### Rolling Window Features

3-day and 7-day rolling rainfall, flow rate, and river level statistics were computed.

### Trend Indicators

Day-to-day change indicators were added to detect sudden flood-triggering rises.

### Train–Test Temporal Split

January–June data used for training; July reserved for testing to avoid data leakage.

---

## 5.8 Machine Learning Modeling

### Regression Modeling

Two XGBoost regression models were trained:

* River Level Prediction
* Flow Rate Prediction

**Performance:**

* River Level: R² = 0.998
* Flow Rate: R² = 0.980

### Severity Score & Risk Classification

Severity scores were computed using weighted prediction errors and categorized into:

* No Risk
* Low
* Medium
* High
* Very High

### Feature Importance

Lagged river levels, rolling averages, and elevation emerged as dominant predictors.

---

## 5.8 Dashboard Development (Tableau)

* KPI cards for rainfall, river level, and flood risk
* Temporal and city-wise flood trends
* Map-based flood risk visualization
* Filters: Month, Day, Flood Risk Category


<img width="1413" height="773" alt="image" src="https://github.com/user-attachments/assets/f4384aea-2f34-4a87-a477-40e808cbc40f" />
<img width="1386" height="758" alt="image" src="https://github.com/user-attachments/assets/c8014d9a-4f2c-474b-82ce-640925a2fd3e" />


**Map Configuration:**

* Latitude & Longitude with Aggregate Measures OFF
* Flood Risk Category used as color and legend filter

---

## 6. Results and Findings

* Flood risk is strongly driven by rainfall intensity and river level
* Urban areas show increased vulnerability due to impervious surfaces
* Spatial analysis highlights region-specific flood hotspots
* ML models demonstrate high predictive reliability

---

## 7. Expected Outcome

* Early flood risk indicators
* Decision-support insights for disaster management authorities
* Improved flood preparedness and mitigation planning

---

## 8. Challenges

* Integration of multi-source datasets
* Handling noisy real-world data
* Maintaining accuracy under dynamic weather conditions

---


## 9. Conclusion

This project demonstrates a complete flood risk prediction framework by integrating data analytics, machine learning, GIS, and visualization. The system provides a robust, interpretable, and scalable decision-support solution for flood risk assessment and disaster management.

---

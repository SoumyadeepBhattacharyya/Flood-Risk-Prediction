#                           Load the Dataset

install.packages("dplyr")

# Load necessary libraries
library(dplyr)
library(ggplot2)

# Read the dataset
data <- read.csv("E:\\GNCIPL\\Week 6\\final_dataset_with_flood_status R.csv")
#data <- read.csv("E:\\GNCIPL\\Week 6\\111_Final_cleaned_dataset_flood_risk.csv")

# Take a look at the first few rows
head(data)


#                        Fixing Data Types

# Convert date column to Date type
data$timestamp  <- as.Date(data$timestamp , format = "%Y-%m-%d")

# Convert categorical columns to factor
data$City <- as.factor(data$City)
data$landcover_class <- as.factor(data$landcover_class)
data$soil_texture_class <- as.factor(data$soil_texture_class)

# Check data types
str(data)



#                       Handle Missing Values

# Check for missing values
colSums(is.na(data))


# Check data again
summary(data)




#                       Renaming the column

library(dplyr)

df <- data %>%
  rename(
    date = timestamp,
    city = City,
    temp_c = temp_C,
    humidity_percentage = humidity_.,
    impervious_percent = impervious_percent_ghsl_2018_15km2,
    city_population = worldpop_total_pop_2020_10km2,
    city_wise_pop_density = worldpop_density_2020_10km2,
    soil_class = soil_texture_class
  )

summary(df)

#                           Detecting Outliers

#Outlier detection using boxplot
# Select key columns for outlier detection

# Boxplot 1
key_columns <- df %>% select(river_level, flow_rate, rain_mm,)

# Melt the data into long format for ggplot (requires reshape2 package)
library(reshape2)
melted_data <- melt(key_columns)

# Create a boxplot for each key variable in one chart
ggplot(melted_data, aes(x = variable, y = value, fill = variable)) +
  geom_boxplot() +
  labs(title = "Outlier Detection for Key Variables", x = "Variable", y = "Value")
summary(key_columns)


# Boxplot 2
key_columns2 <- df %>% select(elevation_m, impervious_percent, temp_c, city_wise_pop_density)

# Melt the data into long format for ggplot (requires reshape2 package)
library(reshape2)
melted_data2 <- melt(key_columns2)

# Create a boxplot for each key variable in one chart
ggplot(melted_data2, aes(x = variable, y = value, fill = variable)) +
  geom_boxplot() +
  labs(title = "Outlier Detection for Key Variables", x = "Variable", y = "Value")
summary(key_columns2)


#                              Visualization

# Example histogram of river levels
ggplot(df, aes(x = river_level)) +
  geom_histogram(binwidth = 0.5, fill = "blue", color = "black") +
  labs(title = "Distribution of River Levels", x = "River Level", y = "Frequency")

# Example time series plot of rainfall over months
ggplot(df, aes(x = date, y = rain_mm)) +
  geom_line(color = "green") +
  labs(title = "Rainfall Over Time", x = "Date", y = "Rainfall (mm)")

# Example boxplot of flow rate by month
df$month <- format(df$date, "%m")
ggplot(df, aes(x = month, y = flow_rate)) +
  geom_boxplot(fill = "orange") +
  labs(title = "Flow Rate by Month",x = "Month", y = "Flow Rate")


# Removing Columns 
df1 <- df %>% 
  select(-landcover_code, -texture_code)

summary(df1)

# Exporting data 

getwd()

write.csv(df1, "E:\\GNCIPL\\Week 6\\Cleaned_flood_risk_prediction_dataset.csv", row.names = FALSE)



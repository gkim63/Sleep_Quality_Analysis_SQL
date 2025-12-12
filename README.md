# Sleep_Quality_Analysis_SQL

## Project Overview
This project analyzes employee sleep patterns and wellness metrics to identify trends and insights across demographic and lifestyle factors.  
The goal is to support data-driven decisions for improving employee well-being and workplace wellness programs.

## Dataset
- Source: [Kaggle - Sleep Disorder Diagnosis Dataset](https://www.kaggle.com/datasets/varishabatool/disorder)  
- Format: CSV  
- Contents: Occupation, sleep duration, sleep quality, physical activity, stress level  
- Notes: No personally identifiable information included.  
- Dtat structure: 3,900 rows, 13 columns

## Analyses & Key Insights

## Analyses & Key Insights

### 1. Sleep Duration Analysis by Occupation
- **Purpose:** Evaluate average sleep duration by occupation and categorize individuals into `Warning / Normal / Good` based on ±1 hour deviation from the occupational average.
- **Insight:** Engineers sleep the longest (7.99h) with the lowest Warning rate (4.8%), while Nurses sleep less (7.06h) with the highest Warning count (14, 9.2%). Sales Representatives have the lowest sleep quality.  
  → Occupations with lower sleep quality or higher Warning rates may require targeted wellness programs.
  
![Sleep Duration Analysis by Occupation](Images/1. Sleep Duration Analysis by Occupation.png)

---

### 2. Age Group Sleep Comparison
- **Purpose:** Compare average sleep duration across age groups (20s, 30s, 40s, 50s, 60+) and identify differences from younger groups.
- **Data Highlights:**  
  - Average sleep(h): 20s → 6.47, 30s → 7.07, 40s → 6.91, 50s → 7.63  
  - Differences from previous age group: 30s → +0.6, 40s → -0.16, 50s → +0.72  
- **Insight:** Employees in their 50s sleep the most, while 20s sleep the least. Younger employees may benefit from targeted wellness interventions to improve sleep.

![Age Group Sleep Comparison](images/2_Age_Group_Sleep_Comparison.png)

---

### 3. Physical Activity Level & Sleep Quality
- **Purpose:** Examine the relationship between physical activity levels and sleep quality/duration.
- **Data Highlights:**  
  - Activity level ranges 30–40 → 81–90  
  - Average sleep quality: 30–40 → 7.04, 41–50 → 6.54, 51–60 → 7.87, 61–70 → 7.60, 71–80 → 8.04, 81–90 → 7.13  
- **Insight:**
  - Generally, higher physical activity correlates with better sleep quality.
  - However, excessive activity (81–90) shows a slight decrease in sleep quality compared to 71–80), suggesting too much physical activity may negatively affect sleep duration and quality. → Wellness programs should encourage moderate activity levels for optimal sleep outcomes.

![Physical Activity Level & Sleep Quality](images/3_Physical_Activity_Level_and_Sleep_Quality.png)

---

### 4. Gender-Based Sleep Analysis
- **Purpose:** Compare sleep duration and quality between genders.
- **Data Highlights:**  
  - Male: Avg Sleep 7.04h, Sleep Quality 6.96  
  - Female: Avg Sleep 7.23h, Sleep Quality 7.66  
- **Insight:** Women sleep longer and have higher sleep quality than men. Gender-specific wellness strategies may improve overall employee health.

![Gender-Based Sleep Analysis](images/4_Gender_Based_Sleep_Analysis.png)

---

### 5. BMI Category Analysis
- **Purpose:** Assess whether BMI category influences sleep duration, sleep quality, and stress level.
- **Data Highlights:**  
  - Normal: Sleep 7.39, Quality 7.66, Stress 5.13  
  - Normal Weight: Sleep 7.33, Quality 7.43, Stress 5.19  
  - Overweight: Sleep 6.77, Quality 6.90, Stress 5.73  
  - Obese: Sleep 6.96, Quality 6.40, Stress 5.70  
- **Insight:** Higher BMI groups show lower sleep quality and higher stress. Wellness programs should integrate sleep improvement and weight management strategies.
- 
![BMI Category Analysis](images/5_BMI_Category_Analysis.png)

---

### 6. Sleep Duration Group Comparison
- **Purpose:** Segment employees into Short, Moderate, and Long sleep groups and compare wellness metrics.
- **Data Highlights:**  
  - Moderate Sleep: Sleep Quality 6.92, Stress 5.94, Activity 60.02  
  - Long Sleep: Sleep Quality 9.00, Stress 3.03, Activity 55.56  
- **Insight:** Longer sleep duration is associated with higher sleep quality and lower stress. Encouraging sufficient sleep can enhance overall wellness.


![Sleep Duration Group Comparison](images/6_Sleep_Duration_Group_Comparison.png)

---

## 🛠 Tech Stack
- SQL (CTE, Join, Case, Window Functions)  
- MySQL compatible queries

---

## Overall Portfolio Takeaways
- Sleep patterns and quality are influenced by **occupation, age, physical activity, gender, and BMI**.  
- Data-driven insights highlight where **targeted wellness programs** can improve employee health.  
- Analysis demonstrates ability to **extract insights from SQL queries**, understand patterns, and propose actionable solutions.



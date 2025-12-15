-- Created DB
CREATE DATABASE mydb;
USE mydb;

-- 1. Sleep Duration Analysis by Occupation
-- Calculate average sleep duration per occupation and categorize each person's sleep status (Warning / Normal / Good)
-- Deviation from occupation average (±1 hour)
-- Occupations with a high Warning rate may need targeted wellness programs
WITH SleepCalc AS (
    SELECT
        `Person ID`,
        Occupation,
        `Sleep Duration`,
        AVG(`Sleep Duration`) OVER (PARTITION BY Occupation) AS OccAvg,
        CASE
            WHEN `Sleep Duration` < AVG(`Sleep Duration`) OVER (PARTITION BY Occupation) - 1 
                THEN 'Warning'
            WHEN `Sleep Duration` > AVG(`Sleep Duration`) OVER (PARTITION BY Occupation) + 1 
                THEN 'Good'
            ELSE 'Normal'
        END AS Sleep_Status
    FROM Sleep_Disorder
)
SELECT 
    Occupation,
    ROUND(AVG(`Sleep Duration`), 2) AS Avg_Sleep,
    SUM(Sleep_Status = 'Warning') AS Warning_Count,
    SUM(Sleep_Status = 'Normal') AS Normal_Count,
    SUM(Sleep_Status = 'Good') AS Good_Count,
    ROUND(AVG(CASE WHEN Sleep_Status = 'Warning' THEN 1 ELSE 0 END) * 100, 1) AS Warning_Rate_Percent
FROM SleepCalc
GROUP BY Occupation
ORDER BY Warning_Rate_Percent DESC;

-- 2. Sleep Duration Differences by Age Group
-- Compare average sleep duration across age groups
-- Group employees by age, compute difference from immediately younger group
-- Identify which age groups sleep more or less than others
WITH Age_Categorized AS(
	SELECT *,
		CASE
			WHEN Age BETWEEN 20 AND 29 THEN '20-29'
            WHEN Age BETWEEN 30 AND 39 THEN '30-39'
            WHEN Age BETWEEN 40 AND 49 THEN '40-49'
            WHEN Age BETWEEN 50 AND 59 THEN '50-59'
            ELSE '60s+'
		END AS Age_Group
	FROM Sleep_Disorder
)
SELECT
    Age_Group, 
    COUNT(*) AS People_Count,
    ROUND(AVG(`Sleep Duration`), 2) AS Avg_Sleep_Duration,
    RANK() OVER (ORDER BY AVG(`Sleep Duration`) DESC) AS Sleep_Rank,
    ROUND(AVG(`Sleep Duration`) - LAG(AVG(`Sleep Duration`)) OVER (ORDER BY Age_Group), 2) AS Diff_From_Younger_Gen
FROM Age_Categorized
GROUP BY Age_Group
ORDER BY Age_Group;

-- 3. Sleep Duration & Quality Based on Physical Activity Level
-- Evaluate average sleep duration and quality based on physical activity level
-- Group activity levels into ranges and calculate averages
-- Determine if higher physical activity correlates with better sleep
SELECT 
	CASE
		WHEN `Physical Activity Level` BETWEEN 30 and 40 THEN '30-40'
        WHEN `Physical Activity Level` BETWEEN 41 and 50 THEN '41-50'
        WHEN `Physical Activity Level` BETWEEN 51 and 60 THEN '51-60'
        WHEN `Physical Activity Level` BETWEEN 61 and 70 THEN '61-70'
        WHEN `Physical Activity Level` BETWEEN 71 and 80 THEN '71-80'
        WHEN `Physical Activity Level` BETWEEN 81 and 90 THEN '81-90'
	END AS Physical_Activity_Group,
	COUNT(*) AS People_Count,
	ROUND(AVG(`Physical Activity Level`), 1) AS Avg_Activity_Level,
    ROUND(AVG(`Sleep Duration`), 2) AS Avg_Sleep_Duration,
    ROUND(AVG(`Quality of Sleep`), 2) AS Avg_Sleep_Quality
FROM Sleep_Disorder
GROUP BY Physical_Activity_Group
ORDER BY Physical_Activity_Group;

-- 4. Gender-Based Sleep Analysis
-- Compare sleep duration and quality between genders
-- Group by gender and calculate average sleep duration and quality
-- Identify behavioral or lifestyle differences affecting employee well-being
WITH Employee_Info AS (
    SELECT `Person ID`, Gender FROM Sleep_Disorder
),
Sleep_Facts AS (
    SELECT `Person ID`, `Sleep Duration`, `Quality of Sleep`
    FROM Sleep_Disorder
)
SELECT 
    e.Gender,
    COUNT(*) AS People_Count,
    ROUND(AVG(f.`Sleep Duration`),2) AS Avg_Sleep,
    ROUND(AVG(f.`Quality of Sleep`),2) AS Avg_Quality
FROM Employee_Info e
JOIN Sleep_Facts f
    ON e.`Person ID` = f.`Person ID`
GROUP BY e.Gender;
   

-- 5. Sleep Duration & Quality by BMI Category
-- Evaluate if BMI category affects sleep duration, quality, and stress levels
-- Group by BMI category and compute averages
-- Understand potential health risks and well-being differences across BMI groups
SELECT 
    `BMI Category`,
    COUNT(*) AS People_Count,
    ROUND(AVG(`Sleep Duration`), 2) AS Avg_Sleep_Duration,
    ROUND(AVG(`Quality of Sleep`), 2) AS Avg_Sleep_Quality,
    ROUND(AVG(`Stress Level`), 2) AS Avg_Stress_Level
FROM Sleep_Disorder
GROUP BY `BMI Category`
ORDER BY Avg_Sleep_Quality DESC;

-- 6. Sleep Duration Group Comparison
-- Compare wellness metrics across Short, Moderate, and Long sleep groups
-- Segment employees by sleep duration and compute average quality, stress, and activity
-- Assess how sleep length impacts overall well-being and lifestyle balance
SELECT 
    CASE 
        WHEN `Sleep Duration` >= 8 THEN 'Long Sleep'
        WHEN `Sleep Duration` <= 5 THEN 'Short Sleep'
        ELSE 'Moderate Sleep'
    END AS Sleep_Group,
    ROUND(AVG(`Quality of Sleep`), 2) AS Avg_sleep_quality,
    ROUND(AVG(`Stress Level`), 2) AS Avg_stress,
    ROUND(AVG(`Physical Activity level`), 2) AS Avg_activity,
    COUNT(*) AS Count_people
FROM Sleep_Disorder
GROUP BY Sleep_Group;
  
        

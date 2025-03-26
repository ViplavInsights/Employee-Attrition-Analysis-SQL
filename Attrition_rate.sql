CREATE DATABASE hr_analytics;

USE hr_analytics;
CREATE TABLE employees (
    EmpID VARCHAR(10) PRIMARY KEY,
    Attrition VARCHAR(3),
    Department VARCHAR(50),
    JobSatisfaction INT,
    MonthlyIncome INT,
    WorkLifeBalance INT,
    YearsAtCompany INT
);

SELECT * FROM employees;

-- 1. Total employees in each department
SELECT Department, COUNT(*) AS Total_Employees
FROM employees
GROUP BY Department;

-- 2. Attrition rate in each department
SELECT Department, 
       COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS Attrition_RateFROM employees
GROUP BY Department
ORDER BY Attrition_Rate DESC;


-- 3. Average Monthly Income for employees who left vs. stayed
SELECT Attrition,ROUND( AVG(MonthlyIncome), 1) AS Avg_Income
FROM employees
GROUP BY Attrition;

-- 4. Department with highest job satisfaction
SELECT Department, AVG(JobSatisfaction) AS Avg_JobSatisfaction
FROM employees
GROUP BY Department
ORDER BY Avg_JobSatisfaction DESC
LIMIT 3;

-- 5. Distribution of employees based on work-life balance
SELECT WorkLifeBalance, COUNT(*) AS Total_Employees
FROM employees
GROUP BY WorkLifeBalance
ORDER BY  Total_Employees
LIMIT 3;

-- 6. Department with the longest average tenure
SELECT Department, AVG(YearsAtCompany) AS Avg_Tenure
FROM employees
GROUP BY Department
ORDER BY Avg_Tenure DESC
LIMIT 3;

-- 7. Employees with highest job satisfaction but left the company
SELECT EmpID, JobSatisfaction
FROM employees
WHERE Attrition = 'Yes' AND JobSatisfaction = 4;

-- 8. Employees with highest job satisfaction and work-life balance
SELECT COUNT(*) AS Employees_Count
FROM employees
WHERE JobSatisfaction = 4 AND WorkLifeBalance = 4;

-- 9. Department with most employees having low job satisfaction
SELECT Department, COUNT(*) AS Low_Satisfaction_Count
FROM employees
WHERE JobSatisfaction <= 2
GROUP BY Department
ORDER BY Low_Satisfaction_Count DESC
LIMIT 3;

-- 10. Checking correlation between Monthly Income and Attrition
SELECT Attrition, AVG(MonthlyIncome) AS Avg_Income
FROM employees
GROUP BY Attrition
ORDER BY Avg_Income DESC
LIMIT 3;


-- 11. SELECT Department, 
       SELECT Department, 
       COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS Attrition_Rate
FROM employees
GROUP BY Department
ORDER BY Attrition_Rate DESC
LIMIT 1;

-- 12. SELECT JobSatisfaction, 
      
      SELECT JobSatisfaction, 
       COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS Attrition_Rate
FROM employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

-- 13. SELECT 
    SELECT 
    CASE 
        WHEN MonthlyIncome < 30000 THEN 'Below 30K'
        WHEN MonthlyIncome BETWEEN 30000 AND 60000 THEN '30K-60K'
        ELSE 'Above 60K'
    END AS Salary_Bracket,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS Attrition_Rate
FROM employees
GROUP BY Salary_Bracket
ORDER BY Attrition_Rate DESC;

-- 14. SELECT WorkLifeBalance, 
       COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS Attrition_Rate
FROM employees
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

SELECT * FROM  employees;

-- 15. SELECT ROUND(AVG(YearsAtCompany), 1) AS Avg_Tenure_Before_Leaving
FROM employees
WHERE Attrition = 'Yes';








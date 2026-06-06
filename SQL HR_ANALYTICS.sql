create database project_HR_analytics;
use project_HR_analytics;
select *from hr_1;
select *from hr_2;

# JOINS
SELECT *
FROM hr_1 h1
JOIN hr_2 h2
ON h1.EmployeeNumber = h2.Employee_ID;

# TOTAL emp
select count(employeenumber)
from hr_1;

# avg salary
SELECT ROUND(AVG(MonthlyIncome),2) as AVG_SALARY FROM hr_2;

#Avg Working Years
SELECT ROUND(AVG(YearsAtCompany),2)
 FROM hr_2;

#Average Attrition Rate 
SELECT 
count(CASE WHEN h1.Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS Attrition_Rate
FROM hr_1 h1
JOIN hr_2 h2
ON h1.EmployeeNumber = h2.Employee_ID;

#Avg Hourly Rate of Male Research Scientist
SELECT 
ROUND(AVG(h1.HourlyRate),2) AS Avg_Hourly_Rate
FROM hr_1 h1
JOIN hr_2 h2
ON h1.EmployeeNumber = h2.Employee_ID
WHERE h1.Gender = 'Male'
AND h1.JobRole = 'Research Scientist';

# Attrition Rate vs Monthly Income
SELECT 
h2.MonthlyIncome,
round(
COUNT(CASE WHEN h1.Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*),2) AS Attrition_Rate
FROM hr_1 h1
JOIN hr_2 h2
ON h1.EmployeeNumber = h2.Employee_ID
GROUP BY h2.MonthlyIncome
ORDER BY h2.MonthlyIncome;

# Avg Working Years per Department
SELECT 
h1.Department,
AVG(h2.YearsAtCompany) AS Avg_Working_Years
FROM hr_1 h1
JOIN hr_2 h2
ON h1.EmployeeNumber = h2.Employee_ID
GROUP BY h1.Department;

# Job Role vs Work Life Balance
SELECT 
h1.JobRole,
ROUND(AVG(h2.WorkLifeBalance),2) AS Work_Life_Balance
FROM hr_1 h1
JOIN hr_2 h2
ON h1.EmployeeNumber = h2.Employee_ID
GROUP BY h1.JobRole;

# Department-wise Attrition
SELECT Department,
COUNT(CASE WHEN Attrition='Yes' THEN 1 END)
AS ATTRITION_RATE
FROM hr_1
GROUP BY Department;

# Attrition vs Years Since Last Promotion
SELECT 
h2.YearsSinceLastPromotion,
COUNT(CASE WHEN h1.Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS Attrition_Rate
FROM hr_1 h1
JOIN hr_2 h2
ON h1.EmployeeNumber = h2.Employee_ID
GROUP BY h2.YearsSinceLastPromotion
ORDER BY h2.YearsSinceLastPromotion
LIMIT 5 ;

# Year since last Promotion wise high values Analysis 
SELECT YearsSinceLastPromotion,
COUNT(*) AS LAST_PRMOTION_Analysis
FROM hr_2
GROUP BY YearsSinceLastPromotion
order by LAST_PRMOTION_Analysis desc
limit 5;

# Department wise Employee Distribution
select department,
count(employeecount) as Employee_Distribution
from hr_1
group by department;

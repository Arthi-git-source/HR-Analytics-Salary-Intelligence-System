-- 1. Total Employees
SELECT COUNT(*) AS total_employees FROM employees;

-- 2. Attrition Count
SELECT attrition, COUNT(*) AS count
FROM employees
GROUP BY attrition;

-- 3. Attrition Rate (%)
SELECT 
    (SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS attrition_rate
FROM employees;

-- 4. Avg Salary by Department
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC;

-- 5. Avg Performance Rating
SELECT AVG(performance_rating) AS avg_rating FROM employees;

-- 6. Salary vs Experience
SELECT experience_years, AVG(salary) AS avg_salary
FROM employees
GROUP BY experience_years
ORDER BY experience_years;

-- 7. Attrition by Department
SELECT department, COUNT(*) AS attrition_count
FROM employees
WHERE attrition = 'Yes'
GROUP BY department;

-- 8. Top Paid Employees
SELECT name, department, salary
FROM employees
ORDER BY salary DESC
LIMIT 5;

-- 9. Gender Distribution
SELECT gender, COUNT(*) AS count
FROM employees
GROUP BY gender;

-- 10. Department-wise Headcount
SELECT department, COUNT(*) AS total
FROM employees
GROUP BY department;

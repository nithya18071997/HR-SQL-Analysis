# HR-SQL-Analysis
SQL project analyzing HR employee data
SQL project readme

Project Overview:
This project focuses on analyzing HR employee data using SQL. The goal is to clean, transform, and extract meaningful insights related to employee performance, salary, retention, and demographics.

Dataset Details:
The dataset contains employee-related information such as:
Employee Name & ID
Department
Salary
Date of Hire & Termination
Performance Score
Gender & Marital Status
Engagement & Satisfaction Scores

Tools Used:
PostgreSQL
SQL (DDL, DML, Aggregations, Window functions basics)

Steps Performed:
1. Table Creation
Created hr_analysis table with relevant columns
Defined primary key (EmpID)
Assigned appropriate data types
2. Data Import
Imported CSV file using:
SQL
COPY hr_analysis 
FROM 'D:/hranalysis.csv'
DELIMITER ','
CSV HEADER;
3. Data Cleaning
Handled NULL values (salary replaced with average)
Removed duplicate records using ctid
Standardized text (UPPER, TRIM)
4. Data Transformation
Created new columns:
age
yearofexperience
Used AGE() and DATE_PART() functions
5. Data Analysis Queries
Employee count by status
Retention rate calculation
Department-wise active vs terminated employees
High salary outliers detection
Performance-based filtering
Gender distribution

Key SQL Concepts Used
GROUP BY & HAVING
Aggregate Functions (AVG, COUNT, STDDEV)
Subqueries
Data Cleaning Techniques
Filtering with conditions
Date functions

Insights:
Identified employees with salaries above average + 3*std deviation
Calculated retention rate using termination data
Found department-wise employee distribution
Highlighted top-performing employees

Conclusion:
This project demonstrates strong SQL skills including data cleaning, transformation, and business-driven analysis. It provides actionable insights into workforce trends and employee performance.

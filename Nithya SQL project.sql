CREATE TABLE hr_analysis (
    Employee_Name TEXT,
    EmpID INT PRIMARY KEY,
    MarriedID INT,
    MaritalStatusID INT,
    GenderID INT,
    EmpStatusID INT,
    DeptID INT,
    PerfScoreID INT,
    FromDiversityJobFairID INT,
    Salary NUMERIC,
    Termd INT,
    PositionID INT,
    Position TEXT,
    State VARCHAR(2),
    Zip VARCHAR(10),
    DOB DATE,
    Sex VARCHAR(1),
    MaritalDesc TEXT,
    CitizenDesc TEXT,
    HispanicLatino VARCHAR(3),
    RaceDesc TEXT,
    DateofHire DATE,
    DateofTermination DATE,
    TermReason TEXT,
    EmploymentStatus TEXT,
    Department TEXT,
    ManagerName TEXT,
    ManagerID INT,
    RecruitmentSource TEXT,
    PerformanceScore TEXT,
    EngagementSurvey NUMERIC,
    EmpSatisfaction INT,
    SpecialProjectsCount INT,
    LastPerformanceReview_Date DATE,
    DaysLateLast30 INT,
    Absences INT
);
set datestyle = 'MDY';
copy hr_analysis from 'D:/hranalysis.csv'
delimiter ','
header csv;
select * from hr_analysis;

select * from hr_analysis limit 10;

select count(*) from hr_analysis;

select * from hr_analysis 
where salary is null or department is null or dateoftermination is null;

select dateoftermination from hr_analysis;

select count(*) filter (where dateoftermination is null)as workers_count from hr_analysis;

select salary from hr_analysis

update hr_analysis set salary = (select avg(salary)from hr_analysis) where salary is null

select empid,count(*) from hr_analysis group by empid having count(*)>1

delete from hr_analysis a using hr_analysis b where a.ctid<b.ctid and a.empid=b.empid

update hr_analysis set department=upper(department)

update hr_analysis set employee_name=trim(employee_name)

select * from hr_analysis where salary>(select avg(salary)+3 * stddev(salary) from hr_analysis)

select employee_name,date_part('year',age(current_date,dob))as age from hr_analysis

alter table hr_analysis add column age int
update hr_analysis set age=date_part('year',age(current_date,dob))

select employee_name,date_part('year',age(current_date,dateofhire)) as yearofexperience from hr_analysis

alter table hr_analysis add column yearofexperience int
update hr_analysis set yearofexperience=date_part('year',age(current_date,dateofhire))

select employmentstatus,count(*)as total_emp from hr_analysis group by employmentstatus

select count(*) filter (where termd=1)as terminated, count(*) filter (where termd=0)as active,
round(count(*) filter (where termd=1)::numeric / count(*) *100,2) as retention_rate from hr_analysis  

select department,count(*) filter (where termd=0) as active,
count(*) filter (where termd=1) as discontinued from hr_analysis group by department order by department

select employee_name, salary, performancescore from hr_analysis where performancescore='Exceeds' order by salary desc

select sex,count(*) from hr_analysis group by sex;
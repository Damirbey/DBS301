-- ***********************
-- Name: Damirkhon Yodgorov 
-- ID: 108364175
-- Date: 2018-10-04
-- Purpose: Lab 4 DBS301
-- *********************** 

-- *************************************************************************************************


-- QUESTION 1

-- Display the difference between the Average pay and lowest pay in the company. Name
-- this result Real Amount. Format the output as currency with 2 decimal places. 

-- SOLUTION FOR QUESTION 1

    SELECT to_char(ROUND((AVG(SALARY)-MIN(SALARY)),2),'$999,999.99') as "Real Amount" FROM EMPLOYEES;


-- *************************************************************************************************


-- QUESTION 2

-- Display the department number and Highest, Lowest and Average pay per each
-- department. Name these results High, Low and Avg. Sort the output so that the
-- department with highest average salary is shown first. Format the output as currency
-- where appropriate. 

-- SOLUTION FOR QUESTION 2

    SELECT DEPARTMENT_ID ,to_char(MAX(SALARY),'$999,999.99') as High,to_char(MIN(SALARY),'$999,999.99') as Low ,to_char(ROUND(AVG(SALARY),2),'$999,999.99') as Average
    FROM EMPLOYEES 
    WHERE DEPARTMENT_ID IS NOT NULL
    GROUP BY DEPARTMENT_ID
    ORDER BY 4 DESC;


-- *************************************************************************************************

-- QUESTION 3

--  Display how many people work the same job in the same department. Name these
--  results Dept#, Job and How Many. Include only jobs that involve more than one person.
--  Sort the output so that jobs with the most people involved are shown first. 

-- SOLUTION FOR QUESTION 3

   SELECT DEPARTMENT_ID as Dept#,JOB_ID as Job,COUNT(EMPLOYEE_ID) as "How Many" 
   FROM EMPLOYEES
   WHERE DEPARTMENT_ID IS NOT NULL
   GROUP BY JOB_ID, DEPARTMENT_ID
   HAVING COUNT(EMPLOYEE_ID)>1
   ORDER BY 3 DESC;

-- *************************************************************************************************

-- QUESTION 4

-- For each job title display the job title and total amount paid each month for this type of
-- the job. Exclude titles AD_PRES and AD_VP and also include only jobs that require more
-- than $12,000. Sort the output so that top paid jobs are shown first. 

-- SOLUTION FOR QUESTION 4

   SELECT JOB_ID as "Job Title", SUM(SALARY) as "Total amount paid"
   FROM EMPLOYEES
   WHERE JOB_ID!='AD_PRES' AND JOB_ID!='AD_VP'
   GROUP BY JOB_ID
   HAVING SUM(SALARY)>12000
   ORDER BY 2 DESC;

-- *************************************************************************************************

-- QUESTION 5

-- For each manager number display how many persons he / she supervises. Exclude
-- managers with numbers 100, 101 and 102 and also include only those managers that
-- supervise more than 2 persons. Sort the output so that manager numbers with the
-- most supervised persons are shown first. 

-- SOLUTION FOR QUESTION 5

  SELECT MANAGER_ID , COUNT(EMPLOYEE_ID) as "Supervised people"
  FROM EMPLOYEES 
  WHERE MANAGER_ID NOT IN(100,101,102) 
  GROUP BY MANAGER_ID
  HAVING COUNT(EMPLOYEE_ID)>2
  ORDER BY 2 DESC;
  
-- *************************************************************************************************

-- QUESTION 6

-- For each department show the latest and earliest hire date, BUT
-- exclude departments 10 and 20
-- exclude those departments where the last person was hired in this century.
-- Sort the output so that the most recent, meaning latest hire dates, are shown first. 

-- SOLUTION FOR QUESTION 6

   SELECT DEPARTMENT_ID , MIN(HIRE_DATE) as Earliest, MAX(HIRE_DATE) as Latest
   FROM EMPLOYEES
   WHERE DEPARTMENT_ID IS NOT NULL AND DEPARTMENT_ID NOT IN(10,20) 
   GROUP BY DEPARTMENT_ID
   HAVING MAX(HIRE_DATE)<'1-JAN-01'
   ORDER BY 3 DESC;

-- *************************************************************************************************

   

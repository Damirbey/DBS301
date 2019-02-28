-- *********************** 
-- Name: Damirkhon Yodgorov
-- ID: 108364175
-- Date: 1.11.2018 
-- Purpose: Lab 7 DBS301 
-- *********************** 
 
--*****************************************************************************

-- QUESTION 1:
-- The HR department needs a list of department IDs for departments that do not contain the job ID ST_CLERK. 
-- Use set operators to create this report. 

-- ANSWER FOR QUESTION 1:

    SELECT department_id
    FROM DEPARTMENTS
    MINUS
    SELECT department_id
    FROM EMPLOYEES
    WHERE job_id='ST_CLERK';

--*****************************************************************************

-- QUESTION 2:
-- The HR department needs a list of countries that have no departments located in them. 
-- Display the country ID and the name of the countries. Use set operators to create this report.  

-- ANSWER FOR QUESTION 2:

   SELECT COUNTRY_ID,COUNTRY_NAME
   FROM COUNTRIES
   MINUS
   SELECT c.country_id, c.country_name
   FROM COUNTRIES c
   JOIN LOCATIONS l
   ON c.Country_id=l.Country_id
   JOIN DEPARTMENTS d
   ON d.Location_id=l.Location_id;
   
   
--*****************************************************************************

-- QUESTION 3:
-- Produce a list of jobs for departments 10, 50, and 20, in that order. 
-- Display job ID and department ID using set operators.  
-- (In your result, you will have first rows with Department ID 10 and then 50 and finally 20). 

-- ANSWER FOR QUESTION 3:

   SELECT DISTINCT JOB_ID, DEPARTMENT_ID
   FROM EMPLOYEES
   WHERE DEPARTMENT_ID=10
   UNION ALL
   SELECT DISTINCT JOB_ID, DEPARTMENT_ID
   FROM EMPLOYEES
   WHERE DEPARTMENT_ID=50
   UNION ALL
   SELECT DISTINCT JOB_ID, DEPARTMENT_ID
   FROM EMPLOYEES
   WHERE DEPARTMENT_ID=20;

--*****************************************************************************

-- QUESTION 4:
-- Create a report that lists the employee IDs and job IDs of those employees who currently have a job title that is the same 
-- as their job title when they were initially hired by the company (that is, they changed jobs but have now gone back to doing 
-- their original job). 

-- ANSWER FOR QUESTION 4:
   
   SELECT EMPLOYEE_ID, JOB_ID 
   FROM EMPLOYEES
   INTERSECT
   SELECT EMPLOYEE_ID, JOB_ID
   FROM JOB_HISTORY;
   
--*****************************************************************************

-- QUESTION 5:
-- 	Create following reports:  
-- a.Department ID of all departments that have employees working in them. (Use set operators to find these departments) 

-- ANSWER FOR QUESTION 5 PART a:
   SELECT department_id
   FROM EMPLOYEES
   WHERE department_id IS NOT NULL
   INTERSECT
   SELECT department_id
   FROM DEPARTMENTS;


-- b.Department ID of all departments that do not have employees assigned to them. (Use set operators to find these departments) 

-- ANSWER FOR QUESTION 5 PART b:
   
   SELECT department_id
   FROM DEPARTMENTS
   MINUS
   SELECT department_id 
   FROM EMPLOYEES
   WHERE department_id IS NOT NULL;

--*****************************************************************************

-- QUESTION 6:
-- 	The HR department needs a report with the following specifications: 
--   	=> Last name, department ID, and department’s name of all the employees from the EMPLOYEES table, regardless of whether or not they belong to a department  
--   	=> Department ID and department name of all the departments from the DEPARTMENTS table, regardless of whether or not they have employees working in them 

-- ANSWER FOR QUESTION 6:

   SELECT last_name,department_id, TO_CHAR(NULL)
   FROM employees
   UNION
   SELECT TO_CHAR(NULL),department_id,department_name
   FROM departments;

--*****************************************************************************

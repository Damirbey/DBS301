-- ***********************
-- Name: Damirkhon Yodgorov
-- ID: 108364175
-- Date: 27.09.2018
-- Purpose: Lab 3 DBS301
-- ***********************

--***************************************************

-- QUESTION 1

-- Write a query to display the tomorrow’s date in the following format:
-- September 28th of year 2016
-- Your result will depend on the day when you RUN/EXECUTE this query. Label the
-- column Tomorrow. 

-- SOLUTION FOR QUESTION 1

SELECT to_char(sysdate+1,'Month dd"th of year" yyyy') "Tomorrow" FROM DUAL;


--***************************************************


-- QUESTION 2
-- For each employee in departments 20, 50 and 60 display last name, first name, salary,
-- and salary increased by 5% and expressed as a whole number. Label the column Good
-- Salary.
-- Also add a column that subtracts the old salary from the new salary and multiplies by
-- 12. Label the column "Annual Pay Increase". 

-- SOLUTION FOR QUESTION 2

SELECT LAST_NAME, FIRST_NAME, to_char(SALARY,'$999,999.99') as SALARY, to_char((SALARY*0.05)+SALARY,'$999,999.99') as " Good Salary", to_char((((SALARY*0.05)+SALARY)-SALARY)*12,'$999,999.99') as "Annual Pay Increase"
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN(20,50,60);


--***************************************************

-- QUESTION 3
-- Write a query that displays the employee’s Full Name and Job Title in the following
-- format:
-- DAVIES, CURTIS is ST_CLERK
-- Only employees whose last name ends with S and first name starts with C or K. Give this
-- column an appropriate label like Person and Job. Sort the result by the employees’ last
-- names.

-- SOLUTION FOR QUESTION 3

SELECT CONCAT(CONCAT(CONCAT(CONCAT(LAST_NAME,', '),FIRST_NAME),' is '),JOB_ID) as "Person and Job"
FROM EMPLOYEES
WHERE SUBSTR(LAST_NAME,-1,1)='s' AND (SUBSTR(FIRST_NAME,1,1) in('C','K'))
ORDER BY LAST_NAME;

--***************************************************

-- QUESTION 4
-- . For each employee hired before 1992, display the employee’s last name, hire date and
--  calculate the number of YEARS between TODAY and the date the employee was hired.
--  a. Label the column Years worked. 
-- SOLUTION FOR QUESTION 4 PART A

SELECT LAST_NAME, HIRE_DATE, (SYSDATE-HIRE_DATE)/365 AS "Year Worked" FROM EMPLOYEES
WHERE HIRE_DATE<'01-FEB-92';

-- b. Order your results by the number of years employed. Round the number of
-- years employed up to the closest whole number. 
-- SOLUTION FOR QUESTION 4 PART B

SELECT LAST_NAME, HIRE_DATE, ROUND((SYSDATE-HIRE_DATE)/365) AS "Year Worked" FROM EMPLOYEES
WHERE HIRE_DATE<'31-DEC-91'
ORDER BY 3;

--***************************************************

-- QUESTION 5
-- Create a query that displays the city names, country codes and state province names,
-- but only for those cities that starts with S and has at least 8 characters in their name. If
-- city does not have a province name assigned, then put Unknown Province. Be cautious
-- of case sensitivity! 

-- SOLUTION FOR QUESTION 5 

SELECT CITY, COUNTRY_ID, NVL(state_province, 'Unknown Province') as "STATE_PROVINCE"
FROM LOCATIONS
WHERE city LIKE 'S%' AND LENGTH(city) > 8;

--***************************************************

-- QUESTION 6
-- Display each employee’s last name, hire date, and salary review date, which is the first
-- Thursday after a year of service, but only for those hired after 1997. 
-- a. Label the column REVIEW DAY. 
-- SOLUTION FOR QUESTION 6 PART a

SELECT LAST_NAME, HIRE_DATE, NEXT_DAY((HIRE_DATE+365),'Thursday') AS "REVIEW DAY" 
FROM EMPLOYEES
WHERE HIRE_DATE > '31-DEC-97';

-- b. Format the dates to appear in the format like: 
-- THURSDAY, August the Thirty-First of year 1998
-- SOLUTION FOR QUESTION 6 PART B

SELECT LAST_NAME, HIRE_DATE, TO_CHAR(NEXT_DAY((HIRE_DATE+365), 'Thursday'), 'DAY, Month "the" DdSpTh "of year" YYYY') AS "REVIEW DAY" 
FROM EMPLOYEES
WHERE HIRE_DATE > '31-DEC-97';

-- c. Sort by review date 

SELECT LAST_NAME, HIRE_DATE, TO_CHAR(NEXT_DAY((HIRE_DATE+365), 'Thursday'), 'DAY, Month "the" DdSpTh "of year" YYYY') AS "REVIEW DAY" 
FROM EMPLOYEES
WHERE HIRE_DATE > '31-DEC-97'
ORDER BY NEXT_DAY((HIRE_DATE+365),'Thursday');

--***************************************************

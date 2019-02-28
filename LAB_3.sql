-- ***********************
-- Name: Damirkhon Yodgorov 
-- ID: 108364175
-- Date: 2018-10-08
-- Purpose: Lab 5 DBS301
-- ***********************

-- ******************************************************************************************************

-- QUESTION 1 

-- Display the department name, city, street address and postal code for departments
-- sorted by city and department name. 

-- SOLUTION FOR QUESTION 1

   SELECT d.Department_name, l.city, l.street_address,l.postal_code  
   FROM DEPARTMENTS d JOIN LOCATIONS l 
   ON d.location_id=l.location_id
   ORDER BY l.city, d.department_name;
   
-- ******************************************************************************************************

-- QUESTION 2

-- Display full name of employees as a single field using format of Last, First, their hire
-- date, salary, department name and city, but only for departments with names starting
-- with an A or S sorted by department name and employee name.

-- SOLUTION FOR QUESTION 2

   SELECT e.LAST_NAME||','||e.FIRST_NAME  as "Employee Name", e.HIRE_DATE,e.SALARY , d.Department_Name, l.city 
   FROM EMPLOYEES e JOIN DEPARTMENTS d
   ON e.DEPARTMENT_ID=d.DEPARTMENT_ID
   JOIN LOCATIONS l
   ON d.location_id=l.location_id
   WHERE d.DEPARTMENT_NAME LIKE 'A%' OR d.DEPARTMENT_NAME LIKE 'S%'
   ORDER BY d.DEPARTMENT_NAME, 1;

-- ******************************************************************************************************

-- QUESTION 3

-- Display the full name of the manager of each department in states/provinces of Ontario,
-- California and Washington along with the department name, city, postal code and
-- province name. Sort the output by city and then by department name. 

-- SOLUTION FOR QUESTION 3
    
   SELECT e.LAST_NAME||','||e.FIRST_NAME as "MANAGER", d.DEPARTMENT_NAME, l.CITY, l.POSTAL_CODE, l.STATE_PROVINCE
   FROM EMPLOYEES e JOIN DEPARTMENTS d
   ON e.MANAGER_ID=d.MANAGER_ID
   JOIN LOCATIONS l
   ON d.LOCATION_ID=l.LOCATION_ID
   WHERE LOWER(l.STATE_PROVINCE) IN('ontario','california','washington')
   ORDER BY l.CITY, d.DEPARTMENT_NAME;
   
-- ******************************************************************************************************   

-- QUESTION 4

-- Display employee’s last name and employee number along with their manager’s last
-- name and manager number. Label the columns Employee, Emp#, Manager, and Mgr#
-- respectively.

-- SOLUTION FOR QUESTION 4

    SELECT e.LAST_NAME as "Employee", e.EMPLOYEE_ID  as "Emp#", m.LAST_NAME as "Manager",  e.MANAGER_ID as "Mgr#"
    FROM EMPLOYEES e JOIN EMPLOYEES m ON (e.MANAGER_ID = m.EMPLOYEE_ID);

-- ******************************************************************************************************   

-- QUESTION 5

-- Display the department name, city, street address, postal code and country name for all
-- Departments. Use the JOIN and USING form of syntax. Sort the output by department
-- name descending. 

-- SOLUTION FOR QUESTION 5

    SELECT d.DEPARTMENT_NAME, l.CITY, l.STREET_ADDRESS,l.POSTAL_CODE,c.COUNTRY_NAME
    FROM DEPARTMENTS d JOIN LOCATIONS l USING(LOCATION_ID)
    JOIN COUNTRIES c USING (COUNTRY_ID)
    ORDER BY d.DEPARTMENT_NAME DESC;
    
-- ******************************************************************************************************  

-- QUESTION 6

-- Display full name of the employees, their hire date and salary together with their
-- department name, but only for departments which names start with A or S.

-- a. Full name should be formatted: First / Last.
-- b. Use the JOIN and ON form of syntax.
-- c. Sort the output by department name and then by last name. 
    
-- SOLUTION FOR QUESTION 6
   
   SELECT e.FIRST_NAME||'/'||e.LAST_NAME as "EMPLOYEE NAME", e.HIRE_DATE, e.SALARY, d.DEPARTMENT_NAME
   FROM EMPLOYEES e JOIN DEPARTMENTS d
   ON d.DEPARTMENT_ID=e.DEPARTMENT_ID
   WHERE d.DEPARTMENT_NAME LIKE 'A%' OR d.DEPARTMENT_NAME LIKE 'S%'
   ORDER BY d.DEPARTMENT_NAME, e.LAST_NAME;
   
   
-- ****************************************************************************************************** 

-- QUESTION 7

-- Rewrite the previous question by using Standard (Old -- prior to Oracle9i) Join method.
   
-- SOLUTION FOR QUESTION 7

   SELECT e.FIRST_NAME||'/'||e.LAST_NAME as "EMPLOYEE NAME", e.HIRE_DATE, e.SALARY, d.DEPARTMENT_NAME
   FROM EMPLOYEES e ,DEPARTMENTS d
   WHERE e.DEPARTMENT_ID=d.DEPARTMENT_ID AND
   ( d.DEPARTMENT_NAME LIKE 'A%' OR d.DEPARTMENT_NAME LIKE 'S%')
   ORDER BY d.DEPARTMENT_NAME, e.LAST_NAME;
   
-- ****************************************************************************************************** 

-- QUESTION 8

-- Display full name of the manager of each department in provinces Ontario, California
-- and Washington plus department name, city, postal code and province name.
-- a. Full name should be formatted: Last, First.
-- b. Use the JOIN and ON form of syntax.
-- c. Sort the output by city and then by department name. 

-- SOLUTION FOR QUESTION 8

   SELECT e.LAST_NAME||','||e.FIRST_NAME as "MANAGER NAME" , d.DEPARTMENT_NAME, l.CITY, l.POSTAL_CODE,l.STATE_PROVINCE
   FROM EMPLOYEES e JOIN DEPARTMENTS d 
   ON e.MANAGER_ID=d.MANAGER_ID
   JOIN LOCATIONS l
   ON d.LOCATION_ID=l.LOCATION_ID
   WHERE LOWER(l.STATE_PROVINCE) IN('ontario','washington','california')
   ORDER BY l.CITY, d.DEPARTMENT_NAME; 
   
-- ****************************************************************************************************** 

-- QUESTION 9

-- Rewrite the previous question by using Standard (Old -- prior to Oracle9i) Join method.
   
-- SOLUTION FOR QUESTION 9
   SELECT e.LAST_NAME||','||e.FIRST_NAME as "MANAGER NAME" , d.DEPARTMENT_NAME, l.CITY, l.POSTAL_CODE,l.STATE_PROVINCE
   FROM EMPLOYEES e ,DEPARTMENTS d, LOCATIONS l 
   WHERE (e.MANAGER_ID=d.MANAGER_ID AND 
          d.LOCATION_ID=l.LOCATION_ID)
   AND LOWER(l.STATE_PROVINCE) IN('ontario','washington','california')
   ORDER BY l.CITY, d.DEPARTMENT_NAME;

-- ****************************************************************************************************** 

-- QUESTION 10

-- Display the department name and Highest, Lowest and Average pay per each
-- department. Name these results High, Low and Avg.
-- a. Use JOIN and ON form of the syntax.
-- b. Sort the output so that department with highest average salary are shown first. 

-- SOLUTION FOR QUESTION 10

    SELECT d.DEPARTMENT_NAME, MAX(e.SALARY) as "HIGH", MIN(e.SALARY) as "LOW", ROUND(AVG(e.SALARY),2) as "AVG"
    FROM DEPARTMENTS d JOIN EMPLOYEES e
    ON e.DEPARTMENT_ID=d.DEPARTMENT_ID
    GROUP BY d.DEPARTMENT_NAME
    ORDER BY 4 DESC;
    
-- ****************************************************************************************************** 

-- QUESTION 11

-- Display the employee last name and employee number along with their manager’s last
-- name and manager number. Label the columns Employee,
-- a. Emp#, Manager, and Mgr#, respectively.
-- b. Include also employees who do NOT have a manager and also employees who
-- do NOT supervise anyone (or you could say managers without employees to
-- supervise). 

-- SOLUTION FOR QUESTION 11

    SELECT e.LAST_NAME as "Employee", e.EMPLOYEE_ID  as "Emp#", m.LAST_NAME as "Manager",  e.MANAGER_ID as "Mgr#"
    FROM EMPLOYEES e FULL OUTER JOIN EMPLOYEES m ON (e.MANAGER_ID = m.EMPLOYEE_ID);

-- ****************************************************************************************************** 

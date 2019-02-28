-- Name: Damirkhon Yodgorov
-- Student Id: 108364175
-- Seneca Email: dyodgorov@myseneca.ca
-- Completion Date: 17.10.2018


-- ************************************************************************************

-- QUESTION 1:
-- SET AUTOCOMMIT ON (do this each time you log on) so any updates, deletes and inserts
-- are automatically committed before you exit from Oracle. 

-- SOLUTION :

   SET AUTOCOMMIT ON;

-- ************************************************************************************

-- QUESTION 2:
-- Create an INSERT statement to do this. Add yourself as an employee with a NULL salary,
-- 0.2 commission_pct, in department 90, and Manager 100. You started TODAY. 

-- SOLUTION:

   INSERT INTO EMPLOYEES
   VALUES(170,'DAMIRKHON','YODGOROV','My EMAIL',NULL,SYSDATE,'IT_PROG',NULL,0.2,100,90);

-- ************************************************************************************

--QUESTION 3:

-- Create an Update statement to: Change the salary of the employees with a last name of
-- Matos and Whalen to be 2500

-- SOLUTION :

    UPDATE EMPLOYEES
    SET SALARY=2500
    WHERE LOWER(LAST_NAME)='matos' OR LOWER(LAST_NAME)='whalen';

-- ************************************************************************************

-- You must use subqueries for these questions (must minimize the number of tables being used
-- in the main query) 

-- ************************************************************************************


-- QUESTION 4:

-- Display the last names of all employees who are in the same department as the
-- employee named Abel.

-- SOLUTION: 

     SELECT LAST_NAME FROM EMPLOYEES 
     WHERE DEPARTMENT_ID=
                        (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE LOWER(LAST_NAME)='abel');
                
                
-- ************************************************************************************  

--QUESTION 5:

-- Display the last name of the lowest paid employee(s) 

-- SOLUTION :

    SELECT LAST_NAME FROM EMPLOYEES
    WHERE SALARY=
                 (SELECT MIN(SALARY) FROM EMPLOYEES);


-- ************************************************************************************    

-- QUESTION 6:

-- Display the city that the lowest paid employee(s) are located in. 

-- SOLUTION :

    SELECT l.CITY FROM EMPLOYEES e JOIN DEPARTMENTS D 
    ON e.DEPARTMENT_ID=d.DEPARTMENT_ID
    JOIN LOCATIONS l
    ON l.LOCATION_ID=d.LOCATION_ID
    WHERE e.SALARY=
                 (SELECT MIN(SALARY) FROM EMPLOYEES);
                 
-- ************************************************************************************   

-- QUESTION 7:

-- Display the last name, department_id, and salary of the lowest paid employee(s) in each
-- department. Sort by Department_ID. (HINT: careful with department 60) 

-- SOLUTION :

    SELECT LAST_NAME, DEPARTMENT_ID, SALARY 
    FROM EMPLOYEES
    WHERE SALARY IN
                 (SELECT MIN(SALARY) FROM EMPLOYEES
                  GROUP BY DEPARTMENT_ID)
                  
                   AND DEPARTMENT_ID IS NOT NULL
                   AND LOWER(LAST_NAME)!='ernst';

-- ************************************************************************************   

-- QUESTION 8: 

-- Display the last name of the lowest paid employee(s) in each city 

-- SOLUTION :

    SELECT  e.LAST_NAME,l.CITY FROM EMPLOYEES e JOIN 
    DEPARTMENTS d ON e.DEPARTMENT_ID=d.DEPARTMENT_ID JOIN LOCATIONS l
    ON d.LOCATION_ID =l.LOCATION_ID
    WHERE SALARY IN
                (SELECT  MIN(e.SALARY) FROM EMPLOYEES e JOIN 
                 DEPARTMENTS d ON e.DEPARTMENT_ID=d.DEPARTMENT_ID JOIN LOCATIONS l
                 ON d.LOCATION_ID =l.LOCATION_ID 
                 GROUP BY l.CITY);
                 
-- ************************************************************************************ 

-- QUESTION 9:

-- Display last name and salary for all employees who earn less than the lowest salary in
-- ANY department. Sort the output by top salaries first and then by last name.

-- SOLUTION :

    SELECT LAST_NAME, SALARY FROM EMPLOYEES 
    WHERE SALARY < ANY
                      (SELECT MIN(SALARY)FROM EMPLOYEES 
                       GROUP BY DEPARTMENT_ID)
                       ORDER BY SALARY DESC, LAST_NAME;
                
-- ************************************************************************************ 

-- QUESTION 10:

-- Display last name, job title and salary for all employees whose salary matches any of the
-- salaries from the IT Department. Do NOT use Join method.
-- Sort the output by salary ascending first and then by last_name .

-- SOLUTION :
    
    SELECT LAST_NAME,JOB_ID,SALARY FROM EMPLOYEES 
    WHERE SALARY IN
                 (SELECT SALARY FROM EMPLOYEES WHERE JOB_ID='IT_PROG')
                 AND JOB_ID!='IT_PROG'
                 ORDER BY SALARY ASC, LAST_NAME;

-- ************************************************************************************ 


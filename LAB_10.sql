-- Name : DAMIRKHON YODGOROV
-- Student Id: 108364175
-- Seneca email: dyodgorov@myseneca.ca  
-- Completion Date: 22.11.2018
-- LAB 10
--******************************************************************************************************************************

-- QUESTION 1:

-- Create the EMPLOYEES2 table based on the structure of the EMPLOYEES table. Include only the
-- EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, and DEPARTMENT_ID columns. Name the columns in
-- your new table ID, FIRST_NAME, LAST_NAME, SALARY, and DEPT_ID, respectively. 

-- ANSWERS :
   
   CREATE TABLE EMPLOYEES2 
   (ID NUMBER(6) NOT NULL,
    FIRST_NAME VARCHAR(20),
    LAST_NAME VARCHAR(20) NOT NULL,
    SALARY NUMBER(8,2),
    DEPT_ID NUMBER(4));
    
--******************************************************************************************************************************

-- QUESTION 2:
-- We want to employees inserted into EMPLOYEES2 table to meet following conditions:

-- a. The salary has to be greater than or equal 1,000 and less than 30,000. Name it salary_cst_ck.
   ALTER TABLE EMPLOYEES2 
   ADD CONSTRAINT salary_cst_ck CHECK(SALARY>=1000 AND SALARY<30000);
   
-- b. We cannot have employees with the same last name. Name it lname_cst_un
   ALTER TABLE EMPLOYEES2
   ADD CONSTRAINT lname_cst_un UNIQUE(LAST_NAME);
   
--******************************************************************************************************************************

-- QUESTION 3:
-- Add a new column EMAIL to the EMPLOYEES2 table. 
  
-- ANSWER :
  ALTER TABLE EMPLOYEES2
  ADD EMAIL VARCHAR(25);

--******************************************************************************************************************************

-- QUESTION 4:
-- Drop the EMPLOYEES2 table. 
-- ANSWER:
DROP TABLE EMPLOYEES2;


--******************************************************************************************************************************

-- QUESTION 5:
--  Create a view named ALLEMPS that consists of all employees includes employee_id, last_name, salary,
--  department_id, department_name, city and country (if applicable) 

-- ANSWER:

CREATE VIEW ALLEMPS  AS SELECT e.EMPLOYEE_ID,e.LAST_NAME, e.SALARY, e.DEPARTMENT_ID,d.DEPARTMENT_NAME,l.COUNTRY_ID, l.CITY
                        FROM EMPLOYEES  e
                        JOIN DEPARTMENTS  d ON e.DEPARTMENT_ID=d.DEPARTMENT_ID
                        JOIN LOCATIONS  l ON l.LOCATION_ID=d.LOCATION_ID;

--******************************************************************************************************************************

-- QUESTION 6:
--Use the ALLEMPS view to:
-- a. Display the employee_id, last_name, salary and city for all employees
   SELECT EMPLOYEE_ID, LAST_NAME, SALARY, CITY FROM ALLEMPS;
-- b. Display the total salary of all employees by city
   SELECT CITY, SUM(SALARY) as Total_salary FROM ALLEMPS
   GROUP BY CITY;
   
-- c. Increase the salary of the lowest paid employee(s) in each department by 100
   UPDATE ALLEMPS
   SET SALARY=SALARY+100
   WHERE SALARY IN( SELECT MIN(SALARY) FROM ALLEMPS
                    GROUP BY Department_id);
                    
-- d. What happens if you try to insert an employee by providing values for all columns in this view?
    INSERT INTO ALLEMPS VALUES(777,'NEW EMPLOYEE',70000,120,'SOMETHING NEW','CA','TORONTO');
    -- ANSWER: 
    -- If we try to insert data into the ALLEMPS view , we are going to get an error, because our view is created using three tables like employees,
    -- departments and locations 
-- e. Delete the employee named Vargas. Did it work? Show proof. 
    DELETE FROM ALLEMPS
    WHERE LAST_NAME='Vargas';
    -- ANSWER: 
    -- WHEN I tried to delete the employee named Vargas using the above query , I fortunately did not get an error;
    
--******************************************************************************************************************************
                    
-- QUESTION 7:

-- Create a view named ALLDEPTS that consists of all departments and includes department_id,
-- department_name, city and country (if applicable) 
-- ANSWER :

CREATE VIEW ALLDEPTS AS SELECT d.Department_id, d.Department_name,l.city, l.Country_id
                        FROM DEPARTMENTS d JOIN LOCATIONS l
                        ON d.LOCATION_ID=l.LOCATION_ID;

--******************************************************************************************************************************

-- QUESTION 8:
-- Use the ALLDEPTS view to:
--a. For all departments display the department_id, name and city
     SELECT DEPARTMENT_ID,DEPARTMENT_NAME, CITY FROM ALLDEPTS;
--b. For each city that has departments located in it display the number of departments by city 
     SELECT CITY,COUNT(DEPARTMENT_ID) as Number_of_departments
     FROM ALLDEPTS
     GROUP BY CITY;

--***********************************************************************************************************************

-- QUESTION 9:
-- Delete the ALLDEPTS view. 

-- ANSWER:
 DROP VIEW ALLDEPTS;
     

-- ***********************
-- Name: Damirkhon Yodgorov     
-- ID: 108364175
-- Date: 8.11.2018
-- Purpose: Lab 7 DBS301
-- ***********************

-- ***************************************************************************************************************************************************
set autocommit off;
-- QUESTION 1:
-- Create an INSERT statement to add the first row of data to the SALESREP table from the
-- above sample data. Insert NULL value for the userid column. Include the columns’ name
-- in the INSERT clause. Do not enter all rows yet.

-- ANSWER FOR QUESTION 1:

  INSERT INTO SALESREP(salesrep_id,last_name,first_name,userid,salary,office_number,office_location)
  VALUES(100,'Patel','Ralph',null,2000,'4166667777','Toronto');

-- ***************************************************************************************************************************************************

-- QUESTION 2 :

-- Populate the SALESREP table with the rest of the rows of sample data from the
-- preceding list. Insert NULL value for the userid column. (Write a single INSERT
-- statement)

-- ANSWER FRO QUESTION 2:

  INSERT ALL 
  INTO SALESREP VALUES(101,'Denis','Betty',null,1500,'9053334433','Montreal')
  INTO SALESREP VALUES(102,'Biri','Ben',null,1550,'2891118811','Vaughan')
  INTO SALESREP VALUES(103,'Newman','Chad',null,1850,'4164442299','Markham')
  INTO SALESREP VALUES(104,'Ropeburn','Audrey',null,2200,'2896667744','Newmarket')
  SELECT * FROM SALESREP;

-- ***************************************************************************************************************************************************

-- QUESTION 3:
-- Create a report that show all the inserted rows and columns from the SALESREP table.
-- How many rows are selected?

-- ANSWER FOR QUESTION 3:

   SELECT * FROM SALESREP;
   
-- After the execution of above command 5 rows were selected from SALESREP TABLE

-- ***************************************************************************************************************************************************

-- QUESTION 4:
-- Execute the rollback command. Display all rows and columns from the SALESREP table.
-- How many rows are selected?

-- ANSWER FOR QUESTION 4:
   ROLLBACK;
   SELECT * FROM SALESREP;

-- After the execution of above command 0 rows were selected from SALESREP TABLE because of the ROLLBACK command

-- ***************************************************************************************************************************************************

-- QUESTION 5:
-- Do Task 1 and Task 2 again. Make you additions permanent to the table. Display all rows
-- and columns from the SALESREP table. How many rows are selected?

-- ANSWER FOR QUESTION 5:

   INSERT ALL 
  INTO SALESREP VALUES(100,'Patel','Ralph',null,2000,'4166667777','Toronto')
  INTO SALESREP VALUES(101,'Denis','Betty',null,1500,'9053334433','Montreal')
  INTO SALESREP VALUES(102,'Biri','Ben',null,1550,'2891118811','Vaughan')
  INTO SALESREP VALUES(103,'Newman','Chad',null,1850,'4164442299','Markham')
  INTO SALESREP VALUES(104,'Ropeburn','Audrey',null,2200,'2896667744','Newmarket')
  SELECT 1 FROM dual;
   COMMIT;

  SELECT * FROM SALESREP;
-- After the execution of above command 5 rows were selected from SALESREP TABLE

-- ***************************************************************************************************************************************************
-- QUESTION 6:
-- Execute the rollback command.
   ROLLBACK;
-- a. Display all rows and columns from the SALESREP table. How many rows are
-- selected?
   SELECT * FROM SALESREP;
-- After the execution of above command 5 rows were selected from SALESREP TABLE
-- b. Did the rollback command effective?
-- No ROLLBACK command was not effective

-- c. What was the difference between the result of the rollback execution from
-- Task 4 and the result of the rollback execution of this task?
-- *****************ANSWER:*********************************
-- In TASK 4 ROLLBACK command worked because there was no COMMIT command after the insertion of data
-- But in TASK 6 ROLLBACK command was not effective because of the COMMIT command.

-- ***************************************************************************************************************************************************

-- QUESTION 7:

-- Create an INSERT statement to add rows to the SALESREP table for employees in the
-- employees table who work in sales department. Insert NULL value for the user ID and
-- office number columns. They office location value can be found for each employee from
-- other tables in the database.
-- ANSWER FOR QUESTION 7:
   INSERT INTO SALESREP(salesrep_id,last_name,first_name,userid,salary,office_number,office_location)
   SELECT e.employee_id, e.last_name,e.first_name,null,e.salary,null,l.city
   FROM EMPLOYEES e JOIN DEPARTMENTS d
   ON e.DEPARTMENT_ID=d.DEPARTMENT_ID
   JOIN LOCATIONS l
   ON l.LOCATION_ID=d.LOCATION_ID
   WHERE e.JOB_ID ='SA_REP';

-- ***************************************************************************************************************************************************

-- QUESTION 8:
-- Make your insertion permanent.

-- ANSWER FOR QUESTION 8:
   COMMIT;

-- ***************************************************************************************************************************************************

-- QUESTION 9:

-- Write an update statement to update the value of column userid for all the rows in the
-- SALESREP table. Concatenate the first letter of the first name and the first seven
-- characters of the last name to produce the user ID.

-- ANSWER FOR QUESTION 9:

   UPDATE SALESREP
   SET userid=CONCAT(SUBSTR(first_name,1,1),SUBSTR(last_name,2,7))
   WHERE userid is null;

-- ***************************************************************************************************************************************************

-- QUESTION 10:

-- Change the value of the office_number column to ‘unknown’ for sales representatives
-- with null office numbers.

-- ANSWER FOR QUESTION 10:

   UPDATE SALESREP 
   SET office_number='unknown'
   WHERE office_number is null;
   

-- ***************************************************************************************************************************************************

-- QUESTION 11:

-- Make your changes permanent.

   COMMIT;

-- ***************************************************************************************************************************************************

-- QUESTION 12:

-- Delete all sales representatives from the SALESREP table that their city is the same as
-- the city of employees working in the department with department ID 80.

-- ANSWER FOR QUESTION 12:

   DELETE FROM SALESREP
   WHERE OFFICE_LOCATION IN (SELECT l.city  FROM
                            LOCATIONS L JOIN
                            DEPARTMENTS D
                            ON L.LOCATION_ID=D.LOCATION_ID
                            JOIN
                            EMPLOYEES e
                            ON e.DEPARTMENT_ID=D.DEPARTMENT_ID
                            WHERE e.DEPARTMENT_ID=80
                            );
-- a. How many rows are deleted?
-- 35 rows were deleted 

-- b.Create a report from the SALESREP table after deletion whose city is the
-- same as the city of employees working in the department with department
-- ID 80. How many rows are selected?

-- ANSWER:
  SELECT * FROM SALESREP
  WHERE OFFICE_LOCATION IN (SELECT l.city  FROM
                            LOCATIONS L JOIN
                            DEPARTMENTS D
                            ON L.LOCATION_ID=D.LOCATION_ID
                            JOIN
                            EMPLOYEES e
                            ON e.DEPARTMENT_ID=D.DEPARTMENT_ID
                            WHERE e.DEPARTMENT_ID=80
                            );
-- After the execution of above command 0 rows were selected from SALESREP TABLE

-- c. Execute the rollback command. Execute the same SQL statement from 12.b.
-- How many rows are selected?
    ROLLBACK;
    SELECT * FROM SALESREP;
-- After the execution of above command 40 rows were selected from SALESREP TABLE

-- ***************************************************************************************************************************************************
